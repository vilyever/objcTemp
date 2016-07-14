//
//  UIButton+VDTheme.h
//  objcTemp
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton (VDTheme)

#pragma mark Public Method
- (void)vd_setTitleColorWithThemeKey:(NSString *)key forState:(UIControlState)state;
- (void)vd_setTitleShadowColorWithThemeKey:(NSString *)key forState:(UIControlState)state;
- (void)vd_setImageWithThemeKey:(NSString *)key forState:(UIControlState)state;
- (void)vd_setBackgroundImageWithThemeKey:(NSString *)key forState:(UIControlState)state;

@end
