//
//  VDThemeSelectorArgument.h
//  objcTemp
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import <objcTemp/objcTemp.h>


@class VDThemeSelectorArgument;


@interface VDThemeSelectorArgument : VDSelectorArgument

#pragma mark Public Method
+ (instancetype)argumentWithThemeKey:(NSString *)themeKey;

#pragma mark Properties
@property (nonatomic, copy) NSString *themeKey;

@end
