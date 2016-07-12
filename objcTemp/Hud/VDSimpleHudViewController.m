//
//  VDSimpleHudViewController.m
//  objcTemp
//
//  Created by Deng on 16/7/12.
//  Copyright © Deng. All rights reserved.
//

#import "VDSimpleHudViewController.h"
//#import "objcTemp.h"
//@import objcTemp;


@interface VDSimpleHudViewController ()

@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UIView *verticalSplitLineView;
@property (nonatomic, strong, readwrite) UIView *buttonsLayoutView;
@property (nonatomic, strong, readwrite) UIButton *leftButton;
@property (nonatomic, strong, readwrite) UIView *leftButtonSplitLineView;
@property (nonatomic, strong, readwrite) UIButton *centerButton;
@property (nonatomic, strong, readwrite) UIView *rightButtonSplitLineView;
@property (nonatomic, strong, readwrite) UIButton *rightButton;

@end


@implementation VDSimpleHudViewController

#pragma mark Public Method


#pragma mark Properties
- (void)setHudTitle:(NSString *)hudTitle {
    _hudTitle = [hudTitle copy];
    self.titleLabel.text = _hudTitle;
    [self.view setNeedsLayout];
}

- (void)setLeftButtonTitle:(NSString *)leftButtonTitle {
    _leftButtonTitle = leftButtonTitle;
    [self.leftButton setTitle:_leftButtonTitle forState:UIControlStateNormal];
}

- (void)setCenterButtonTitle:(NSString *)centerButtonTitle {
    _centerButtonTitle = centerButtonTitle;
    [self.centerButton setTitle:_centerButtonTitle forState:UIControlStateNormal];
}

- (void)setRightButtonTitle:(NSString *)rightButtonTitle {
    _rightButtonTitle = rightButtonTitle;
    [self.rightButton setTitle:_rightButtonTitle forState:UIControlStateNormal];
}

- (void)setShouldDisplayLeftButton:(BOOL)shouldDisplayLeftButton {
    _shouldDisplayLeftButton = shouldDisplayLeftButton;
    [self.view setNeedsLayout];
}

- (void)setShouldDisplayCenterButton:(BOOL)shouldDisplayCenterButton {
    _shouldDisplayCenterButton = shouldDisplayCenterButton;
    [self.view setNeedsLayout];
}

- (void)setShouldDisplayRightButton:(BOOL)shouldDisplayRightButton {
    _shouldDisplayRightButton = shouldDisplayRightButton;
    [self.view setNeedsLayout];
}

- (void)setCustomView:(UIView *)customView {
    if (_customView != customView) {
        [_customView removeFromSuperview];
        _customView = customView;
        [self.view addSubview:_customView];
        [self.view setNeedsLayout];
    }
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}

- (UIView *)verticalSplitLineView {
    if (!_verticalSplitLineView) {
        _verticalSplitLineView = [self internalGenerateSplitLineView];
    }
    
    return _verticalSplitLineView;
}

- (UIView *)buttonsLayoutView {
    if (!_buttonsLayoutView) {
        _buttonsLayoutView = [[UIView alloc] init];
        _buttonsLayoutView.backgroundColor = [UIColor clearColor];
    }
    
    return _buttonsLayoutView;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [self internalGenerateButton];
    }
    
    return _leftButton;
}

- (UIView *)leftButtonSplitLineView {
    if (!_leftButtonSplitLineView) {
        _leftButtonSplitLineView = [self internalGenerateSplitLineView];
    }
    
    return _leftButtonSplitLineView;
}

- (UIButton *)centerButton {
    if (!_centerButton) {
        _centerButton = [self internalGenerateButton];
    }
    
    return _centerButton;
}

- (UIView *)rightButtonSplitLineView {
    if (!_rightButtonSplitLineView) {
        _rightButtonSplitLineView = [self internalGenerateSplitLineView];
    }
    
    return _rightButtonSplitLineView;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [self internalGenerateButton];
    }
    
    return _rightButton;
}

#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.verticalSplitLineView];
    [self.view addSubview:self.buttonsLayoutView];
    [self.buttonsLayoutView addSubview:self.leftButton];
    [self.buttonsLayoutView addSubview:self.leftButtonSplitLineView];
    [self.buttonsLayoutView addSubview:self.centerButton];
    [self.buttonsLayoutView addSubview:self.rightButtonSplitLineView];
    [self.buttonsLayoutView addSubview:self.rightButton];
    
    _shouldDisplayLeftButton = NO;
    _shouldDisplayCenterButton = NO;
    _shouldDisplayRightButton = NO;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
}

