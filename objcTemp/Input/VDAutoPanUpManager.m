//
//  VDAutoPanUpManager.m
//  objcTemp
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "VDAutoPanUpManager.h"
#import "UIView+VDFrame.h"
#import "NSObject+VDEnhance.h"
#import "VDMacros.h"
//#import "objcTemp.h"


@interface VDAutoPanUpManager ()

@property (nonatomic, weak) UIView *currentResponder;

@end


@implementation VDAutoPanUpManager

#pragma mark Public Method
+ (void)triggerOn {
    [self triggerOnWithDefaultOffset:0.0f];
}

+ (void)triggerOnWithDefaultOffset:(CGFloat)offset {
    [VDAutoPanUpManager vd_sharedInstance].defalutPanUpOffset = offset;
}

#pragma mark Properties


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalOnTextFieldDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalOnTextFieldDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalOnTextViewDidBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalOnTextFieldDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalOnKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalOnKeyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalOnKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalOnKeyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalOnKeyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalOnKeyboardDidChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark Delegates


#pragma mark Private Method
- (void)internalOnTextFieldDidBeginEditing:(NSNotification *)notification {
    self.currentResponder = notification.object;
}

- (void)internalOnTextFieldDidEndEditing:(NSNotification *)notification {
    self.currentResponder = nil;
}

- (void)internalOnTextViewDidBeginEditing:(NSNotification *)notification {
    self.currentResponder = notification.object;
}

- (void)internalOnTextViewDidEndEditing:(NSNotification *)notification {
//    self.currentResponder = nil;
}

- (void)internalOnKeyboardWillShow:(NSNotification *)notification {

}

- (void)internalOnKeyboardDidShow:(NSNotification *)notification {
    
}

- (void)internalOnKeyboardWillHide:(NSNotification *)notification {
    
}

- (void)internalOnKeyboardDidHide:(NSNotification *)notification {
}

- (void)internalOnKeyboardWillChangeFrame:(NSNotification *)notification {
    if (!self.currentResponder) {
        return;
    }
    
    CGFloat duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect beginFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    UIView *panUpView = VDWindow;
    CGFloat panUpOffset = self.defalutPanUpOffset;
    if (self.currentResponder.vd_autoPanUpElement) {
        panUpView = self.currentResponder.vd_autoPanUpElement.panUpView;
        panUpOffset = self.currentResponder.vd_autoPanUpElement.panUpOffset;
    }
    
    if (beginFrame.origin.y > endFrame.origin.y) {
        // show
        if (self.state == VDAutoPanUpStateOriginal) {
            // TODO: save original position
            if (self.currentResponder.vd_autoPanUpElement) {
                self.currentResponder.vd_autoPanUpElement.panUpViewOriginalY = panUpView.frame.origin.y;
            }
            else {
                self.originalWindowY = VDWindow.frame.origin.y;
            }
        }
        
        CGFloat responderViewYInWindow = [self.currentResponder convertPoint:CGPointZero toView:nil].y;
        CGFloat targetY = endFrame.origin.y - (self.currentResponder.vd_frameHeight + panUpOffset);
        
        if (targetY >= responderViewYInWindow) {
            return;
        }
        
        CGFloat panUpViewOriginalY = self.originalWindowY;
        if (self.currentResponder.vd_autoPanUpElement) {
            panUpViewOriginalY = self.currentResponder.vd_autoPanUpElement.panUpViewOriginalY;
        }
        
        [self.currentResponder.layer removeAllAnimations];
        self.state = VDAutoPanUpStateDoingPanUp;
        [UIView animateWithDuration:duration delay:0 options:(UIViewAnimationOptionBeginFromCurrentState) animations:^{
            panUpView.vd_frameY = panUpViewOriginalY - (responderViewYInWindow - targetY);
        } completion:^(BOOL finished) {
            if (finished) {
                self.state = VDAutoPanUpStateDonePanUp;
            }
        }];
    }
    else {
        // hide
        if (self.state == VDAutoPanUpStateOriginal) {
            return;
        }
        
        CGFloat panUpViewOriginalY = self.originalWindowY;
        if (self.currentResponder.vd_autoPanUpElement) {
            panUpViewOriginalY = self.currentResponder.vd_autoPanUpElement.panUpViewOriginalY;
        }
        
        [self.currentResponder.layer removeAllAnimations];
        self.state = VDAutoPanUpStateDoingPanBack;
        [UIView animateWithDuration:duration delay:0 options:(UIViewAnimationOptionBeginFromCurrentState) animations:^{
            panUpView.vd_frameY = panUpViewOriginalY;
        } completion:^(BOOL finished) {
            if (finished) {
                self.state = VDAutoPanUpStateOriginal;
            }
        }];
    }
    
}

- (void)internalOnKeyboardDidChangeFrame:(NSNotification *)notification {
}

@end
