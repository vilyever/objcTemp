//
//  LoadingHudViewController.m
//  FTETAssistantForiOS
//
//  Created by Deng on 16/7/13.
//  Copyright © Deng. All rights reserved.
//

#import "LoadingHudViewController.h"
//#import "objcTemp.h"
//@import objcTemp;


@interface LoadingHudViewController ()

@property (nonatomic, strong, readwrite) VDLoadingAngularVariationView *loadingView;

@end


@implementation LoadingHudViewController

#pragma mark Public Method


#pragma mark Properties
- (VDLoadingAngularVariationView *)loadingView {
    if (!_loadingView) {
        _loadingView = [[VDLoadingAngularVariationView alloc] init];
    }
    
    return _loadingView;
}

#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.customView = self.loadingView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.loadingView startAnimation];
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
    
//    [self.loadingView stopAnimation];
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

#pragma mark IBActions


#pragma mark Delegates


#pragma mark Private Methods
- (void)internalInitLoadingHudViewController {
    
}

@end
