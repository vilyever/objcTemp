//
//  UINavigationBar+VDThemeManager.h
//  objcTemp
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UINavigationBar (VDThemeManager)

#pragma mark Public Method
- (void)vd_setBarTintColorWithThemeKey:(NSString *)key;
- (void)vd_setBackgroundImageWithThemeKey:(NSString *)key forBarMetrics:(UIBarMetrics)barMetrics;
- (void)vd_setBackgroundImageWithThemeKey:(NSString *)key forBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics;
- (void)vd_setBackIndicatorImageWithThemeKey:(NSString *)key;
- (void)vd_setBackIndicatorTransitionMaskImageWithThemeKey:(NSString *)key;
- (void)vd_setShadowImageWithThemeKey:(NSString *)key;

@end
