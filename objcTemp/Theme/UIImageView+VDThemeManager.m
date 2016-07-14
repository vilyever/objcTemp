//
//  UIImageView+VDThemeManager.m
//  objcTemp
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import "UIImageView+VDThemeManager.h"
#import "VDThemeManager.h"
//#import <objc/runtime.h>
//#import "objcTemp.h"
//@import objcTemp;


@implementation UIImageView (VDThemeManager)

#pragma mark Public Method
- (void)vd_setImageWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setImageForTarget:self withSelector:@selector(setImage:) withArguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setImage:) withArguments:@[argument1]];
    }
}

- (void)vd_setHighlightedImageImageWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setImageForTarget:self withSelector:@selector(setHighlightedImage:) withArguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self withSelector:@selector(setHighlightedImage:) withArguments:@[argument1]];
    }
}

#pragma mark Private Method


@end
