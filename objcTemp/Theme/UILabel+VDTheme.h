//
//  UILabel+VDTheme.h
//  objcTemp
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UILabel (VDTheme)

#pragma mark Public Method
- (void)vd_setTextColorWithThemeKey:(NSString *)key;
- (void)vd_setShadowColorWithThemeKey:(NSString *)key;
- (void)vd_setHighlightedTextColorWithThemeKey:(NSString *)key;

@end
