//
//  NSObject+VDHook.m
//  objcTempUtilities
//
//  Created by Deng on 16/6/24.
//  Copyright © Deng. All rights reserved.
//

#import "NSObject+VDHook.h"

//#import <objc/runtime.h>


@implementation NSObject (VDHook)

#pragma mark Public Method
- (VDHookElement *)vd_hookSelector:(SEL)selector beforeBlock:(void (^)(VDHookInvocationInfo *info))block {
    return [self vd_hookSelector:selector beforeBlock:block autoRemove:NO];
}

- (VDHookElement *)vd_hookSelector:(SEL)selector insteadBlock:(void (^)(VDHookInvocationInfo *info))block {
    return [self vd_hookSelector:selector insteadBlock:block autoRemove:NO];
}

- (VDHookElement *)vd_hookSelector:(SEL)selector afterBlock:(void (^)(VDHookInvocationInfo *info))block {
    return [self vd_hookSelector:selector afterBlock:block autoRemove:NO];
}

- (VDHookElement *)vd_hookSelector:(SEL)selector beforeBlock:(void (^)(VDHookInvocationInfo *info))block autoRemove:(BOOL)autoRemove {
    return [VDHook hookInstance:self selector:selector beforeBlock:block autoRemove:autoRemove];
}

- (VDHookElement *)vd_hookSelector:(SEL)selector insteadBlock:(void (^)(VDHookInvocationInfo *info))block autoRemove:(BOOL)autoRemove {
    return [VDHook hookInstance:self selector:selector insteadBlock:block autoRemove:autoRemove];
}

- (VDHookElement *)vd_hookSelector:(SEL)selector afterBlock:(void (^)(VDHookInvocationInfo *info))block autoRemove:(BOOL)autoRemove {
    return [VDHook hookInstance:self selector:selector afterBlock:block autoRemove:autoRemove];
}

#pragma mark Private Method


@end
