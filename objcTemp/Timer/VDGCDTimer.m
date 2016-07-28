//
//  VDGCDTimer.m
//  objcTemp
//
//  Created by Deng on 16/7/28.
//  Copyright © Deng. All rights reserved.
//

#import "VDGCDTimer.h"
//#import "objcTemp.h"
//@import objcTemp;
#import "VDMacros.h"


dispatch_source_t VDCreateDispatchTimer(NSTimeInterval interval, dispatch_queue_t queue, dispatch_block_t block) {
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    if (timer) {
        dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, interval * NSEC_PER_SEC), interval * NSEC_PER_SEC, (1ull * NSEC_PER_SEC) / 10);
        dispatch_source_set_event_handler(timer, block);
        dispatch_resume(timer);
    }
    return timer;
}


@interface VDGCDTimer ()

@property (nonatomic, assign, readwrite) BOOL isRunning;
@property (nonatomic, strong) dispatch_source_t timer;

@end


@implementation VDGCDTimer

#pragma mark Public Method
+ (instancetype)timerWithInterval:(NSTimeInterval)interval repeats:(BOOL)repeats fireOnMainThread:(BOOL)isFireOnMainThread actionBlock:(void(^)(VDGCDTimer *timer))actionBlock {
    return [[self alloc] initWithInterval:interval repeats:repeats fireOnMainThread:isFireOnMainThread actionBlock:actionBlock];
}

- (instancetype)initWithInterval:(NSTimeInterval)interval repeats:(BOOL)repeats isFireOnMainThread:(BOOL)isFireOnMainThread actionBlock:(void(^)(VDGCDTimer *timer))actionBlock {
    self = [super init];
    
    _interval = interval;
    _repeats = repeats;
    _isFireOnMainThread = isFireOnMainThread;
    _actionBlock = actionBlock;
    
    _firedCount = 0;
    
    return self;
}

- (void)fire {
    if (self.actionBlock) {
        self.actionBlock(self);
    }
}

- (void)fireOnMainThread {
    if ([NSThread isMainThread]) {
        [self fire];
    }
    else {
        if (self.actionBlock) {
            VDWeakifySelf;
            dispatch_async(dispatch_get_main_queue(), ^{
                VDStrongifySelf;
                [self fire];
            });
        }
    }
}

- (void)start {
    if (!self.isRunning) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        VDWeakifySelf;
        self.timer = VDCreateDispatchTimer(self.interval, queue, ^{
            VDStrongifySelf;
            self.firedCount++;
            if (self.isFireOnMainThread) {
                [self fireOnMainThread];
            }
            else {
                [self fire];
            }
            if (!self.repeats) {
                [self stop];
            }
        });
        if (self.timer) {
            self.isRunning = YES;
        }
    }
}

- (void)stop {
    if (self.isRunning) {
        if (self.timer) {
            dispatch_source_cancel(self.timer);
            self.timer = nil;
        }
        self.isRunning = NO;
    }
}

#pragma mark Properties

#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    [self internalInitVDGCDTimer];
    
    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Private Method
- (void)internalInitVDGCDTimer {
    
}

@end
