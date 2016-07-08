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

#pragma mark Private Method

#pragma mark load
+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(trackRectForBounds:)), class_getInstanceMethod(self, @selector(vd_trackRectForBounds:)));
}

@end
