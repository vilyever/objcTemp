//
//  NSObject+VDNotification.m
//  objcTemp
//
//  Created by Deng on 16/7/25.
//  Copyright © Deng. All rights reserved.
//

#import "NSObject+VDNotification.h"

#import <objc/runtime.h>
//#import "objcTemp.h"
//@import objcTemp;


@implementation NSObject (VDNotification)

#pragma mark Public Method
- (VDNotificationElement *)vd_notificationWithTarget:(id)target name:(NSString *)notificationName object:(id)object notificationBlock:(void (^)(VDNotificationElement *, NSNotification *))notificationBlock {
    VDNotificationElement *element = [[VDNotificationElement alloc] initWithTarget:target name:notificationName object:object notificationBlock:notificationBlock];
    
    [self.vd_notificationElementArray addObject:element];
    
    return element;
}

#pragma mark Properties
- (NSMutableArray *)vd_notificationElementArray {
    NSMutableArray *array = objc_getAssociatedObject(self, @selector(vd_notificationElementArray));
    if (!array) {
        array = [NSMutableArray new];
        objc_setAssociatedObject(self, @selector(vd_notificationElementArray), array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSMutableArray *disposedElementArray = [NSMutableArray new];
    for (VDNotificationElement *element in array) {
        if (element.isDisposed) {
            [disposedElementArray addObject:element];
        }
    }
    
    [array removeObjectsInArray:disposedElementArray];
    
    return array;
}

#pragma mark Private Method


@end
