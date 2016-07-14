//
//  UISlider+VDEnhance.h
//  objcTemp
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UISlider (VDEnhance)

#pragma mark Public Method

#pragma mark Properties
@property (nonatomic, assign) CGFloat vd_trackHeight;

#pragma mark Private Method
- (CGRect)vd_trackRectForBounds:(CGRect)bounds;
- (void)vd_setValueWithValueChangedAction:(float)value;
- (void)vd_setValueWithValueChangedAction:(float)value animated:(BOOL)animated;

@end
