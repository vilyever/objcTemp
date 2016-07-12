//
//  VDHudViewController.h
//  objcTemp
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+VDHud.h"


@class VDHudViewController;

@interface VDHudViewController : UIViewController

#pragma mark Public Method

#pragma mark Properties
@property (nonatomic, assign) CGSize hudSize;
@property (nonatomic, strong) UIColor *hudBackgroundColor;
@property (nonatomic, assign) CGFloat hudCornerRadius;

@end
