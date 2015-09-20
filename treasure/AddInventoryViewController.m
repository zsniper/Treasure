//
//  AddInventoryViewController.m
//  treasure
//
//  Created by zkmb on 2015-09-19.
//  Copyright © 2015 Zi Kai Chen. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "AddInventoryViewController.h"
#import "JSImagePickerViewController.h"
#import "AFNetworking.h"

@interface AddInventoryViewController () <JSImagePickerViewControllerDelegate> {
    UIButton *btnPicture;
}
@property (weak, nonatomic) IBOutlet UIButton *btnPrimaryPic;
@property (weak, nonatomic) IBOutlet UIButton *btnPicture2;
@property (weak, nonatomic) IBOutlet UIButton *btnPicture3;
@property (weak, nonatomic) IBOutlet UITextField *tfTitle;
@property (weak, nonatomic) IBOutlet UITextField *tfPrice;
@property (weak, nonatomic) IBOutlet UITextField *tfTags;
@property (weak, nonatomic) IBOutlet UITextView *tvDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnInventory;
@property (weak, nonatomic) IBOutlet UIButton *btnIntuit;

@end

@implementation AddInventoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tvDescription.layer.borderWidth = 0.5f;
    self.tvDescription.layer.borderColor = [[UIColor colorWithWhite:205/255.0f alpha:1.0] CGColor];
    self.tvDescription.layer.masksToBounds = YES;
    self.tvDescription.layer.cornerRadius = 5.0f;
    
    
    self.btnInventory.layer.borderWidth = 1.0f;
    self.btnInventory.layer.borderColor = [[UIColor colorWithWhite:205/255.0f alpha:1.0] CGColor];
    self.btnInventory.layer.masksToBounds = YES;
    self.btnInventory.layer.cornerRadius = 5.0f;
    
    self.btnIntuit.layer.borderWidth = 1.0f;
    self.btnIntuit.layer.borderColor = [[UIColor colorWithWhite:205/255.0f alpha:1.0] CGColor];
    self.btnIntuit.layer.masksToBounds = YES;
    self.btnIntuit.layer.cornerRadius = 5.0f;
    
    self.btnPrimaryPic.titleLabel.numberOfLines = 2;
    self.btnPrimaryPic.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.btnPicture2.titleLabel.numberOfLines = 2;
    self.btnPicture2.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.btnPicture3.titleLabel.numberOfLines = 3;
    self.btnPicture3.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    // TODO: Send Ivan inventory item
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSLog(@"price text: %@", self.tfPrice.text);
    
    NSData *imageData = UIImageJPEGRepresentation(self.btnPrimaryPic.currentBackgroundImage,0.1);
    NSString *encodedString = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    NSDictionary *parameters = @{@"cmd":@"newitem",
                                 @"name": self.tfTitle.text,
                                 @"price": self.tfPrice.text,
                                 @"userid": @1,
                                 @"tags": self.tfTags.text,
                                 @"description": self.tvDescription.text,
                                 @"image":encodedString};


    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    [manager.requestSerializer setValue:@"text/html" forHTTPHeaderField:@"Content-Type"];
    
    NSLog(@"imageData.length: %lu", (unsigned long)imageData.length);
    [manager POST:@"http://ivanzhang.ca/treasure/treasure-endpoints/index.php" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileData:imageData name:@"files" fileName:@"pic.jpg" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)addPrimaryPic:(id)sender {
    btnPicture = (UIButton *)sender;
    JSImagePickerViewController *imagePicker = [[JSImagePickerViewController alloc] init];
    imagePicker.delegate = self;
    [imagePicker showImagePickerInController:self animated:YES];
}
- (void)imagePicker:(JSImagePickerViewController *)imagePicker didSelectImage:(UIImage *)image {
    [btnPicture setBackgroundImage:image forState:UIControlStateNormal];
    [btnPicture setTitle:@"" forState:UIControlStateNormal];
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
