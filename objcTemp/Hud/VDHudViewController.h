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
- (UIColor *)hudBackgroundColor;
- (CGFloat)hudCornerRadius;
- (CGSize)hudSize;

#pragma mark Properties

@end
