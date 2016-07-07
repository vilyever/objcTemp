//
//  VDThemeSelectorArgument.m
//  objcTemp
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import "VDThemeSelectorArgument.h"


@interface VDThemeSelectorArgument ()


@end


@implementation VDThemeSelectorArgument

#pragma mark Public Method
+ (instancetype)argumentWithThemeKey:(NSString *)themeKey {
    VDThemeSelectorArgument *argument = [[VDThemeSelectorArgument alloc] init];
    argument.themeKey = themeKey;
    return argument;
}

#pragma mark Properties


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Private Method

@end
