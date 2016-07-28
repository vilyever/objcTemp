//
//  VDGCDTimer.h
//  objcTemp
//
//  Created by Deng on 16/7/28.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VDGCDTimer;


@interface VDGCDTimer : NSObject

#pragma mark Public Method
+ (instancetype)timerWithInterval:(NSTimeInterval)interval repeats:(BOOL)repeats fireOnMainThread:(BOOL)isFireOnMainThread actionBlock:(void(^)(VDGCDTimer *timer))actionBlock;
- (instancetype)initWithInterval:(NSTimeInterval)interval repeats:(BOOL)repeats fireOnMainThread:(BOOL)isFireOnMainThread actionBlock:(void(^)(VDGCDTimer *timer))actionBlock;

- (void)fire;
- (void)fireOnMainThread;
- (void)start;
- (void)stop;

#pragma mark Properties
@property (nonatomic, assign) NSTimeInterval interval;
@property (nonatomic, assign) BOOL repeats;
@property (nonatomic, assign) BOOL isFireOnMainThread;
@property (nonatomic, strong) void(^actionBlock)(VDGCDTimer *timer);

@property (nonatomic, assign) NSInteger firedCount;

@property (nonatomic, assign, readonly) BOOL isRunning;

#pragma mark Private Method
- (void)internalInitVDGCDTimer;


@end
