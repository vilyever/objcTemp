//
//  NSMutableArray+VDEnhance.m
//  objcTemp
//
//  Created by Deng on 16/7/13.
//  Copyright © Deng. All rights reserved.
//

#import "NSMutableArray+VDEnhance.h"

//#import <objc/runtime.h>
//#import "objcTemp.h"
//@import objcTemp;


@implementation NSMutableArray (VDEnhance)

#pragma mark Public Method
- (void)vd_queuePush:(id)obj {
    @synchronized (self) {
        [self addObject:obj];
    }
}

- (id)vd_queuePop {
    @synchronized (self) {
        if (self.count == 0) {
            return nil;
        }
        
        id obj = [self objectAtIndex:0];
        [self removeObjectAtIndex:0];
        return obj;
    }
}

- (void)vd_stackPush:(id)obj {
    @synchronized (self) {
        [self addObject:obj];
    }
}

- (id)vd_stackPop {
    @synchronized (self) {
        if (self.count == 0) {
            return nil;
        }
        
        id obj = [self lastObject];
        [self removeLastObject];
        return obj;
    }
}

#pragma mark Private Method


@end
