//
//  UIView+VDThemeManager.h
//  objcTemp
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (VDThemeManager)

#pragma mark Public Method
- (void)vd_setBackgroundColorWithThemeKey:(NSString *)key;
- (void)vd_setTintColorWithThemeKey:(NSString *)key;
@end
