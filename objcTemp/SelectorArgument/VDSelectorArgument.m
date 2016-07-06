//
//  VDSelectorArgument.m
//  objcTemp
//
//  Created by Deng on 16/7/6.
//  Copyright © Deng. All rights reserved.
//

#import "VDSelectorArgument.h"


@interface VDSelectorArgument ()


@end


@implementation VDSelectorArgument

#pragma mark Public Method
+ (instancetype)argumentWithCopiedObject:(NSObject *)copiedObject {
    VDSelectorArgument *argument = [[VDSelectorArgument alloc] init];
    argument.copiedObject = copiedObject;
    return argument;
}

+ (instancetype)argumentWithWeakObject:(NSObject *)weakObject {
    VDSelectorArgument *argument = [[VDSelectorArgument alloc] init];
    argument.weakObject = weakObject;
    return argument;
}

+ (instancetype)argumentWithStrongObject:(NSObject *)strongObject {
    VDSelectorArgument *argument = [[VDSelectorArgument alloc] init];
    argument.strongObject = strongObject;
    return argument;
}

+ (instancetype)argumentWithAssignObject:(NSObject *)assignObject {
    VDSelectorArgument *argument = [[VDSelectorArgument alloc] init];
    argument.assignObject = assignObject;
    return argument;
}

+ (instancetype)argumentWithIntArgument:(int)intArgument {
    VDSelectorArgument *argument = [[VDSelectorArgument alloc] init];
    argument.intArgument = intArgument;
    return argument;
}

+ (instancetype)argumentWithLongArgument:(long)longArgument {
    VDSelectorArgument *argument = [[VDSelectorArgument alloc] init];
    argument.longArgument = longArgument;
    return argument;
}

+ (instancetype)argumentWithCharArgument:(char)charArgument {
    VDSelectorArgument *argument = [[VDSelectorArgument alloc] init];
    argument.charArgument = charArgument;
    return argument;
}

+ (instancetype)argumentWithBoolArgument:(BOOL)boolArgument {
    VDSelectorArgument *argument = [[VDSelectorArgument alloc] init];
    argument.boolArgument = boolArgument;
    return argument;
}

+ (instancetype)argumentWithFloatArgument:(float)floatArgument {
    VDSelectorArgument *argument = [[VDSelectorArgument alloc] init];
    argument.floatArgument = floatArgument;
    return argument;
}

+ (instancetype)argumentWithDoubleArgument:(double)doubleArgument {
    VDSelectorArgument *argument = [[VDSelectorArgument alloc] init];
    argument.doubleArgument = doubleArgument;
    return argument;
}

+ (instancetype)argumentWithIntegerArgument:(NSInteger)integerArgument {
    VDSelectorArgument *argument = [[VDSelectorArgument alloc] init];
    argument.integerArgument = integerArgument;
    return argument;
}

+ (instancetype)argumentWithUIntegerArgument:(NSUInteger)uintegerArgument {
    VDSelectorArgument *argument = [[VDSelectorArgument alloc] init];
    argument.uintegerArgument = uintegerArgument;
    return argument;
}

#pragma mark Properties
- (void)setCopiedObject:(NSObject *)copiedObject {
    _copiedObject = [copiedObject copy];
    self.type = VDSelectorArgumentTypeCopiedObject;
}

- (void)setWeakObject:(NSObject *)weakObject {
    _weakObject = weakObject;
    self.type = VDSelectorArgumentTypeWeakObject;
}

- (void)setStrongObject:(NSObject *)strongObject {
    _strongObject = strongObject;
    self.type = VDSelectorArgumentTypeStrongObject;
}

- (void)setAssignObject:(NSObject *)assignObject {
    _assignObject = assignObject;
    self.type = VDSelectorArgumentTypeAssignObject;
}

- (void)setIntArgument:(int)intArgument {
    _intArgument = intArgument;
    self.type = VDSelectorArgumentTypeInt;
}

- (void)setLongArgument:(long)longArgument {
    _longArgument = longArgument;
    self.type = VDSelectorArgumentTypeLong;
}

- (void)setCharArgument:(char)charArgument {
    _charArgument = charArgument;
    self.type = VDSelectorArgumentTypeChar;
}

- (void)setBoolArgument:(BOOL)boolArgument {
    _boolArgument = boolArgument;
    self.type = VDSelectorArgumentTypeBool;
}

- (void)setFloatArgument:(float)floatArgument {
    _floatArgument = floatArgument;
    self.type = VDSelectorArgumentTypeFloat;
}

- (void)setDoubleArgument:(double)doubleArgument {
    _doubleArgument = doubleArgument;
    self.type = VDSelectorArgumentTypeDouble;
}

- (void)setIntegerArgument:(NSInteger)integerArgument {
    _integerArgument = integerArgument;
    self.type = VDSelectorArgumentTypeNSInteger;
}

- (void)setUintegerArgument:(NSUInteger)uintegerArgument {
    _uintegerArgument = uintegerArgument;
    self.type = VDSelectorArgumentTypeNSUInteger;
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
