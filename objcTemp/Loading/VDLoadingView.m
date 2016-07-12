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

@property (nonatomic, assign, readwrite) BOOL animated;
@property (nonatomic, assign) BOOL needReanimate;

@property (nonatomic, assign) CGFloat lastProgress;

@end


@implementation VDLoadingView

#pragma mark Public Method
- (void)startAnimation {
    if ([self.layer animationForKey:VDKeyPath(self, progressAnimation)]) {
        return;
    }
    self.animated = YES;
    self.progressAnimationRepeatedTimes = -1;
    [self.layer addAnimation:self.progressAnimation forKey:VDKeyPath(self, progressAnimation)];
}

- (void)stopAnimation {
    self.animated = NO;
    [self.layer removeAnimationForKey:VDKeyPath(self, progressAnimation)];
}

#pragma mark Properties
- (CABasicAnimation *)progressAnimation {
    if (!_progressAnimation) {
        _progressAnimation = [CABasicAnimation animationWithKeyPath:VDKeyPath(((VDLoadingLayer *) self.layer), animatingProgress)];
        _progressAnimation.delegate = self;
        _progressAnimation.fromValue = @0.0;
        _progressAnimation.toValue = @1.0;
        _progressAnimation.repeatCount = self.progressAnimationRepeatCount;
        _progressAnimation.duration = self.progressAnimationDuration;
    }
    
    return _progressAnimation;
}

- (void)setProgressAnimationDuration:(NSTimeInterval)progressAnimationDuration {
    _progressAnimationDuration = progressAnimationDuration;
    self.progressAnimation.duration = _progressAnimationDuration;
}

- (void)setProgressAnimationRepeatCount:(float)progressAnimationRepeatCount {
    _progressAnimationRepeatCount = progressAnimationRepeatCount;
    self.progressAnimation.repeatCount = _progressAnimationRepeatCount;
}

#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _progressAnimationRepeatCount = HUGE_VALF;
    _progressAnimationDuration = 1.5;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalAppWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalAppDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalAppWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalAppDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)setHidden:(BOOL)hidden {
    [super setHidden:hidden];
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (Class)layerClass {
    return [VDLoadingLayer class];
}

- (void)drawLayer:(VDLoadingLayer *)layer inContext:(CGContextRef)ctx {
    [super drawLayer:layer inContext:ctx];
    
    if (self.lastProgress > layer.animatingProgress) {
        self.progressAnimationRepeatedTimes++;
    }
    
    self.lastProgress = layer.animatingProgress;
}


#pragma mark IBActions


#pragma mark Delegates
- (void)animationDidStart:(CAAnimation *)anim {
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
}

#pragma mark Private Method
- (void)internalAppWillResignActive:(NSNotification *)notification {
}

- (void)internalAppDidEnterBackground:(NSNotification *)notification {
    if (self.animated) {
        self.needReanimate = YES;
        [self stopAnimation];
    }
}

- (void)internalAppWillEnterForeground:(NSNotification *)notification {
    if (self.needReanimate) {
        self.needReanimate = NO;
        [self startAnimation];
    }
}

- (void)internalAppDidBecomeActive:(NSNotification *)notification {

}

@end
