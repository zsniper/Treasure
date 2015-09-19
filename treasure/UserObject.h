//
//  UserObject.h
//  treasure
//
//  Created by zkmb on 2015-09-19.
//  Copyright © 2015 Zi Kai Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserObject : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *profilePic;
@property (nonatomic, strong) NSString *bio;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSDate *lastPosted;
@property (nonatomic, strong) NSMutableArray *inventory;

@end
