//
//  UserHeaderReusableView.h
//  treasure
//
//  Created by zkmb on 2015-09-19.
//  Copyright © 2015 Zi Kai Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserHeaderReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIImageView *ivProfilePic;
@property (weak, nonatomic) IBOutlet UILabel *lblLocation;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UITextView *tvBio;

@end
