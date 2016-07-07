//
//  UIView+VDGesture.h
//  objcTempUtilities
//
//  Created by Deng on 16/6/16.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (VDGesture)

#pragma mark Public Method
- (void)vd_performSelectorOnTapWithTarget:(id)target selector:(SEL)selector;
- (void)vd_performActionOnTap:(void (^)(void) )block;

#pragma mark Private Method
- (void)vd_internalActiveOnTap;
- (void)vd_internalHandleTapAction:(UITapGestureRecognizer *)tapGestureRecognizer;

@end
