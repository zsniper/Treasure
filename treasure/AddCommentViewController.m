//
//  AddCommentViewController.m
//  treasure
//
//  Created by zkmb on 2015-09-20.
//  Copyright © 2015 Zi Kai Chen. All rights reserved.
//

#import "AddCommentViewController.h"
#import "AFNetworking.h"

@interface AddCommentViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tvComment;

@end

@implementation AddCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)done:(id)sender {
    // TODO: send to the endpoint
    int userId = self.user.userId;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSLog(@"userId: %d", userId);
    
    NSDictionary *parameters = @{@"cmd":@"newcomment",
                                 @"commenterid": @1,
                                 @"userid": [NSString stringWithFormat:@"%d", userId],
                                 @"comment": self.tvComment.text};
    
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    [manager.requestSerializer setValue:@"text/html" forHTTPHeaderField:@"Content-Type"];
    
    [manager POST:@"http://ivanzhang.ca/treasure/treasure-endpoints/index.php" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //        [formData appendPartWithFileData:imageData name:@"files" fileName:@"pic.jpg" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
