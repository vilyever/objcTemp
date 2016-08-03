//
//  VDHookInvocationInfo.h
//  objcTempUtilities
//
//  Created by Deng on 16/6/17.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>


@class VDHookInvocationInfo;


@interface VDHookInvocationInfo : NSObject

#pragma mark Public Method
+ (instancetype)infoWithInvocation:(NSInvocation *)invocation;

- (void)getOriginalReturnValue:(void *)valuePtr; // try use __unsafe_unretained to avoid crash
- (void)setReturnValue:(void *)valuePtr;

- (void)getArgument:(void *)argument atIndex:(NSInteger)idx; // try use __unsafe_unretained var to avoid crash
- (__unsafe_unretained id)getArgumentAtIndex:(NSInteger)idx;
- (__unsafe_unretained NSString *)getStringArgumentAtIndex:(NSInteger)idx;
- (NSInteger)getIntegerArgumentAtIndex:(NSInteger)idx;
- (int)getIntArgumentAtIndex:(NSInteger)idx;
- (BOOL)getBoolArgumentAtIndex:(NSInteger)idx;
- (float)getFloatArgumentAtIndex:(NSInteger)idx;
- (double)getDoubleArgumentAtIndex:(NSInteger)idx;
- (char)getCharArgumentAtIndex:(NSInteger)idx;
- (long)getLongArgumentAtIndex:(NSInteger)idx;
- (SEL)getSELArgumentAtIndex:(NSInteger)idx;

- (void)setArgument:(void *)argument atIndex:(NSInteger)idx;

#pragma mark Properties
@property (nonatomic, strong) NSInvocation *invocation;

@end
