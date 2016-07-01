//
//  NSObject+VDProperty.m
//  objcTemp
//
//  Created by Deng on 16/6/30.
//  Copyright © Deng. All rights reserved.
//

#import "NSObject+VDProperty.h"

//#import <objc/runtime.h>


@implementation NSObject (VDProperty)

#pragma mark Public Method
+ (NSArray *)vd_properties {
    return [VDProperty propertiesWithClass:self];
}

+ (NSArray *)vd_propertiesTraceToAncestorClass:(Class)ancestorClass {
    return [VDProperty propertiesWithClass:self traceToAncestorClass:ancestorClass];
}

+ (VDProperty *)vd_propertyWithName:(NSString *)propertyName {
    for (VDProperty *property in [self vd_properties]) {
        if ([property.name isEqualToString:propertyName]) {
            return property;
        }
    }
    
    return nil;
}

#pragma mark Private Method


@end
