//
//  UIViewController+VDHud.m
//  objcTemp
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import "UIViewController+VDHud.h"

//#import <objc/runtime.h>
//#import "objcTemp.h"
//@import objcTemp;

#import "UIView+VDHud.h"


@implementation UIViewController (VDHud)

#pragma mark Public Method
- (void)vd_showAsHud {
    [self.view vd_showAsHud];
}

- (void)vd_hideHud {
    [self.view vd_hideHud];
}

- (void)vd_hideHudDelay:(NSTimeInterval)delay {
    [self.view vd_hideHudDelay:delay];
}

#pragma mark Private Method


@end
