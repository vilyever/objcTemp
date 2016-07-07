//
//  VDHook.h
//  objcTempUtilities
//
//  Created by Deng on 16/6/16.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDHookRecorder.h"
#import "VDHookInvocationInfo.h"

@class VDHook;


@interface VDHook : NSObject

#pragma mark Public Method
+ (VDHook *)sharedInstance;

+ (VDHookElement *)hookInstance:(id)instance selector:(SEL)selector beforeBlock:(void (^)(VDHookInvocationInfo *info))block;
+ (VDHookElement *)hookInstance:(id)instance selector:(SEL)selector insteadBlock:(void (^)(VDHookInvocationInfo *info))block;
+ (VDHookElement *)hookInstance:(id)instance selector:(SEL)selector afterBlock:(void (^)(VDHookInvocationInfo *info))block;

+ (VDHookElement *)hookInstance:(id)instance selector:(SEL)selector beforeBlock:(void (^)(VDHookInvocationInfo *info))block autoRemove:(BOOL)autoRemove;
+ (VDHookElement *)hookInstance:(id)instance selector:(SEL)selector insteadBlock:(void (^)(VDHookInvocationInfo *info))block autoRemove:(BOOL)autoRemove;
+ (VDHookElement *)hookInstance:(id)instance selector:(SEL)selector afterBlock:(void (^)(VDHookInvocationInfo *info))block autoRemove:(BOOL)autoRemove;

//+ (VDHookElement *)hookClass:(Class)clazz selector:(SEL)selector beforeBlock:(void (^)(VDHookInvocationInfo *info))block;
//+ (VDHookElement *)hookClass:(Class)clazz selector:(SEL)selector insteadBlock:(void (^)(VDHookInvocationInfo *info))block;
//+ (VDHookElement *)hookClass:(Class)clazz selector:(SEL)selector afterBlock:(void (^)(VDHookInvocationInfo *info))block;
//
//+ (VDHookElement *)hookClass:(Class)clazz selector:(SEL)selector beforeBlock:(void (^)(VDHookInvocationInfo *info))block autoRemove:(BOOL)autoRemove;
//+ (VDHookElement *)hookClass:(Class)clazz selector:(SEL)selector insteadBlock:(void (^)(VDHookInvocationInfo *info))block autoRemove:(BOOL)autoRemove;
//+ (VDHookElement *)hookClass:(Class)clazz selector:(SEL)selector afterBlock:(void (^)(VDHookInvocationInfo *info))block autoRemove:(BOOL)autoRemove;

#pragma mark Properties

#pragma mark Private Method
+ (void)internalHookInstance:(id)instance selector:(SEL)selector;
+ (Class)internalHookClassForInstance:(NSObject *)instance error:(NSError **)error;
+ (void)internalSwizzleForwardInvocation:(Class)clazz;
+ (void)internalUnswizzleForwardInvocation:(Class)clazz;
+ (void)internalHookClassMethodForClass:(Class)clazz replacedClass:(Class)replacedClazz;
+ (BOOL)internalCheckIsHookedTarget:(id)target selector:(SEL)selector;
+ (void)internalMarkHookedTarget:(id)target selector:(SEL)selector;
+ (BOOL)internalCheckIsImp:(IMP)imp fitSelector:(SEL)selector;
@end
