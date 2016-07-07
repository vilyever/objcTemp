//
//  UIView+VDThemeManager.m
//  objcTemp
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import "UIView+VDThemeManager.h"
#import "VDThemeManager.h"
#import "VDThemeSelectorArgument.h"

//#import <objc/runtime.h>


@implementation UIView (VDThemeManager)

#pragma mark Public Method
- (void)vd_setBackgroundColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    [VDThemeManager setColorForTarget:self withSelector:@selector(setBackgroundColor:) withArguments:@[argument1]];
}

#pragma mark Private Method


@end
