//
//  VDToastView.m
//  objcTemp
//
//  Created by Deng on 16/7/13.
//  Copyright © Deng. All rights reserved.
//

#import "VDToastView.h"
#import "VDMacros.h"
#import "NSObject+VDEnhance.h"
#import "NSMutableArray+VDEnhance.h"
//#import "objcTemp.h"
//@import objcTemp;


@interface VDToastView ()

@property (nonatomic, strong, readwrite) UILabel *infoLabel;
@property (nonatomic, assign) BOOL isShowing;

@property (nonatomic, assign) CGFloat keyboardHeight;

@end


@implementation VDToastView

#pragma mark Public Method
+ (void)showToast:(NSString *)info {
    VDToastView *toastView = [self vd_sharedInstance];
    [toastView pushInfo:info];
}

+ (void)showToast:(NSString *)info withShowTime:(NSTimeInterval)showTime {
    VDToastView *toastView = [self vd_sharedInstance];
    [toastView pushInfo:info];
}

- (void)pushInfo:(NSString *)info {
    [self.infoArray vd_queuePush:info];
    [self internalShowNextInfo];
}

#pragma mark Properties
- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] init];
        _infoLabel.backgroundColor = [UIColor clearColor];
        _infoLabel.textColor = [UIColor whiteColor];
        _infoLabel.font = [UIFont systemFontOfSize:17.0f];
        _infoLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _infoLabel;
}

- (NSMutableArray *)infoArray {
    if (!_infoArray) {
        _infoArray = [NSMutableArray new];
    }
    
    return _infoArray;
}

- (void)setKeyboardHeight:(CGFloat)keyboardHeight {
    if (_keyboardHeight != keyboardHeight) {
        _keyboardHeight = keyboardHeight;
        [self setNeedsLayout];
    }
}


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    [self internalInitVDToastView];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self internalInitVDToastView];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    [self internalInitVDToastView];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)layoutSubviews {
    CGFloat minToastWidth = VDWindow.bounds.size.width * 0.4f;
    CGFloat maxToastWidth = VDWindow.bounds.size.width * 0.9f;
    
    CGFloat infoLabelTopBottom = 8.0f;
    CGFloat infoLabelLeftRight = 16.0f;
    
    CGSize infoLabelSize = [self.infoLabel sizeThatFits:CGSizeMake(maxToastWidth, HUGE_VALF)];
    
    CGFloat toastWidth = infoLabelSize.width + infoLabelLeftRight * 2.0f;
    toastWidth = MIN(toastWidth, maxToastWidth);
    toastWidth = MAX(toastWidth, minToastWidth);
    
    self.infoLabel.frame = CGRectMake((toastWidth - infoLabelSize.width) / 2.0f, infoLabelTopBottom, infoLabelSize.width, infoLabelSize.height);
    
    CGFloat toastHeight = infoLabelSize.height + infoLabelTopBottom * 2.0f;
    
    self.bounds = CGRectMake(0.0f, 0.0f, toastWidth, toastHeight);
    self.center = CGPointMake(VDWindow.bounds.size.width / 2.0f, (VDWindow.bounds.size.height - self.keyboardHeight - toastHeight - 60.0f) + toastHeight / 2.0f);
    
    [super layoutSubviews];
}


#pragma mark IBActions


#pragma mark Delegates


#pragma mark Private Method
- (void)internalInitVDToastView {
    _defaultShowTime = 3;
    
    self.backgroundColor = VDRGBAColor(0.0f, 0.0f, 0.0f, 150.0f);
    self.layer.cornerRadius = 12.0f;
    
    [self addSubview:self.infoLabel];
    
    self.userInteractionEnabled = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internalOnKeyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)internalShowNextInfo {
    if (self.isShowing) {
        return;
    }
    
    if (self.infoArray.count == 0) {
        return;
    }
    
    self.isShowing = YES;
    self.infoLabel.text = [self.infoArray vd_queuePop];
    [self setNeedsLayout];
    [VDWindow addSubview:self];
    VDWeakifySelf;
    [UIView transitionWithView:self duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        VDStrongifySelf;
        self.hidden = NO;
    } completion:^(BOOL finished) {
        VDStrongifySelf;
        [self performSelector:@selector(internalHideInfo) withObject:nil afterDelay:self.defaultShowTime];
    }];
}

- (void)internalHideInfo {
    if (!self.isShowing) {
        return;
    }
    
    VDWeakifySelf;
    [UIView transitionWithView:self duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        VDStrongifySelf;
        self.hidden = YES;
    } completion:^(BOOL finished) {
        VDStrongifySelf;
        [self removeFromSuperview];
        self.isShowing = NO;
        [self internalShowNextInfo];
    }];
}

- (void)internalOnKeyboardWillChangeFrame:(NSNotification *)notification {
    CGRect endFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.keyboardHeight = endFrame.size.height;
}

@end