- (void)viewWillLayoutSubviews {
    CGFloat minHudWidth = VDWindow.bounds.size.width * 0.4f;
    CGFloat maxHudWidth = VDWindow.bounds.size.width * 0.9f;
    
    CGFloat titleLabelTopBottom = 8.0f;
    CGFloat titleLabelLeftRight = 16.0f;
    CGFloat titleLabelHeight = 30.0f;
    
    CGFloat customViewLeftRightBottom = 8.0f;
    
    CGFloat splitLineWidthHeight = 1.0f;
    
    CGFloat buttonsLayoutViewHeight = 44.0f;
    
    CGSize titleLabelSize = [self.titleLabel sizeThatFits:CGSizeMake(maxHudWidth, HUGE_VALF)];
    CGSize customViewSize = [self.customView sizeThatFits:CGSizeMake(maxHudWidth, HUGE_VALF)];
    
    CGFloat hudWidth = MAX(titleLabelSize.width + titleLabelLeftRight * 2.0f, customViewSize.width + customViewLeftRightBottom * 2.0f);
    hudWidth = MIN(hudWidth, maxHudWidth);
    hudWidth = MAX(hudWidth, minHudWidth);
    
    CGFloat offsetY = 0.0f;
    
    self.titleLabel.frame = CGRectMake((hudWidth - titleLabelSize.width) / 2.0f, offsetY + titleLabelTopBottom, titleLabelSize.width, titleLabelHeight);
    offsetY = self.titleLabel.frame.origin.y + self.titleLabel.bounds.size.height + titleLabelTopBottom;
    
    if (self.customView) {
        self.customView.frame = CGRectMake((hudWidth - customViewSize.width) / 2.0f, offsetY, customViewSize.width, customViewSize.height);
        offsetY = self.customView.frame.origin.y + self.customView.bounds.size.height + customViewLeftRightBottom;;
    }
    
    NSInteger displayButtonsCount = 0;
    if (self.shouldDisplayLeftButton) displayButtonsCount++;
    if (self.shouldDisplayCenterButton) displayButtonsCount++;
    if (self.shouldDisplayRightButton) displayButtonsCount++;
    
    [self.verticalSplitLineView setHidden:(displayButtonsCount == 0)];
    [self.buttonsLayoutView setHidden:(displayButtonsCount == 0)];
    
    if (displayButtonsCount > 0) {
        self.verticalSplitLineView.frame = CGRectMake(0.0f, offsetY, hudWidth, splitLineWidthHeight);
        offsetY += self.verticalSplitLineView.bounds.size.height;
        
        self.buttonsLayoutView.frame = CGRectMake(0.0f, offsetY, hudWidth, buttonsLayoutViewHeight);
        
        CGFloat buttonSplitLineTotalWidth = splitLineWidthHeight * (displayButtonsCount - 1);
        
        CGFloat buttonOffsetX = 0.0f;
        [self.leftButton setHidden:!self.shouldDisplayLeftButton];
        if (self.shouldDisplayLeftButton) {
            self.leftButton.frame = CGRectMake(buttonOffsetX, 0.0f, (self.buttonsLayoutView.bounds.size.width - buttonSplitLineTotalWidth) / displayButtonsCount, self.buttonsLayoutView.bounds.size.height);
            buttonOffsetX = self.leftButton.frame.origin.x + self.leftButton.bounds.size.width;
            
            if (displayButtonsCount > 1) {
                [self.leftButtonSplitLineView setHidden:NO];
                self.leftButtonSplitLineView.frame = CGRectMake(buttonOffsetX, 0.0f, splitLineWidthHeight, self.buttonsLayoutView.bounds.size.height);
                buttonOffsetX += self.leftButtonSplitLineView.bounds.size.width;
            }
            else {
                [self.leftButtonSplitLineView setHidden:YES];
            }
        }
        
        [self.centerButton setHidden:!self.shouldDisplayCenterButton];
        if (self.shouldDisplayCenterButton) {
            self.centerButton.frame = CGRectMake(buttonOffsetX, 0.0f, (self.buttonsLayoutView.bounds.size.width - buttonSplitLineTotalWidth) / displayButtonsCount, self.buttonsLayoutView.bounds.size.height);
            buttonOffsetX = self.centerButton.frame.origin.x + self.centerButton.bounds.size.width;
            
            if (self.shouldDisplayRightButton) {
                [self.rightButtonSplitLineView setHidden:NO];
                self.rightButtonSplitLineView.frame = CGRectMake(buttonOffsetX, 0.0f, splitLineWidthHeight, self.buttonsLayoutView.bounds.size.height);
                buttonOffsetX += self.rightButtonSplitLineView.bounds.size.width;
            }
            else {
                [self.rightButtonSplitLineView setHidden:YES];
            }
        }
        
        [self.rightButton setHidden:!self.shouldDisplayRightButton];
        if (self.shouldDisplayRightButton) {
            self.rightButton.frame = CGRectMake(buttonOffsetX, 0.0f, (self.buttonsLayoutView.bounds.size.width - buttonSplitLineTotalWidth) / displayButtonsCount, self.buttonsLayoutView.bounds.size.height);
            buttonOffsetX = self.rightButton.frame.origin.x + self.rightButton.bounds.size.width;
        }
        
        offsetY += self.buttonsLayoutView.bounds.size.height;
    }
    
    self.hudSize = CGSizeMake(hudWidth, offsetY);
    
    [super viewWillLayoutSubviews];
}
   
- (void)setTitle:(NSString *)title {
   [super setTitle:title];
   self.hudTitle = title;
}

//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleDefault;
//}

#pragma mark IBActions


#pragma mark Delegates


#pragma mark Private Methods
- (UIView *)internalGenerateSplitLineView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor lightGrayColor];
    return view;
}

- (UIButton *)internalGenerateButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:[UIColor colorWithRed:0.0f green:122.0f / 255.0f blue:1.0f alpha:1.0f] forState:UIControlStateNormal];

    button.titleLabel.font = [UIFont systemFontOfSize:18.0f];
    
    return button;
}

@end
