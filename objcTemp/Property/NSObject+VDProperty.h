//
//  NSObject+VDProperty.h
//  objcTemp
//
//  Created by Deng on 16/6/30.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VDProperty.h"

@interface NSObject (VDProperty)

#pragma mark Public Method
+ (NSArray *)vd_properties;
+ (NSArray *)vd_propertiesTraceToAncestorClass:(Class)ancestorClass;
+ (VDProperty *)vd_propertyWithName:(NSString *)propertyName;

@end
