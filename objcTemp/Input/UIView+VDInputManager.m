//
//  UIView+VDInputManager.m
//  objcTemp
//
//  Created by Deng on 16/7/13.
//  Copyright © Deng. All rights reserved.
//

#import "UIView+VDInputManager.h"

#import <objc/runtime.h>
//#import "objcTemp.h"
//@import objcTemp;


@implementation UIView (VDInputManager)

@dynamic vd_inputManager;

#pragma mark Public Method
- (void)vd_addInputView:(id)inputView {
    [self.vd_inputManager addInputView:inputView];
}

- (void)vd_addInputView:(id)inputView atIndex:(NSUInteger)index {
    [self.vd_inputManager addInputView:inputView atIndex:index];
}

- (void)vd_clearInputViews {
    [self.vd_inputManager clearInputViews];
}

- (void)vd_resignCurrentInputView {
    [self.vd_inputManager resignCurrentInputView];
}

- (void)vd_signUpFirstResponder:(id)inputView {
    [self.vd_inputManager signUpFirstResponder:inputView];
}

#pragma mark Properties
- (VDInputManager *)vd_inputManager {
    VDInputManager *inputManager = objc_getAssociatedObject(self, @selector(vd_inputManager));
    if (!inputManager) {
        inputManager = [[VDInputManager alloc] init];
        objc_setAssociatedObject(self, @selector(vd_inputManager), inputManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return inputManager;
}

#pragma mark Private Method


@end
