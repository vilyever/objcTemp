//
//  UIButton+VDTheme.m
//  objcTemp
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import "UIButton+VDTheme.h"
#import "VDThemeManager.h"

//#import <objc/runtime.h>
//#import "objcTemp.h"
//@import objcTemp;


@implementation UIButton (VDTheme)

#pragma mark Public Method
- (void)vd_setTitleColorWithThemeKey:(NSString *)key forState:(UIControlState)state {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:state];
    
    if (key) {
        [VDThemeManager setColorForTarget:self withSelector:@selector(setTitleColor:forState:) withArguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setTitleColor:forState:) withArguments:@[argument1, argument2]];
    }
}

- (void)vd_setTitleShadowColorWithThemeKey:(NSString *)key forState:(UIControlState)state {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:state];
    
    if (key) {
        [VDThemeManager setColorForTarget:self withSelector:@selector(setTitleShadowColor:forState:) withArguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setTitleShadowColor:forState:) withArguments:@[argument1, argument2]];
    }
    
}

- (void)vd_setImageWithThemeKey:(NSString *)key forState:(UIControlState)state {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:state];
    
    if (key) {
        [VDThemeManager setImageForTarget:self withSelector:@selector(setImage:forState:) withArguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setImage:forState:) withArguments:@[argument1, argument2]];
    }
}

- (void)vd_setBackgroundImageWithThemeKey:(NSString *)key forState:(UIControlState)state {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:state];
    
    if (key) {
        [VDThemeManager setImageForTarget:self withSelector:@selector(setBackgroundImage:forState:) withArguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setBackgroundImage:forState:) withArguments:@[argument1, argument2]];
    }
}

#pragma mark Private Method


@end
