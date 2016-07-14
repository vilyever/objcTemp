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
    for (id argument in arguments) {
        if ([argument isKindOfClass:[VDThemeSelectorArgument class]]
            && [argument themeKey]) {
            self.themeSelectorArgument = argument;
            break;
        }
    }
    
    NSCAssert(self.themeSelectorArgument, @"ThemeManager requires arguments with a VDThemeSelectorArgument argument.");
    
    _arguments = arguments;
}

#pragma mark Overrides
- (instancetype)init {
    self = [super init];

    return self;
}

- (void)dealloc {
    
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[VDThemeElement class]]) {
        VDThemeElement *element = object;
        
        BOOL equal = YES;
        
        if (self.resourceType == VDThemeElementResourceTypeRemove
            || element.resourceType == VDThemeElementResourceTypeRemove) {
            equal = YES;
        }
        else {
            equal = self.resourceType == element.resourceType; // comment for easy remove, that the remove element can not set resourceType
        }
        
        if (equal) {
            equal = [NSStringFromSelector(self.selector) isEqualToString:NSStringFromSelector(element.selector)];
        }
        
        if (equal) {
            for (NSInteger i = 0; i < self.arguments.count; i++) {
                equal = [self.arguments[i] isEqual:element.arguments[i]];
                if (!equal) {
                    break;
                }
            }
        }
        
        
        return equal;
    }
    
    return [super isEqual:object];
}


#pragma mark Delegates


#pragma mark Private Method

@end
