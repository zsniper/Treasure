//
//  InventoryViewController.m
//  treasure
//
//  Created by zkmb on 2015-09-19.
//  Copyright © 2015 Zi Kai Chen. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "InventoryViewController.h"
#import "AFNetworking.h"
#import "NSDate+TimeAgo.h"

@interface InventoryViewController () {
    UIButton *btnPicture;
}
@property (weak, nonatomic) IBOutlet UIButton *btnPrimaryPic;
@property (weak, nonatomic) IBOutlet UIButton *btnPicture2;
@property (weak, nonatomic) IBOutlet UIButton *btnPicture3;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblUsername;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UIImageView *ivProfilePic;
@property (weak, nonatomic) IBOutlet UITextView *tvDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnContactSeller;

@end

@implementation InventoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.btnContactSeller.layer.borderWidth = 1.0f;
    self.btnContactSeller.layer.borderColor = [[UIColor colorWithWhite:205/255.0f alpha:1.0] CGColor];
    self.btnContactSeller.layer.masksToBounds = YES;
    self.btnContactSeller.layer.cornerRadius = 8.0f;
    
    self.btnPrimaryPic.titleLabel.numberOfLines = 2;
    self.btnPrimaryPic.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.btnPicture2.titleLabel.numberOfLines = 2;
    self.btnPicture2.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.btnPicture3.titleLabel.numberOfLines = 3;
    self.btnPicture3.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)viewWillAppear:(BOOL)animated {
    self.ivProfilePic.image = self.seller.profilePic;
    self.lblTitle.text = self.item.title;
    self.lblUsername.text = self.seller.name;
    self.lblPrice.text = self.item.price;
    self.tvDescription.text = self.item.description;
    self.lblDate.text = [self.item.datePosted timeAgo];
    
    [self.btnPrimaryPic setBackgroundImage:self.item.primaryPic forState:UIControlStateNormal];
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:@"http://ivanzhang.ca/treasure/treasure-endpoints/index.php?cmd=getuseritems&userid=1" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
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
