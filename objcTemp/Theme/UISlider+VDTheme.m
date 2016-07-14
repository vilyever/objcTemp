//
//  UISlider+VDTheme.m
//  objcTemp
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import "UISlider+VDTheme.h"
#import "VDThemeManager.h"

//#import <objc/runtime.h>
//#import "objcTemp.h"
//@import objcTemp;


@implementation UISlider (VDTheme)

#pragma mark Public Method
- (void)vd_setThumbTintColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self withSelector:@selector(setThumbTintColor:) withArguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setThumbTintColor:) withArguments:@[argument1]];
    }
}

- (void)vd_setMinimumTrackTintColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self withSelector:@selector(setMinimumTrackTintColor:) withArguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setMinimumTrackTintColor:) withArguments:@[argument1]];
    }
}

- (void)vd_setMaximumTrackTintColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self withSelector:@selector(setMaximumTrackTintColor:) withArguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setMaximumTrackTintColor:) withArguments:@[argument1]];
    }
}

- (void)vd_setMinimumValueImageWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setImageForTarget:self withSelector:@selector(setMinimumValueImage:) withArguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setMinimumValueImage:) withArguments:@[argument1]];
    }
}

- (void)vd_setMaximumValueImageWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setImageForTarget:self withSelector:@selector(setMaximumValueImage:) withArguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setMaximumValueImage:) withArguments:@[argument1]];
    }
}

- (void)vd_setThumbImageWithThemeKey:(NSString *)key forState:(UIControlState)state {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:state];
    
    if (key) {
        [VDThemeManager setImageForTarget:self withSelector:@selector(setThumbImage:forState:) withArguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setThumbImage:forState:) withArguments:@[argument1, argument2]];
    }
}

- (void)vd_setMinimumTrackImageWithThemeKey:(NSString *)key forState:(UIControlState)state {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:state];
    
    if (key) {
        [VDThemeManager setImageForTarget:self withSelector:@selector(setMinimumTrackImage:forState:) withArguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setMinimumTrackImage:forState:) withArguments:@[argument1, argument2]];
    }
}

- (void)vd_setMaximumTrackImageWithThemeKey:(NSString *)key forState:(UIControlState)state {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:state];
    
    if (key) {
        [VDThemeManager setImageForTarget:self withSelector:@selector(setMaximumTrackImage:forState:) withArguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setMaximumTrackImage:forState:) withArguments:@[argument1, argument2]];
    }
}

#pragma mark Private Method


@end
