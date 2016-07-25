//
//  NSObject+VDHook.h
//  objcTempUtilities
//
//  Created by Deng on 16/6/24.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VDHook.h"

@interface NSObject (VDHook)

#pragma mark Public Method
- (VDHookElement *)vd_hookSelector:(SEL)selector beforeBlock:(void (^)(VDHookElement *element, VDHookInvocationInfo *info))block;
- (VDHookElement *)vd_hookSelector:(SEL)selector insteadBlock:(void (^)(VDHookElement *element, VDHookInvocationInfo *info))block;
- (VDHookElement *)vd_hookSelector:(SEL)selector afterBlock:(void (^)(VDHookElement *element, VDHookInvocationInfo *info))block;

- (VDHookElement *)vd_hookSelector:(SEL)selector beforeBlock:(void (^)(VDHookElement *element, VDHookInvocationInfo *info))block autoRemove:(BOOL)autoRemove;
- (VDHookElement *)vd_hookSelector:(SEL)selector insteadBlock:(void (^)(VDHookElement *element, VDHookInvocationInfo *info))block autoRemove:(BOOL)autoRemove;
- (VDHookElement *)vd_hookSelector:(SEL)selector afterBlock:(void (^)(VDHookElement *element, VDHookInvocationInfo *info))block autoRemove:(BOOL)autoRemove;

@end
