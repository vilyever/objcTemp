//
//  UILabel+VDThemeManager.m
//  objcTemp
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import "UILabel+VDThemeManager.h"
#import "VDThemeManager.h"

//#import <objc/runtime.h>
//#import "objcTemp.h"
//@import objcTemp;


@implementation UILabel (VDThemeManager)

#pragma mark Public Method
- (void)vd_setTextColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self withSelector:@selector(setTextColor:) withArguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setTextColor:) withArguments:@[argument1]];
    }
}

- (void)vd_setShadowColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self withSelector:@selector(setShadowColor:) withArguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setShadowColor:) withArguments:@[argument1]];
    }
}

- (void)vd_setHighlightedTextColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self withSelector:@selector(setHighlightedTextColor:) withArguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setHighlightedTextColor:) withArguments:@[argument1]];
    }
}

#pragma mark Private Method


@end
