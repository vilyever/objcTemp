//
//  UIView+VDTheme.h
//  objcTemp
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (VDTheme)

#pragma mark Public Method
- (void)vd_setBackgroundColorWithThemeKey:(NSString *)key;
- (void)vd_setTintColorWithThemeKey:(NSString *)key;

@end
