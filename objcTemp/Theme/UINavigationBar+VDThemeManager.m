//
//  UINavigationBar+VDThemeManager.m
//  objcTemp
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "UINavigationBar+VDThemeManager.h"
#import "VDThemeManager.h"

//#import <objc/runtime.h>
//#import "objcTemp.h"
//@import objcTemp;


@implementation UINavigationBar (VDThemeManager)

#pragma mark Public Method
- (void)vd_setBarTintColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self withSelector:@selector(setBarTintColor:) withArguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setBarTintColor:) withArguments:@[argument1]];
    }
}

- (void)vd_setBackgroundImageWithThemeKey:(NSString *)key forBarMetrics:(UIBarMetrics)barMetrics {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:barMetrics];
    
    if (key) {
        [VDThemeManager setImageForTarget:self withSelector:@selector(setBackgroundImage:forBarMetrics:) withArguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setBackgroundImage:forBarMetrics:) withArguments:@[argument1, argument2]];
    }
}

- (void)vd_setBackgroundImageWithThemeKey:(NSString *)key forBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:barPosition];
    VDThemeSelectorArgument *argument3 = [VDThemeSelectorArgument argumentWithIntegerArgument:barMetrics];
    
    if (key) {
        [VDThemeManager setImageForTarget:self withSelector:@selector(setBackgroundImage:forBarPosition:barMetrics:) withArguments:@[argument1, argument2, argument3]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setBackgroundImage:forBarPosition:barMetrics:) withArguments:@[argument1, argument2, argument3]];
    }
}

- (void)vd_setBackIndicatorImageWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setImageForTarget:self withSelector:@selector(setBackIndicatorImage:) withArguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setBackIndicatorImage:) withArguments:@[argument1]];
    }
}

- (void)vd_setBackIndicatorTransitionMaskImageWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setImageForTarget:self withSelector:@selector(setBackIndicatorTransitionMaskImage:) withArguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setBackIndicatorTransitionMaskImage:) withArguments:@[argument1]];
    }
}

- (void)vd_setShadowImageWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setImageForTarget:self withSelector:@selector(setShadowImage:) withArguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setShadowImage:) withArguments:@[argument1]];
    }
}


#pragma mark Private Method


@end
