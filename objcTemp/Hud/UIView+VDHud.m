//
//  UIView+VDHud.m
//  objcTemp
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import "UIView+VDHud.h"

//#import <objc/runtime.h>
//#import "objcTemp.h"
//@import objcTemp;

#import "VDHudMaskView.h"


@implementation UIView (VDHud)

#pragma mark Public Method
- (void)vd_showAsHud {
    [VDHudMaskView showWithHudView:self];
}

- (void)vd_hideHud {
    [VDHudMaskView hideWithHudView:self];
}

- (void)vd_hideHudDelay:(NSTimeInterval)delay {
    [VDHudMaskView hideWithHudView:self delay:delay];
}

#pragma mark Private Method


@end
