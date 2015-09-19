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

@interface UserViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;


@property (nonatomic, strong) NSMutableArray *items;

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

    self.collectionView.contentInset = UIEdgeInsetsMake(4, 4, 4, 4);
    
    if (!self.items) {
        self.items = [NSMutableArray array];
    }
    
    ItemObject *item = [[ItemObject alloc] init];
    
    item.title = @"Potato Chip";
    item.price = @"$5.00";
    item.primaryPic = [UIImage imageNamed:@"286812__angry-tiger_p.jpg"];
//    item.primaryPic = [UIImage imageNamed:@"Untitled1.png"];
    item.picture1 = [UIImage imageNamed:@"Untitled2.png"];
    item.picture2 = [UIImage imageNamed:@"Untitled3.png"];
    item.picture3 = [UIImage imageNamed:@"Untitled4.png"];
    item.datePosted = [NSDate date];
    item.description = @"These are yummy potato jobs";
    
    [self.items addObject:item];
    
    
    ItemObject *item2 = [[ItemObject alloc] init];
    
    item2.title = @"Potato Chip";
    item2.price = @"$5.00";
    item2.primaryPic = [UIImage imageNamed:@"A-tiger-up-close-010.jpg"];
//    item2.primaryPic = [UIImage imageNamed:@"Untitled2.png"];
    item2.picture1 = [UIImage imageNamed:@"Untitled2.png"];
    item2.picture2 = [UIImage imageNamed:@"Untitled3.png"];
    item2.picture3 = [UIImage imageNamed:@"Untitled4.png"];
    item2.datePosted = [NSDate date];
    item2.description = @"These are yummy potato jobs";
    
    [self.items addObject:item2];
    
    
    ItemObject *item3 = [[ItemObject alloc] init];
    
    item3.title = @"Potato Chip";
    item3.price = @"$5.00";
    item3.primaryPic = [UIImage imageNamed:@"arrow-poster.jpg"];
//    item3.primaryPic = [UIImage imageNamed:@"Untitled3.png"];
    item3.picture1 = [UIImage imageNamed:@"Untitled2.png"];
    item3.picture2 = [UIImage imageNamed:@"Untitled3.png"];
    item3.picture3 = [UIImage imageNamed:@"Untitled4.png"];
    item3.datePosted = [NSDate date];
    item3.description = @"These are yummy potato jobs";
    
    [self.items addObject:item3];
    
    NSLog(@"items: %@", self.items);
        
    [self.collectionView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    if (!self.user) {
        self.user = [[UserObject alloc] init];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.collectionView.bounds.size.width, 160);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
          viewForSupplementaryElementOfKind:(NSString *)kind
                                atIndexPath:(NSIndexPath *)indexPath
{
    UserHeaderReusableView *reView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionHeader" forIndexPath:indexPath];
    
    
    reView.lblName.text = self.user.name;
    reView.lblLocation.text = self.user.location;
    reView.tvBio.text = self.user.bio;
    reView.ivProfilePic.image = self.user.profilePic;
    
    [reView.tvBio setFont: [UIFont systemFontOfSize:15]];
    
    return reView;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    
    ItemObject *item = self.items[indexPath.row];
    cell.ivItem.image = item.primaryPic;
    cell.lblPrice.text = item.price;
    
    return cell;
}


-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSString *imagePath = [[self sampleImagesBundlePath] stringByAppendingPathComponent:self.sourceArray[indexPath.item]];
    ItemObject *item = self.items[indexPath.item];
    CGSize finalSize = item.primaryPic.size;
    
    NSLog(@"final size: %@", NSStringFromCGSize(finalSize));
    
    return finalSize;
}


@end
