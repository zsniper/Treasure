//
//  ItemObject.h
//  treasure
//
//  Created by zkmb on 2015-09-19.
//  Copyright © 2015 Zi Kai Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ItemObject : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) UIImage *primaryPic;
@property (nonatomic, strong) UIImage *picture1;
@property (nonatomic, strong) UIImage *picture2;
@property (nonatomic, strong) UIImage *picture3;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSDate *datePosted;

@end
