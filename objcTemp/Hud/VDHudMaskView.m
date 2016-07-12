//
//  VDHudMaskView.m
//  objcTemp
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import "VDHudMaskView.h"
//#import "objcTemp.h"
//@import objcTemp;
#import "VDMacros.h"
#import "NSObject+VDEnhance.h"
#import "UIView+VDEnhance.h"

@interface VDHudMaskView ()

@end


@implementation VDHudMaskView

#pragma mark Public Method
+ (void)show {
    [VDWindow vd_addSubview:[self vd_sharedInstance] scaleToFill:YES];
}

+ (void)showWithHudView:(UIView *)hudView {
    [[self vd_sharedInstance] addSubview:hudView];
    [self show];
}

+ (void)hide {
    [[self vd_sharedInstance] vd_removeAllSubviews];
    [[self vd_sharedInstance] removeFromSuperview];
}

+ (void)hideDelay:(NSTimeInterval)delay {
    [self performSelector:@selector(hide) withObject:nil afterDelay:delay];
}

+ (void)hideWithHudView:(UIView *)hudView {
    [hudView removeFromSuperview];
    if ([[self vd_sharedInstance] subviews].count == 0) {
        [self hide];
    }
}

+ (void)hideWithHudView:(UIView *)hudView delay:(NSTimeInterval)delay {
    [self performSelector:@selector(hideWithHudView:) withObject:hudView afterDelay:delay];
}

#pragma mark Properties


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    self.backgroundColor = VDRGBAColor(0.0f, 0.0f, 0.0f, 150.0f);
    
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

- (void)dealloc {
    
}

- (void)layoutSubviews {
    for (UIView *view in self.subviews) {
        view.center = CGPointMake(self.bounds.size.width / 2.0f, self.bounds.size.height / 2.0f);
    }
}


#pragma mark IBActions


#pragma mark Delegates


#pragma mark Private Method

@end
