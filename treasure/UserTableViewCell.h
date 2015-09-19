//
//  UserTableViewCell.h
//  treasure
//
//  Created by zkmb on 2015-09-19.
//  Copyright © 2015 Zi Kai Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *ivProfile;
@property (nonatomic, weak) IBOutlet UILabel *lblTitle;
@property (nonatomic, weak) IBOutlet UILabel *lblSubtitle;
@property (nonatomic, weak) IBOutlet UILabel *lblTime;
@property (nonatomic, weak) IBOutlet UIImageView *item1;
@property (nonatomic, weak) IBOutlet UIImageView *item2;
@property (nonatomic, weak) IBOutlet UIImageView *item3;
@property (nonatomic, weak) IBOutlet UIImageView *item4;

@end
