//
//  ViewController.m
//  treasure
//
//  Created by zkmb on 2015-09-19.
//  Copyright © 2015 Zi Kai Chen. All rights reserved.
//

#import "ViewController.h"
#import "UserTableViewCell.h"
#import "UserObject.h"
#import "NSDate+TimeAgo.h"
#import "UserViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *users;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (!self.users) {
        self.users = [NSMutableArray array];
    }
    
    UserObject *user = [[UserObject alloc] init];
    user.name = @"Zi Kai Chen";
    user.bio = @"Selling all my junk";
    user.location = @"Waterloo";
    user.lastPosted = [NSDate dateWithTimeIntervalSinceNow:-12310];
    user.profilePic = [UIImage imageNamed:@"user.jpg"];
    
    [self.users addObject:user];
    
    
    
    UserObject *user2 = [[UserObject alloc] init];
    user2.name = @"Justin Ng";
    user2.bio = @"Selling all my junk too";
    user2.location = @"Waterloo";
    user2.lastPosted = [NSDate dateWithTimeIntervalSinceNow:-891232];
    user2.profilePic = [UIImage imageNamed:@"user.jpg"];
    
    [self.users addObject:user2];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell"];
    
    UserObject *user = self.users[indexPath.row];
    cell.lblTitle.text = user.name;
    cell.lblSubtitle.text = user.location;
    cell.lblTime.text = [user.lastPosted timeAgo];
    cell.ivProfile.image = user.profilePic;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"userDetail" sender:self.users[indexPath.row]];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"userDetail"]) {
        UserViewController *vc = (UserViewController *)[segue destinationViewController];
        
        
//        vc.completionBlock = ^(Semester *semester) {
//            self.semester = semester;
//        };
//        
        UserObject *user = (UserObject *)sender;
        
        vc.user = user;
    }
}


@end
