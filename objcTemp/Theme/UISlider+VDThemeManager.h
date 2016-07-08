//
//  UISlider+VDThemeManager.h
//  objcTemp
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UISlider (VDThemeManager)

#pragma mark Public Method
- (void)vd_setThumbTintColorWithThemeKey:(NSString *)key;
- (void)vd_setMaximumTrackTintColorWithThemeKey:(NSString *)key;
- (void)vd_setMinimumTrackTintColorWithThemeKey:(NSString *)key;
- (void)vd_setMinimumValueImageWithThemeKey:(NSString *)key;
- (void)vd_setMaximumValueImageWithThemeKey:(NSString *)key;
- (void)vd_setThumbImageWithThemeKey:(NSString *)key forState:(UIControlState)state;
- (void)vd_setMinimumTrackImageWithThemeKey:(NSString *)key forState:(UIControlState)state;
- (void)vd_setMaximumTrackImageWithThemeKey:(NSString *)key forState:(UIControlState)state;

@end
