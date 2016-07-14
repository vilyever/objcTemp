//
//  UIImageView+VDThemeManager.h
//  objcTemp
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImageView (VDThemeManager)

#pragma mark Public Method
- (void)vd_setImageWithThemeKey:(NSString *)key;
- (void)vd_setHighlightedImageImageWithThemeKey:(NSString *)key;


@end
