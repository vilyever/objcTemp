//
//  UIImageView+VDTheme.h
//  objcTemp
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImageView (VDTheme)

#pragma mark Public Method
- (void)vd_setImageWithThemeKey:(NSString *)key;
- (void)vd_setHighlightedImageImageWithThemeKey:(NSString *)key;

@end
