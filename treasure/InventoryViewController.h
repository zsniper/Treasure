//
//  InventoryViewController.h
//  treasure
//
//  Created by zkmb on 2015-09-19.
//  Copyright © 2015 Zi Kai Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemObject.h"
#import "UserObject.h"

@interface InventoryViewController : UIViewController

@property (nonatomic, strong) ItemObject *item;
@property (nonatomic, strong) UserObject *seller;

@end
