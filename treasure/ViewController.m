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
#import "AFNetworking.h"

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
    
//    UserObject *user = [[UserObject alloc] init];
//    user.name = @"Zi Kai Chen";
//    user.bio = @"Selling all my junk";
//    user.location = @"Waterloo";
//    user.lastPosted = [NSDate dateWithTimeIntervalSinceNow:-12310];
//    user.profilePic = [UIImage imageNamed:@"user.jpg"];
//    user.userId = 1;
//    user.inventory = [NSMutableArray array];
//    
//    [self.users addObject:user];
//    
//    
//    
//    UserObject *user2 = [[UserObject alloc] init];
//    user2.name = @"Justin Ng";
//    user2.bio = @"Selling all my junk too";
//    user2.location = @"Waterloo";
//    user2.lastPosted = [NSDate dateWithTimeIntervalSinceNow:-891232];
//    user2.profilePic = [UIImage imageNamed:@"user.jpg"];
//    user2.userId = 1;
//    user2.inventory = [NSMutableArray array];
//    
//    [self.users addObject:user2];
    
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // GET USER ITEMS
    [manager GET:@"http://ivanzhang.ca/treasure/treasure-endpoints/index.php?cmd=getusers" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSArray *responseArray = responseObject;
            for (int i = 0; i < responseArray.count; i++) {
                NSDictionary *responseItem = responseArray[i];
                
                if ([responseItem valueForKey:@"fname"] == (id)[NSNull null] ||
                    [responseItem valueForKey:@"lname"] == (id)[NSNull null] ||
                    [responseItem valueForKey:@"userid"] == (id)[NSNull null] ||
                    [responseItem valueForKey:@"items"] == (id)[NSNull null] ||
                    [responseItem valueForKey:@"image"] == (id)[NSNull null]
                    ) {
                    continue;
                }
                
                UserObject *user = [[UserObject alloc] init];
                user.name = [NSString stringWithFormat:@"%@ %@", responseItem[@"fname"], responseItem[@"lname"]];
                user.userId = [responseItem[@"userid"] intValue];
                user.location = @"Waterloo";
                user.lastPosted = [NSDate date];
                user.inventory = [NSMutableArray array];
//                user.bio = responseItem[@"bio"];
                user.bio = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ";
                
                if ([responseItem valueForKey:@"image"] != (id)[NSNull null]) {
                    NSString *base64 = [[responseItem[@"image"] componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
//                    NSLog(@"base64: %@", base64);
                    NSData *imageData = [[NSData alloc] initWithBase64EncodedString:base64 options:0];
                    UIImage *ret = [UIImage imageWithData:imageData];
                    
                    user.profilePic = ret;
                }
                
                NSArray *itemsArray = responseItem[@"items"];
                
                for (int j = 0; j < itemsArray.count; j++) {
                    NSDictionary *userItemResponse = itemsArray[j];
                    if ([responseItem valueForKey:@"image"] == (id)[NSNull null]) {
                        continue;
                    }
                    
                    NSString *base64 = [[userItemResponse[@"image"] componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
//                    NSLog(@"base64: %@", base64);
                    NSData *imageData = [[NSData alloc] initWithBase64EncodedString:base64 options:0];
                    UIImage *ret = [UIImage imageWithData:imageData];
                    if (ret) {
                        [user.inventory addObject:ret];
                    }
                }
                
                [self.users addObject:user];
            }
            [self.tableView reloadData];
            /* do something with responseArray */
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

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
    
    if (user.inventory.count >= 4) {
        cell.item4.image = user.inventory[3];
    }
    
    if (user.inventory.count >= 3) {
        cell.item3.image = user.inventory[2];
    }
    
    if (user.inventory.count >= 2) {
        cell.item2.image = user.inventory[1];
    }
    
    if (user.inventory.count >= 1) {
        cell.item1.image = user.inventory[0];
    }
    
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
