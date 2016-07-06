//
//  VDSelectorArgument.h
//  objcTemp
//
//  Created by Deng on 16/7/6.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VDSelectorArgumentType) {
    VDSelectorArgumentTypeCopiedObject,
    VDSelectorArgumentTypeWeakObject,
    VDSelectorArgumentTypeStrongObject,
    VDSelectorArgumentTypeAssignObject,
    VDSelectorArgumentTypeInt,
    VDSelectorArgumentTypeLong,
    VDSelectorArgumentTypeChar,
    VDSelectorArgumentTypeBool,
    VDSelectorArgumentTypeFloat,
    VDSelectorArgumentTypeDouble,
    VDSelectorArgumentTypeNSInteger,
    VDSelectorArgumentTypeNSUInteger,
};

@class VDSelectorArgument;


@interface VDSelectorArgument : NSObject

#pragma mark Public Method
+ (instancetype)argumentWithCopiedObject:(NSObject *)copiedObject;
+ (instancetype)argumentWithWeakObject:(NSObject *)weakObject;
+ (instancetype)argumentWithStrongObject:(NSObject *)strongObject;
+ (instancetype)argumentWithAssignObject:(NSObject *)assignObject;
+ (instancetype)argumentWithIntArgument:(int)intArgument;
+ (instancetype)argumentWithLongArgument:(long)longArgument;
+ (instancetype)argumentWithCharArgument:(char)charArgument;
+ (instancetype)argumentWithBoolArgument:(BOOL)boolArgument;
+ (instancetype)argumentWithFloatArgument:(float)floatArgument;
+ (instancetype)argumentWithDoubleArgument:(double)doubleArgument;
+ (instancetype)argumentWithIntegerArgument:(NSInteger)integerArgument;
+ (instancetype)argumentWithUIntegerArgument:(NSUInteger)uintegerArgument;

#pragma mark Properties
@property (nonatomic, assign) VDSelectorArgumentType type;

@property (nonatomic, copy) NSObject *copiedObject;
@property (nonatomic, weak) NSObject *weakObject;
@property (nonatomic, strong) NSObject *strongObject;
@property (nonatomic, assign) NSObject *assignObject;
@property (nonatomic, assign) int intArgument;
@property (nonatomic, assign) long longArgument;
@property (nonatomic, assign) char charArgument;
@property (nonatomic, assign) BOOL boolArgument;
@property (nonatomic, assign) float floatArgument;
@property (nonatomic, assign) double doubleArgument;
@property (nonatomic, assign) NSInteger integerArgument;
@property (nonatomic, assign) NSUInteger uintegerArgument;

@end
