//
//  HudViewController.m
//  objcTempDemo
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import "HudViewController.h"
#import "TextHudViewController.h"
//#import "objcTemp.h"
@import objcTemp;


@interface HudViewController ()

@property (weak, nonatomic) IBOutlet UIButton *showButton;

@end


@implementation HudViewController

#pragma mark Public Method


#pragma mark Properties


#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
- (IBAction)onShowButtonClick:(id)sender {
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
//    view.backgroundColor = [UIColor redColor];
//    [view vd_showAsHud];
//    [view vd_hideHudDelay:3];
    
    
//    TextHudViewController *controller = [TextHudViewController vd_controllerFromNib];
//    [controller.view vd_showAsHud];
//    [controller.view vd_hideHudDelay:3];
    
    VDSimpleHudViewController *controller = [[VDSimpleHudViewController alloc] init];
    controller.title = @"haha";
    controller.leftButtonTitle = @"left";
    controller.centerButtonTitle = @"center";
    controller.rightButtonTitle = @"right";
    
    controller.shouldDisplayLeftButton = YES;
    controller.shouldDisplayCenterButton = YES;
    controller.shouldDisplayRightButton = YES;
    
    VDLoadingAngularVariationView *loadingView = [[VDLoadingAngularVariationView alloc] init];
    controller.customView = loadingView;
    
    [controller vd_showAsHud];
    [controller vd_hideHudDelay:3];
}


#pragma mark Delegates


#pragma mark Private Methods

@end
