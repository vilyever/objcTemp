//
//  VDInputManager.m
//  objcTemp
//
//  Created by Deng on 16/7/13.
//  Copyright © Deng. All rights reserved.
//

#import "VDInputManager.h"
//#import "objcTemp.h"
//@import objcTemp;
#import "VDMacros.h"
#import "VDWeakRef.h"

@interface VDInputManager ()


@end


@implementation VDInputManager

#pragma mark Public Method
- (void)addInputView:(id)inputView {
    if ([inputView respondsToSelector:@selector(setInputAccessoryView:)]) {
        [inputView setInputAccessoryView:self.inputAccessoryToolBar];
    }
    
    [self.inputViews addObject:[inputView vd_weakRef]];
    
    [self internalFindPrevNextInputView];
}

- (void)addInputView:(id)inputView atIndex:(NSUInteger)index {
    if ([inputView respondsToSelector:@selector(setInputAccessoryView:)]) {
        [inputView setInputAccessoryView:self.inputAccessoryToolBar];
    }

    [self.inputViews insertObject:[inputView vd_weakRef] atIndex:index];
    
    [self internalFindPrevNextInputView];
}

- (void)clearInputViews {
    [self.inputViews removeAllObjects];
    self.currentInputView = nil;
}

- (void)resignCurrentInputView {
    if ([self.currentInputView respondsToSelector:@selector(resignFirstResponder)]) {
        [self.currentInputView resignFirstResponder];
    }
}

- (void)signUpFirstResponder:(id)inputView {
    if ([inputView respondsToSelector:@selector(becomeFirstResponder)]) {
        [inputView becomeFirstResponder];
    }
}

#pragma mark Properties
- (UIToolbar *)inputAccessoryToolBar {
    if (!_inputAccessoryToolBar) {
        _inputAccessoryToolBar = [ [UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, VDWindow.bounds.size.width, 44.0f) ];
        [_inputAccessoryToolBar setBarStyle:UIBarStyleBlack];

        UIBarButtonItem *spaceItem = [ [UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        NSArray *buttons = [NSArray arrayWithObjects:self.prevBarButtonItem, self.nextBarButtonItem, spaceItem, self.clearBarButtonItem, self.doneBarButtonItem, nil];
        [_inputAccessoryToolBar setItems:buttons];
    }
    
    return _inputAccessoryToolBar;
}

- (UIBarButtonItem *)prevBarButtonItem {
    if (!_prevBarButtonItem) {
        _prevBarButtonItem = [ [UIBarButtonItem alloc] initWithTitle:@"Prev" style:UIBarButtonItemStylePlain target:self action:@selector(internalOnPrevButtonClick:) ];
    }
    
    return _prevBarButtonItem;
}

- (UIBarButtonItem *)nextBarButtonItem {
    if (!_nextBarButtonItem) {
        _nextBarButtonItem = [ [UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(internalOnNextButtonClick:) ];
    }
    
    return _nextBarButtonItem;
}

- (UIBarButtonItem *)clearBarButtonItem {
    if (!_clearBarButtonItem) {
        _clearBarButtonItem = [ [UIBarButtonItem alloc] initWithTitle:@"Clear" style:UIBarButtonItemStylePlain target:self action:@selector(internalOnClearButtonClick:) ];
    }
    
    return _clearBarButtonItem;
}

- (UIBarButtonItem *)doneBarButtonItem {
    if (!_doneBarButtonItem) {
        _doneBarButtonItem = [ [UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(internalOnDoneButtonClick:) ];
    }
    
    return _doneBarButtonItem;
}

- (NSMutableArray *)inputViews {
    if (!_inputViews) {
        _inputViews = [NSMutableArray new];
    }
    
    return _inputViews;
}

- (void)setCurrentInputView:(id)currentInputView {
    _currentInputView = currentInputView;
    
    [self internalFindPrevNextInputView];
}

- (void)setPrevInputView:(id)prevInputView {
    if (_prevInputView != prevInputView) {
        _prevInputView = prevInputView;
        self.prevBarButtonItem.enabled = _prevInputView != nil;
    }
}

- (void)setNextInputView:(id)nextInputView {
    if (_nextInputView != nextInputView) {
        _nextInputView = nextInputView;
        self.nextBarButtonItem.enabled = _nextInputView != nil;
    }
}


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    [self internalInitVDInputManager];
    
    return self;
}

- (void)dealloc {
    [VDDefaultNotificationCenter removeObserver:self];
}


#pragma mark Delegates


#pragma mark Private Method
- (void)internalInitVDInputManager {
    [VDDefaultNotificationCenter addObserver:self selector:@selector(internalOnTextFieldBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [VDDefaultNotificationCenter addObserver:self selector:@selector(internalOnTextViewBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:nil];
}

- (void)internalOnTextFieldBeginEditing:(NSNotification *)notification {
    self.currentInputView = notification.object;
}

- (void)internalOnTextViewBeginEditing:(NSNotification *)notification {
    self.currentInputView = notification.object;
}

- (void)internalOnPrevButtonClick:(id)sender {
    [self signUpFirstResponder:self.prevInputView];
}

- (void)internalOnNextButtonClick:(id)sender {
    [self signUpFirstResponder:self.nextInputView];
}

- (void)internalOnClearButtonClick:(id)sender {
    if ([self.currentInputView respondsToSelector:@selector(setText:)]) {
        [self.currentInputView setText:@""];
    }
}

- (void)internalOnDoneButtonClick:(id)sender {
    [self resignCurrentInputView];
}

- (void)internalFindPrevNextInputView {
    if (self.inputViews.count <= 1
        || !self.currentInputView) {
        self.prevInputView = nil;
        self.nextInputView = nil;
    }
    else {
        NSUInteger index = [self.inputViews indexOfObject:self.currentInputView];
        if (index > 0) {
            self.prevInputView = self.inputViews[index - 1];
        }
        else {
            self.prevInputView = nil;
        }
        
        if (index < self.inputViews.count - 1) {
            self.nextInputView = self.inputViews[index + 1];
        }
        else {
            self.nextInputView = nil;
        }
    }
}

@end
