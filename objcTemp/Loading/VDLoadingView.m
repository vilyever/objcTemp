//
//  VDLoadingView.m
//  objcTemp
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import "VDLoadingView.h"
//#import "objcTemp.h"
//@import objcTemp;
#import "VDMacros.h"


@interface VDLoadingView ()

@property (nonatomic, assign) CGFloat lastProgress;
@property (nonatomic, assign) CFTimeInterval lastAnimationBeginTime;
@property (nonatomic, assign) CFTimeInterval lastAnimationAnimatingTime;

@end


@implementation VDLoadingView

#pragma mark Public Method
- (void)startAnimation {
    self.animated = YES;
}

- (void)stopAnimation {
    self.animated = NO;
}

#pragma mark Properties
- (CABasicAnimation *)progressAnimation {
    if (!_progressAnimation) {
        _progressAnimation = [CABasicAnimation animationWithKeyPath:VDKeyPath(((VDLoadingLayer *) self.layer), animatingProgress)];
        _progressAnimation.delegate = self;
        _progressAnimation.fromValue = @0.0;
        _progressAnimation.toValue = @1.0;
        _progressAnimation.repeatCount = 1;
        _progressAnimation.duration = self.progressAnimationDuration;
    }
    
    return _progressAnimation;
}

- (void)setAnimated:(BOOL)animated {
    if (_animated != animated) {
        _animated = animated;
        if (_animated) {
            self.progressAnimationRepeatedTimes = -1;
            [self internalStartAnimation:NO];
        }
        else {
            [self internalStopAnimation:NO];
        }
    }
}

- (void)setProgressAnimationDuration:(NSTimeInterval)progressAnimationDuration {
    _progressAnimationDuration = progressAnimationDuration;
    self.progressAnimation.duration = _progressAnimationDuration;
}

#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    [self internalInitVDLoadingView];
    self.backgroundColor = [UIColor clearColor];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self internalInitVDLoadingView];
    self.backgroundColor = [UIColor clearColor];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    [self internalInitVDLoadingView];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setHidden:(BOOL)hidden {
    [super setHidden:hidden];
    
    if (hidden) {
        [self internalStopAnimationWhenBackground];
    }
    else {
        [self internalTryStartAnimationWhenForeground];
    }
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
    
    if (!self.window) {
        [self internalStopAnimationWhenBackground];
    }
    else {
        [self internalTryStartAnimationWhenForeground];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (Class)layerClass {
    return [VDLoadingLayer class];
}

- (void)drawLayer:(VDLoadingLayer *)layer inContext:(CGContextRef)ctx {
    [super drawLayer:layer inContext:ctx];
    
    [((VDLoadingLayer *)self.layer) setAnimatingProgress:layer.animatingProgress];
}


#pragma mark IBActions


#pragma mark Delegates
- (void)animationDidStart:(CAAnimation *)anim {
    self.progressAnimationRepeatedTimes++;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if (self.animated && flag) {
        [self internalStartAnimation:NO];
    }
}

#pragma mark Private Method
- (void)internalInitVDLoadingView {
    _progressAnimationDuration = 2;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalAppWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalAppDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalAppWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalAppDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)internalStartAnimation:(BOOL)isResume {
    if (self.isHidden
        || !self.window
        || [UIApplication sharedApplication].applicationState != UIApplicationStateActive) {
        return;
    }
    
    if (!self.animated) {
        return;
    }
    
    if ([self.layer animationForKey:VDKeyPath(self, progressAnimation)]) {
        return;
    }
    
    if (isResume) {
        self.progressAnimation.beginTime = CACurrentMediaTime() - self.lastAnimationAnimatingTime;
    }
    else {
        self.progressAnimation.beginTime = CACurrentMediaTime();
        
        self.lastAnimationAnimatingTime = 0;
    }

    self.lastAnimationBeginTime = CACurrentMediaTime();
    
    [self.layer addAnimation:self.progressAnimation forKey:VDKeyPath(self, progressAnimation)];
}

- (void)internalStopAnimation:(BOOL)isPause {
    if (![self.layer animationForKey:VDKeyPath(self, progressAnimation)]) {
        return;
    }
    
    if (isPause) {
        self.lastAnimationAnimatingTime += CACurrentMediaTime() - self.lastAnimationBeginTime;
    }
    [self.layer removeAnimationForKey:VDKeyPath(self, progressAnimation)];
}

- (void)internalAppWillResignActive:(NSNotification *)notification {
}

- (void)internalAppDidEnterBackground:(NSNotification *)notification {
    [self internalStopAnimationWhenBackground];
}

- (void)internalAppWillEnterForeground:(NSNotification *)notification {
}

- (void)internalAppDidBecomeActive:(NSNotification *)notification {
    [self internalTryStartAnimationWhenForeground];
}

- (void)internalStopAnimationWhenBackground {
    if (self.animated) {
        [self internalStopAnimation:YES];
    }
}

- (void)internalTryStartAnimationWhenForeground {
    if (self.animated) {
        [self internalStartAnimation:YES];
    }
}

@end
