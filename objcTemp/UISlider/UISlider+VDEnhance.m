//
//  UISlider+VDEnhance.m
//  objcTemp
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "UISlider+VDEnhance.h"

#import <objc/runtime.h>
//#import "objcTemp.h"
//@import objcTemp;


@implementation UISlider (VDEnhance)

#pragma mark Public Method
- (CGFloat)vd_trackHeight {
    return [objc_getAssociatedObject(self, @selector(vd_trackHeight)) floatValue];
}

- (void)setVd_trackHeight:(CGFloat)vd_trackHeight {
    objc_setAssociatedObject(self, @selector(vd_trackHeight), @(vd_trackHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsDisplay];
}

- (void)vd_setValueWithValueChangedAction:(float)value {
    [self vd_setValueWithValueChangedAction:value animated:NO];
}
- (void)vd_setValueWithValueChangedAction:(float)value animated:(BOOL)animated {
    [self setValue:value animated:animated];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

#pragma mark Private Method
- (CGRect)vd_trackRectForBounds:(CGRect)bounds {
    CGRect trackRect = [self vd_trackRectForBounds:bounds];
    
    if (self.vd_trackHeight > 0.0f) {
        trackRect.size.height = self.vd_trackHeight;
    }
    return trackRect;
}

#pragma mark load
+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(trackRectForBounds:)), class_getInstanceMethod(self, @selector(vd_trackRectForBounds:)));
}

@end
