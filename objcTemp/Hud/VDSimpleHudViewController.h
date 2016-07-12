//
//  VDSimpleHudViewController.h
//  objcTemp
//
//  Created by Deng on 16/7/12.
//  Copyright © Deng. All rights reserved.
//

#import <objcTemp/objcTemp.h>


@class VDSimpleHudViewController;

@interface VDSimpleHudViewController : VDHudViewController

#pragma mark Public Method


#pragma mark Properties
@property (nonatomic, copy) NSString *hudTitle;
@property (nonatomic, copy) NSString *leftButtonTitle;
@property (nonatomic, copy) NSString *centerButtonTitle;
@property (nonatomic, copy) NSString *rightButtonTitle;
@property (nonatomic, assign) BOOL shouldDisplayLeftButton;
@property (nonatomic, assign) BOOL shouldDisplayCenterButton;
@property (nonatomic, assign) BOOL shouldDisplayRightButton;

@property (nonatomic, strong) UIView *customView;

@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UIView *verticalSplitLineView;
@property (nonatomic, strong, readonly) UIView *buttonsLayoutView;
@property (nonatomic, strong, readonly) UIButton *leftButton;
@property (nonatomic, strong, readonly) UIView *leftButtonSplitLineView;
@property (nonatomic, strong, readonly) UIButton *centerButton;
@property (nonatomic, strong, readonly) UIView *rightButtonSplitLineView;
@property (nonatomic, strong, readonly) UIButton *rightButton;

@end
