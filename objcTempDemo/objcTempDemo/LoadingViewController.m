//
//  LoadingViewController.m
//  objcTempDemo
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import "LoadingViewController.h"
//#import "objcTemp.h"
@import objcTemp;


@interface LoadingViewController ()

@property (weak, nonatomic) IBOutlet VDLoadingView *loadingView;

@end


@implementation LoadingViewController

#pragma mark Public Method


#pragma mark Properties


#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self.loadingView startAnimation];
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


#pragma mark Private Methods

@end
