//
//  VDNotificationElement.m
//  objcTemp
//
//  Created by Deng on 16/7/25.
//  Copyright © Deng. All rights reserved.
//

#import "VDNotificationElement.h"
#import "NSObject+VDHook.h"
#import "VDMacros.h"
//#import "objcTemp.h"
//@import objcTemp;


@interface VDNotificationElement ()

@property (nonatomic, assign, readwrite) BOOL isDisposed;
@property (nonatomic, strong) VDNotificationElement *hookedDeallocElement;

@end


@implementation VDNotificationElement

#pragma mark Public Method
- (instancetype)initWithTarget:(id)target name:(NSString *)notificationName object:(id)object notificationBlock:(void (^)(VDNotificationElement *, NSNotification *))notificationBlock {
    self = [super init];
    _target = target;
    _notificationName = [notificationName copy];
    _object = object;
    _notificationBlock = notificationBlock;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalOnNotification:) name:_notificationName object:_object];
    VDWeakifySelf;
    self.hookedDeallocElement = [_target vd_hookSelector:VDHookDeallocSelector beforeBlock:^(VDHookElement *element, VDHookInvocationInfo *info) {
        VDStrongifySelf;
        [self dispose];
    }];
    
    return self;
}

- (void)dispose {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.hookedDeallocElement dispose];
    self.isDisposed = YES;
}


#pragma mark Properties


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    [self internalInitVDNotificationElement];
    
    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Private Method
- (void)internalInitVDNotificationElement {
    
}

- (void)internalOnNotification:(NSNotification *)notification {
    if (self.notificationBlock) {
        self.notificationBlock(self, notification);
    }
}

@end
