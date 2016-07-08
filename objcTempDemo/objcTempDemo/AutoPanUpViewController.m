//
//  AutoPanUpViewController.m
//  objcTempDemo
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "AutoPanUpViewController.h"
//#import "objcTemp.h"
@import objcTemp;

@interface AutoPanUpViewController ()

@property (weak, nonatomic) IBOutlet UITextField *centerTextField;

@end


@implementation AutoPanUpViewController

#pragma mark Public Method


#pragma mark Properties


#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [VDAutoPanUpManager triggerOnWithDefaultOffset:20.0f];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
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
