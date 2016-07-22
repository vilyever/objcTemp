//
//  VDLoadingView.h
//  objcTemp
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VDLoadingLayer.h"


@class VDLoadingView;

@interface VDLoadingView : UIView

#pragma mark Public Method
- (void)startAnimation;
- (void)stopAnimation;

#pragma mark Properties
//@property (nonatomic, strong) VDLoadingLayer *loadingLayer;
@property (nonatomic, assign) BOOL animated;
@property (nonatomic, strong) CABasicAnimation *progressAnimation;

@property (nonatomic, assign) NSTimeInterval progressAnimationDuration;

@property (nonatomic, assign) NSInteger progressAnimationRepeatedTimes;

#pragma mark Private Method
- (void)internalAppWillResignActive:(NSNotification *)notification;
- (void)internalAppDidEnterBackground:(NSNotification *)notification;
- (void)internalAppWillEnterForeground:(NSNotification *)notification;
- (void)internalAppDidBecomeActive:(NSNotification *)notification;

@end
