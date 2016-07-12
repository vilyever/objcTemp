//
//  VDHudMaskView.h
//  objcTemp
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@class VDHudMaskView;

@interface VDHudMaskView : UIView

#pragma mark Public Method
+ (void)show;
+ (void)showWithHudView:(UIView *)hudView;
+ (void)hide;
+ (void)hideDelay:(NSTimeInterval)delay;
+ (void)hideWithHudView:(UIView *)hudView;
+ (void)hideWithHudView:(UIView *)hudView delay:(NSTimeInterval)delay;

#pragma mark Properties


@end
