//
//  VDThemeElement.m
//  objcTemp
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import "VDThemeElement.h"


@interface VDThemeElement ()


@end


@implementation VDThemeElement

#pragma mark Public Method
+ (instancetype)elementWithResourceType:(VDThemeElementResourceType)resourceType withSelector:(SEL)selector withArguments:(NSArray *)arguments {
    VDThemeElement *element = [[VDThemeElement alloc] init];
    element.resourceType = resourceType;
    element.selector = selector;
    element.arguments = arguments;
    return element;
}

#pragma mark Properties
- (void)setArguments:(NSArray *)arguments {
    BOOL hasThemeArgument = NO;
    for (id argument in arguments) {
        if ([argument isKindOfClass:[VDThemeSelectorArgument class]]) {
            self.themeSelectorArgument = argument;
            hasThemeArgument = YES;
            break;
        }
    }
    
    NSCAssert(!hasThemeArgument, @"ThemeManager requires arguments with a VDThemeSelectorArgument argument.");
}

#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    if (self) {
        [self internalInit];
    }
    
    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Private Method
- (void)internalInit {
    
}

@end
