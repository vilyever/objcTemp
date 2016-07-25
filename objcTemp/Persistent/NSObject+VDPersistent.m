//
//  NSObject+VDPersistent.m
//  objcTemp
//
//  Created by Deng on 16/7/1.
//  Copyright © Deng. All rights reserved.
//

#import "NSObject+VDPersistent.h"

//#import <objc/runtime.h>

#import "VDMacros.h"
#import "NSObject+VDEnhance.h"
#import "NSObject+VDProperty.h"
#import "NSObject+VDHook.h"


@implementation NSObject (VDPersistent)

#pragma mark Public Method
- (void)vd_initPersistent {
    NSArray *properties = [[self class] vd_properties];
    for (VDProperty *property in properties) {
//        if ([property.protocols containsObject:NSStringFromProtocol(@protocol(VDPersistentProtocol))]) {
            VDWeakifySelf;
            [self vd_hookSelector:NSSelectorFromString(property.setterSelectorName) afterBlock:^(VDHookElement *element, VDHookInvocationInfo *info) {
                VDStrongifySelf;
                if (![property isPrimitive]) {
                    [[NSUserDefaults standardUserDefaults] setObject:[info getArgumentAtIndex:0] forKey:[NSString stringWithFormat:@"%@_%@", [[self class] vd_className], property.name]];
                }
                else {
                    switch (property.primitiveType) {
                        case VDPropertyPrimitiveTypeIntOrSignedOrEnumOrNSInteger:
                        case VDPropertyPrimitiveTypeUnsignedIntOrNSUinteger:
                        case VDPropertyPrimitiveTypeShort:
                        case VDPropertyPrimitiveTypeUnsignedShort: {
                            [[NSUserDefaults standardUserDefaults] setObject:@([info getIntegerArgumentAtIndex:0]) forKey:[NSString stringWithFormat:@"%@_%@", [[self class] vd_className], property.name]];
                            break;
                        }
                        case VDPropertyPrimitiveTypeLong:
                        case VDPropertyPrimitiveTypeUnsignedLong:
                        case VDPropertyPrimitiveTypeLongLong:
                        case VDPropertyPrimitiveTypeUnsignedLongLong: {
                            [[NSUserDefaults standardUserDefaults] setObject:@([info getLongArgumentAtIndex:0]) forKey:[NSString stringWithFormat:@"%@_%@", [[self class] vd_className], property.name]];
                            break;
                        }
                        case VDPropertyPrimitiveTypeCharOrBOOL:
                        case VDPropertyPrimitiveTypeUnsignedChar: {
                            [[NSUserDefaults standardUserDefaults] setObject:@([info getCharArgumentAtIndex:0]) forKey:[NSString stringWithFormat:@"%@_%@", [[self class] vd_className], property.name]];
                            break;
                        }
                        case VDPropertyPrimitiveTypeFloat: {
                            [[NSUserDefaults standardUserDefaults] setObject:@([info getFloatArgumentAtIndex:0]) forKey:[NSString stringWithFormat:@"%@_%@", [[self class] vd_className], property.name]];
                            break;
                        }
                        case VDPropertyPrimitiveTypeDouble:
                        case VDPropertyPrimitiveTypeLongDouble: {
                            [[NSUserDefaults standardUserDefaults] setObject:@([info getDoubleArgumentAtIndex:0]) forKey:[NSString stringWithFormat:@"%@_%@", [[self class] vd_className], property.name]];
                            break;
                        }
                        default: {
                            [[NSUserDefaults standardUserDefaults] setObject:[info getArgumentAtIndex:0] forKey:[NSString stringWithFormat:@"%@_%@", [[self class] vd_className], property.name]];
                            break;
                        }
                    }
                }
                [[NSUserDefaults standardUserDefaults] synchronize];
            }];
            [self vd_hookSelector:NSSelectorFromString(property.getterSelectorName) insteadBlock:^(VDHookElement *element, VDHookInvocationInfo *info) {
                VDStrongifySelf;
                if (![property isPrimitive]) {
                    id value = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@_%@", [[self class] vd_className], property.name]];
                    [info setReturnValue:&value];
                }
                else {
                    switch (property.primitiveType) {
                        case VDPropertyPrimitiveTypeIntOrSignedOrEnumOrNSInteger:
                        case VDPropertyPrimitiveTypeUnsignedIntOrNSUinteger:
                        case VDPropertyPrimitiveTypeShort:
                        case VDPropertyPrimitiveTypeUnsignedShort: {
                            NSInteger value = [[[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@_%@", [[self class] vd_className], property.name]] integerValue];
                            [info setReturnValue:&value];
                            break;
                        }
                        case VDPropertyPrimitiveTypeLong:
                        case VDPropertyPrimitiveTypeUnsignedLong:
                        case VDPropertyPrimitiveTypeLongLong:
                        case VDPropertyPrimitiveTypeUnsignedLongLong: {
                            long value = [[[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@_%@", [[self class] vd_className], property.name]] longValue];
                            [info setReturnValue:&value];
                            break;
                        }
                        case VDPropertyPrimitiveTypeCharOrBOOL:
                        case VDPropertyPrimitiveTypeUnsignedChar: {
                            char value = [[[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@_%@", [[self class] vd_className], property.name]] charValue];
                            [info setReturnValue:&value];
                            break;
                        }
                        case VDPropertyPrimitiveTypeFloat: {
                            float value = [[[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@_%@", [[self class] vd_className], property.name]] floatValue];
                            [info setReturnValue:&value];
                            break;
                        }
                        case VDPropertyPrimitiveTypeDouble:
                        case VDPropertyPrimitiveTypeLongDouble: {
                            double value = [[[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@_%@", [[self class] vd_className], property.name]] doubleValue];
                            [info setReturnValue:&value];
                            break;
                        }
                        default: {
                            id value = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@_%@", [[self class] vd_className], property.name]];
                            [info setReturnValue:&value];
                            break;
                        }
                    }
                }
                
            }];
//        }
    }
}

#pragma mark Private Method


@end
