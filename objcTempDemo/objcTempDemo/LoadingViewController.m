//
//  LoadingViewController.m
//  objcTempDemo
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import "LoadingViewController.h"
#import "LoadingHudViewController.h"
//#import "objcTemp.h"
@import objcTemp;


@interface LoadingViewController () <VDSimpleHudViewControllerDelegate>

@property (weak, nonatomic) IBOutlet VDLoadingView *loadingView;
@property (nonatomic, strong) LoadingHudViewController *loadingHudViewController;

@end


@implementation LoadingViewController

#pragma mark Public Method


#pragma mark Properties
- (LoadingHudViewController *)loadingHudViewController {
    if (!_loadingHudViewController) {
        _loadingHudViewController = [LoadingHudViewController new];
        _loadingHudViewController.title = @"转转";
        _loadingHudViewController.leftButtonTitle = @"取消";
        _loadingHudViewController.shouldDisplayLeftButton = YES;
        _loadingHudViewController.delegate = self;
    }
    
    return _loadingHudViewController;
}

#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    VDWeakifySelf;
    [self.view vd_performActionOnTap:^{
        VDStrongifySelf;
        [self.loadingHudViewController vd_showAsHud];
    }];
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

#pragma mark IBActions


#pragma mark Delegates
- (void)onSimpleHudViewControllerLeftButtonClick:(VDSimpleHudViewController *)controller {
    [self.loadingHudViewController vd_hideHud];
}

#pragma mark Private Methods

@end
