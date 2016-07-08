//
//  NSObject+VDThemeManager.m
//  objcTemp
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import "NSObject+VDThemeManager.h"

#import <objc/runtime.h>
#import "VDThemeManager.h"
#import "NSObject+VDSelectorArgument.h"
#import "NSObject+VDEnhance.h"


@implementation NSObject (VDThemeManager)


#pragma mark Public Method
- (void)vd_addThemeElement:(VDThemeElement *)element {
    if (![[self vd_themeElements] containsObject:element]) {
        [[self vd_themeElements] addObject:element];
        [self vd_performElement:element];
    }
}

- (void)vd_removeThemeElement:(VDThemeElement *)element {
    [[self vd_themeElements] removeObject:element];
}

- (void)vd_clearThemeElements {
    [[self vd_themeElements] removeAllObjects];
}

- (void)vd_performElement:(VDThemeElement *)element {
    if ([VDThemeManager vd_sharedInstance].animationDuration <= 0) {
        switch (element.resourceType) {
            case VDThemeElementResourceTypeColor: {
                UIColor *color = [VDThemeManager colorForKey:element.themeSelectorArgument.themeKey];
                element.themeSelectorArgument.strongObject = color;
                [self vd_performSelector:element.selector withArguments:element.arguments];
                break;
            }
            case VDThemeElementResourceTypeImage: {
                UIImage *image = [VDThemeManager imageForKey:element.themeSelectorArgument.themeKey];
                element.themeSelectorArgument.strongObject = image;
                [self vd_performSelector:element.selector withArguments:element.arguments];
                break;
            }
            case VDThemeElementResourceTypeFont: {
                UIFont *font = [VDThemeManager fontForKey:element.themeSelectorArgument.themeKey];
                element.themeSelectorArgument.strongObject = font;
                [self vd_performSelector:element.selector withArguments:element.arguments];
                break;
            }
            case VDThemeElementResourceTypeAttribute: {
                id attribute = [VDThemeManager attributeForKey:element.themeSelectorArgument.themeKey];
                element.themeSelectorArgument.strongObject = attribute;
                [self vd_performSelector:element.selector withArguments:element.arguments];
                break;
            }
        }
    }
    else {
        [UIView animateWithDuration:[VDThemeManager vd_sharedInstance].animationDuration animations:^{
            switch (element.resourceType) {
                case VDThemeElementResourceTypeColor: {
                    UIColor *color = [VDThemeManager colorForKey:element.themeSelectorArgument.themeKey];
                    element.themeSelectorArgument.strongObject = color;
                    [self vd_performSelector:element.selector withArguments:element.arguments];
                    break;
                }
                case VDThemeElementResourceTypeImage: {
                    UIImage *image = [VDThemeManager imageForKey:element.themeSelectorArgument.themeKey];
                    element.themeSelectorArgument.strongObject = image;
                    [self vd_performSelector:element.selector withArguments:element.arguments];
                    break;
                }
                case VDThemeElementResourceTypeFont: {
                    UIFont *font = [VDThemeManager fontForKey:element.themeSelectorArgument.themeKey];
                    element.themeSelectorArgument.strongObject = font;
                    [self vd_performSelector:element.selector withArguments:element.arguments];
                    break;
                }
                case VDThemeElementResourceTypeAttribute: {
                    id attribute = [VDThemeManager attributeForKey:element.themeSelectorArgument.themeKey];
                    element.themeSelectorArgument.strongObject = attribute;
                    [self vd_performSelector:element.selector withArguments:element.arguments];
                    break;
                }
            }
        }];
    }
}

- (void)vd_onThemeChange:(NSInteger)newThemeType withOldThemeType:(NSInteger)oldThemeType {
    for (VDThemeElement *element in [self vd_themeElements]) {
        [self vd_performElement:element];
    }
}

#pragma mark Properties
- (NSMutableArray *)vd_themeElements {
    NSMutableArray *array = objc_getAssociatedObject(self, @selector(vd_themeElements));
    if (!array) {
        array = [NSMutableArray new];
        objc_setAssociatedObject(self, @selector(vd_themeElements), array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return array;
}


#pragma mark Private Method


@end
