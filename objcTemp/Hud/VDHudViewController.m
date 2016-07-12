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
- (UIColor *)hudBackgroundColor {
    return VDRGBAColor(0.0f, 0.0f, 0.0f, 180.0f);
}

- (CGFloat)hudCornerRadius {
    return 8.0f;
}

- (CGSize)hudSize {
    return self.view.bounds.size;
}

#pragma mark Properties


#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [self hudBackgroundColor];
    self.view.layer.cornerRadius = [self hudCornerRadius];
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

//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleDefault;
//}

- (void)viewWillLayoutSubviews {
    self.view.bounds = CGRectMake(0.0f, 0.0f, [self hudSize].width, [self hudSize].height);
}

#pragma mark IBActions


#pragma mark Delegates


#pragma mark Private Methods

@end
