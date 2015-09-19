//
//  CommentObject.h
//  treasure
//
//  Created by zkmb on 2015-09-19.
//  Copyright © 2015 Zi Kai Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommentObject : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIImage *profilePic;
@property (nonatomic, strong) NSDate *date;

@end
