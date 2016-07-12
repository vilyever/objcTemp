//
//  VDHudViewController.m
//  objcTemp
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import "VDHudViewController.h"
//#import "objcTemp.h"
//@import objcTemp;
#import "VDMacros.h"

@interface VDHudViewController ()


@end


@implementation VDHudViewController

#pragma mark Public Method

#pragma mark Properties
- (void)setHudBackgroundColor:(UIColor *)hudBackgroundColor {
    _hudBackgroundColor = hudBackgroundColor;
    self.view.backgroundColor = _hudBackgroundColor;
}

- (void)setHudCornerRadius:(CGFloat)hudCornerRadius {
    _hudCornerRadius = hudCornerRadius;
    self.view.layer.cornerRadius = _hudCornerRadius;
}

#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _hudBackgroundColor = VDRGBAColor(0.0f, 0.0f, 0.0f, 180.0f);
    _hudCornerRadius = 12.0f;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.view.backgroundColor = self.hudBackgroundColor;
    self.view.layer.cornerRadius = self.hudCornerRadius;
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

//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleDefault;
//}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.view.bounds = CGRectMake(0.0f, 0.0f, self.hudSize.width, self.hudSize.height);
}

#pragma mark IBActions


#pragma mark Delegates


#pragma mark Private Methods

@end
