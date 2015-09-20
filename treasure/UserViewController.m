//
//  UserViewController.m
//  treasure
//
//  Created by zkmb on 2015-09-19.
//  Copyright © 2015 Zi Kai Chen. All rights reserved.
//

#import "UserViewController.h"
#import "ItemCollectionViewCell.h"
#import "ItemObject.h"
#import "FBLikeLayout.h"
#import "UserHeaderReusableView.h"
#import "CommentTableViewCell.h"
#import "NSDate+TimeAgo.h"
#import "CommentObject.h"
#import "InventoryViewController.h"
#import "AFNetworking.h"
#import "AddCommentViewController.h"

@interface UserViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITableView *commentsView;

@property (weak, nonatomic) IBOutlet UIImageView *ivProfilePic;
@property (weak, nonatomic) IBOutlet UILabel *lblLocation;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UITextView *tvBio;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentBar;


@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSMutableArray *comments;

@end

@implementation UserViewController


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    if(![self.collectionView.collectionViewLayout isKindOfClass:[FBLikeLayout class]]){
        FBLikeLayout *layout = [FBLikeLayout new];
        layout.minimumInteritemSpacing = 4;
        layout.singleCellWidth = (MIN(self.collectionView.bounds.size.width, self.collectionView.bounds.size.height)-self.collectionView.contentInset.left-self.collectionView.contentInset.right-8)/3.0;
        NSLog(@ "singleCellWidth: %f", layout.singleCellWidth);
        layout.maxCellSpace = 3;
        layout.forceCellWidthForMinimumInteritemSpacing = YES;
        layout.fullImagePercentageOfOccurrency = 50;
        self.collectionView.collectionViewLayout = layout;
        
        [self.collectionView reloadData];
    } else {
        //[self.collectionView.collectionViewLayout invalidateLayout];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.collectionView.contentInset = UIEdgeInsetsMake(4, 4, 4, 4);
    
    if (!self.items) {
        self.items = [NSMutableArray array];
    }
    
//    ItemObject *item = [[ItemObject alloc] init];
//    
//    item.title = @"Potato Chip";
//    item.price = @"$5.00";
//    item.primaryPic = [UIImage imageNamed:@"286812__angry-tiger_p.jpg"];
////    item.primaryPic = [UIImage imageNamed:@"Untitled1.png"];
//    item.picture1 = [UIImage imageNamed:@"Untitled2.png"];
//    item.picture2 = [UIImage imageNamed:@"Untitled3.png"];
//    item.picture3 = [UIImage imageNamed:@"Untitled4.png"];
//    item.datePosted = [NSDate date];
//    item.description = @"These are yummy potato jobs";
//    
//    [self.items addObject:item];
//    
//    
//    ItemObject *item2 = [[ItemObject alloc] init];
//    
//    item2.title = @"Potato Chip";
//    item2.price = @"$5.00";
//    item2.primaryPic = [UIImage imageNamed:@"A-tiger-up-close-010.jpg"];
////    item2.primaryPic = [UIImage imageNamed:@"Untitled2.png"];
//    item2.picture1 = [UIImage imageNamed:@"Untitled2.png"];
//    item2.picture2 = [UIImage imageNamed:@"Untitled3.png"];
//    item2.picture3 = [UIImage imageNamed:@"Untitled4.png"];
//    item2.datePosted = [NSDate date];
//    item2.description = @"These are yummy potato jobs";
//    
//    [self.items addObject:item2];
//    
//    
//    ItemObject *item3 = [[ItemObject alloc] init];
//    
//    item3.title = @"Potato Chip";
//    item3.price = @"$5.00";
//    item3.primaryPic = [UIImage imageNamed:@"arrow-poster.jpg"];
////    item3.primaryPic = [UIImage imageNamed:@"Untitled3.png"];
//    item3.picture1 = [UIImage imageNamed:@"Untitled2.png"];
//    item3.picture2 = [UIImage imageNamed:@"Untitled3.png"];
//    item3.picture3 = [UIImage imageNamed:@"Untitled4.png"];
//    item3.datePosted = [NSDate date];
//    item3.description = @"These are yummy potato jobs";
//    
//    [self.items addObject:item3];
    
    NSLog(@"items: %@", self.items);
        
//    [self.collectionView reloadData];
    
    // TABLE
    
    self.commentsView.estimatedRowHeight = 44.0 ;
    self.commentsView.rowHeight = UITableViewAutomaticDimension;
    
    if (!self.comments) {
        self.comments = [NSMutableArray array];
    }
    
    CommentObject *comment = [[CommentObject alloc] init];
    
    comment.username = @"Ivan Zhang";
    comment.text = @"Very good service, would recommend";
    comment.profilePic = [UIImage imageNamed:@"286812__angry-tiger_p.jpg"];
    comment.date = [NSDate date];
    
    [self.comments addObject:comment];
    
    
    CommentObject *comment2 = [[CommentObject alloc] init];
    
    comment2.username = @"Ivan Zhang";
    comment2.text = @"Very good service, would recommend. ajknsdk ajsndkj anskjd nskjdhfb skjdhfb skjdfb skjhdfb skjhdf nksjdhfbjshdbf kjshbdfk hjsdbf kjhsdfjkhsdfb kjshdbfsjkhdbf jshdnf bskjhdfb sjkhdbf sjkhdbf hjksd";
    comment2.profilePic = [UIImage imageNamed:@"286812__angry-tiger_p.jpg"];
    comment2.date = [NSDate date];
    
    [self.comments addObject:comment2];
    
    CommentObject *comment3 = [[CommentObject alloc] init];
    
    comment3.username = @"Ivan Zhang";
    comment3.text = @"Very good service, would recommend.a sjkdanskjdn kjasnd aksnd akjsdn akjsdn kanjd askj nakjsd kjasdn kjasnd ";
    comment3.profilePic = [UIImage imageNamed:@"286812__angry-tiger_p.jpg"];
    comment3.date = [NSDate date];
    
    [self.comments addObject:comment3];
    
    [self.commentsView reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    if (!self.user) {
        self.user = [[UserObject alloc] init];
    }
    
    self.lblName.text = self.user.name;
    self.lblLocation.text = self.user.location;
//    [self.tvBio setText:self.user.bio];
    self.ivProfilePic.image = self.user.profilePic;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // GET USER ITEMS
    [manager GET:[NSString stringWithFormat:@"%@%d",@"http://ivanzhang.ca/treasure/treasure-endpoints/index.php?cmd=getuseritems&userid=",self.user.userId] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSArray *responseArray = responseObject;
            for (int i = 0; i < responseArray.count; i++) {
                NSDictionary *responseItem = responseArray[i];
                
                if ([responseItem valueForKey:@"name"] == (id)[NSNull null] ||
                    [responseItem valueForKey:@"price"] == (id)[NSNull null] ||
                    [responseItem valueForKey:@"image"] == (id)[NSNull null] ||
                    [responseItem valueForKey:@"created_at"] == (id)[NSNull null] ||
                    [responseItem[@"image"] length] == 0
                    ) {
                    continue;
                }
                
                ItemObject *item = [[ItemObject alloc] init];
                item.title = responseItem[@"name"];
                item.price = [responseItem[@"price"] stringValue];
            
                NSString *base64 = [[responseItem[@"image"] componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
                NSLog(@"base64: %@", base64);
                NSData *imageData = [[NSData alloc] initWithBase64EncodedString:base64 options:0];
                UIImage *ret = [UIImage imageWithData:imageData];
                
                item.primaryPic = ret;
                item.picture1 = [UIImage imageNamed:@"Untitled2.png"];
                item.picture2 = [UIImage imageNamed:@"Untitled3.png"];
                item.picture3 = [UIImage imageNamed:@"Untitled4.png"];
                item.datePosted = [NSDate dateWithTimeIntervalSince1970:[responseItem[@"created_at"] intValue]];
                item.description = responseItem[@"name"];
                
                [self.items addObject:item];
            }
            [self.collectionView reloadData];
            /* do something with responseArray */
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    // GET USER COMMENTS
    [manager GET:[NSString stringWithFormat:@"%@%d",@"http://ivanzhang.ca/treasure/treasure-endpoints/index.php?cmd=getusercomments&userid=",self.user.userId] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSArray *responseArray = responseObject;
            for (int i = 0; i < responseArray.count; i++) {
                NSDictionary *responseItem = responseArray[i];
                
                if ([responseItem valueForKey:@"commenterid"] == (id)[NSNull null] ||
                    [responseItem valueForKey:@"comment"] == (id)[NSNull null] ||
                    [responseItem valueForKey:@"fname"] == (id)[NSNull null] ||
                    [responseItem valueForKey:@"lname"] == (id)[NSNull null] ||
                    [responseItem valueForKey:@"created_at"] == (id)[NSNull null] //||
//                    [responseItem[@"image"] length] == 0
                    ) {
                    continue;
                }
                
                CommentObject *comment = [[CommentObject alloc] init];
                comment.text = responseItem[@"comment"];
                comment.username = [NSString stringWithFormat:@"%@ %@", responseItem[@"fname"], responseItem[@"lname"]];
                
                if ([responseItem valueForKey:@"image"] != (id)[NSNull null]) {
                    NSString *base64 = [[responseItem[@"image"] componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
                    NSData *imageData = [[NSData alloc] initWithBase64EncodedString:base64 options:0];
                    UIImage *ret = [UIImage imageWithData:imageData];
                    comment.profilePic = ret;
                }
                
                comment.date = [NSDate dateWithTimeIntervalSince1970:[responseItem[@"created_at"] intValue]];
                
                [self.comments addObject:comment];
            }
            [self.commentsView reloadData];
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

- (IBAction)segmentChanged:(id)sender {
    UISegmentedControl *control = (UISegmentedControl *)sender;
    NSInteger selectedSegment = control.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        self.commentsView.hidden = YES;
        self.collectionView.hidden = NO;
    } else {
        self.commentsView.hidden = NO;
        self.collectionView.hidden = YES;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"self.items.count: %ld", self.items.count);
    return self.items.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


//-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//    return CGSizeMake(self.collectionView.bounds.size.width, 30);
//}

//-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    return CGSizeMake(self.collectionView.bounds.size.width, 160);
//}
//
//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
//          viewForSupplementaryElementOfKind:(NSString *)kind
//                                atIndexPath:(NSIndexPath *)indexPath
//{
//    UserHeaderReusableView *reView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionHeader" forIndexPath:indexPath];
//    
//    
//    reView.lblName.text = self.user.name;
//    reView.lblLocation.text = self.user.location;
//    reView.tvBio.text = self.user.bio;
//    reView.ivProfilePic.image = self.user.profilePic;
//    
//    [reView.tvBio setFont: [UIFont systemFontOfSize:15]];
//    
//    return reView;
//}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    ItemObject *item = self.items[indexPath.row];
    //    if (item.primaryPic) {
    NSLog(@"item.name: %@", item.title);
    cell.ivItem.image = item.primaryPic;
//    }
    cell.lblPrice.text = item.price ? [NSString stringWithFormat:@"$%@",item.price] : @"";
    
    
    return cell;
}


-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSString *imagePath = [[self sampleImagesBundlePath] stringByAppendingPathComponent:self.sourceArray[indexPath.item]];
    ItemObject *item = self.items[indexPath.item];
    CGSize finalSize = item.primaryPic.size;
    
    NSLog(@"final size: %@", NSStringFromCGSize(finalSize));
    
    return finalSize;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"inventoryDetails" sender:self.items[indexPath.row]];
    
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"inventoryDetails"]) {
        InventoryViewController *vc = (InventoryViewController *)[segue destinationViewController];
        
        ItemObject *item = (ItemObject *)sender;
        
        vc.item = item;
        vc.seller = self.user;
    } else if ([[segue identifier] isEqualToString:@"addFeedback"]) {
        
        AddCommentViewController *vc = (AddCommentViewController *)[[segue destinationViewController] topViewController];
        
        vc.user = self.user;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.comments.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell"];
    
    CommentObject *comment = self.comments[indexPath.row];
    cell.lblName.text = comment.username;
    cell.lblDate.text = [comment.date timeAgo];
    cell.lblComment.text = comment.text;
    cell.ivProfilePic.image = comment.profilePic ? comment.profilePic : [UIImage imageNamed:@"user.jpg"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


@end
