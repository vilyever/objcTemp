//
//  NSObject+VDEnhance.m
//  objcTempUtilities
//
//  Created by Deng on 16/6/15.
//  Copyright © Deng. All rights reserved.
//

#import "NSObject+VDEnhance.h"

//#import <objc/runtime.h>


@implementation NSObject (VDEnhance)

#pragma mark Public Method
+ (NSString *)vd_className
{
    return NSStringFromClass( [self class] );
}

static NSMutableDictionary *SharedInstanceDictionary = nil;
+ (instancetype)vd_sharedInstance {
    return [self vd_sharedInstance:nil];
}

+ (instancetype)vd_sharedInstance:(id (^)(void))initBlock {
    NSObject *sharedInstance = nil;
    
    @synchronized(self) {
        NSString *instanceClass = NSStringFromClass(self);
        sharedInstance = [SharedInstanceDictionary objectForKey:instanceClass];
        if (!sharedInstance) {
            if (initBlock) {
                sharedInstance = initBlock();
            } else {
                sharedInstance = [[self alloc] init];
            }
            if (!SharedInstanceDictionary) {
                static dispatch_once_t onceToken;
                dispatch_once(&onceToken, ^{
                    SharedInstanceDictionary = [NSMutableDictionary dictionary];
                } );
            }
            [SharedInstanceDictionary setObject:sharedInstance forKey:instanceClass];
        }
    }
    
    return sharedInstance;
}

+ (void)vd_destroySharedInstance {
    [SharedInstanceDictionary removeObjectForKey:NSStringFromClass(self)];
}

- (void)vd_performActionDelay:(float)second action:(void (^)(void))block
{
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * second);
    dispatch_after(delay, dispatch_get_main_queue(), [block copy] );
}

- (void)vd_performSelector:(SEL)aSelector
{
    if ([self respondsToSelector:aSelector]) {
        ( (void (*)(id, SEL) )[self methodForSelector:aSelector] )(self, aSelector);
    }
}

- (void)vd_performSelector:(SEL)aSelector withObject:(id)object
{
    if ([self respondsToSelector:aSelector]) {
        ( (void (*)(id, SEL, id) )[self methodForSelector:aSelector] )(self, aSelector, object);
    }
}

- (void)vd_performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2
{
    if ([self respondsToSelector:aSelector]) {
        ( (void (*)(id, SEL, id, id) )[self methodForSelector:aSelector] )(self, aSelector, object1, object2);
    }
}

- (void)vd_performSelector:(SEL)aSelector withInteger:(NSInteger)integer
{
    if ([self respondsToSelector:aSelector]) {
        ( (void (*)(id, SEL, NSInteger) )[self methodForSelector:aSelector] )(self, aSelector, integer);
    }
}

#pragma mark Private Method


@end
