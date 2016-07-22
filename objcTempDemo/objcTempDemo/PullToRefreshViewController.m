//
//  PullToRefreshViewController.m
//  objcTempDemo
//
//  Created by Deng on 16/7/21.
//  Copyright © Deng. All rights reserved.
//

#import "PullToRefreshViewController.h"
#import "PullToRefreshTableViewCell.h"
//#import "objcTemp.h"
@import objcTemp;


@interface PullToRefreshViewController () <UITableViewDataSource, UITableViewDelegate, VDPullRefreshDelegate>

@property (weak, nonatomic) IBOutlet UIView *controlView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *orientationButton;
@property (weak, nonatomic) IBOutlet UIButton *headerEnableButton;
@property (weak, nonatomic) IBOutlet UIButton *trailerEnableButton;
@property (weak, nonatomic) IBOutlet UIButton *headerRefreshingButton;
@property (weak, nonatomic) IBOutlet UIButton *trailerRefreshingButton;
@property (weak, nonatomic) IBOutlet UIButton *removeHeaderButton;
@property (weak, nonatomic) IBOutlet UIButton *removeTrailerButton;

@property (nonatomic, assign) NSInteger refreshCount;
@property (nonatomic, assign) NSInteger dataCount;

@end


@implementation PullToRefreshViewController

#pragma mark Public Method


#pragma mark Properties


#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataCount = 30;
    
    [PullToRefreshTableViewCell vd_registerNibWithTableView:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.vd_pullRefreshDelegate = self;
    VDWeakifySelf;
    [self.tableView vd_enablePullRefreshHeaderWithAction:^void(void){
        VDStrongifySelf;
        [self performSelector:@selector(internalRefresh) withObject:nil afterDelay:5];
    }];
    [self.tableView vd_enablePullRefreshTrailerWithAction:^void(void){
        VDStrongifySelf;
        [self performSelector:@selector(internalLoadMore) withObject:nil afterDelay:5];
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
- (IBAction)onOrientationButtonClick:(id)sender {
    if (self.tableView.vd_pullOrientation == VDPullRefreshOrientationVertical) {
        self.tableView.vd_pullOrientation = VDPullRefreshOrientationHorizontal;
        [self.orientationButton setTitle:@"Horizontal" forState:UIControlStateNormal];
    }
    else {
        self.tableView.vd_pullOrientation = VDPullRefreshOrientationVertical;
        [self.orientationButton setTitle:@"Vertical" forState:UIControlStateNormal];
    }
}
- (IBAction)onHeaderEnableButtonClick:(id)sender {
    self.tableView.vd_isPullRefreshHeaderEnable = !self.tableView.vd_isPullRefreshHeaderEnable;
}
- (IBAction)onTrailerButtonClick:(id)sender {
    self.tableView.vd_isPullRefreshTrailerEnable = !self.tableView.vd_isPullRefreshTrailerEnable;
}
- (IBAction)onHeaderRefreshingButtonClick:(id)sender {
    self.tableView.vd_isPullRefreshHeaderRefreshing = !self.tableView.vd_isPullRefreshHeaderRefreshing;
}
- (IBAction)onTrailerRefreshingButtonClick:(id)sender {
    self.tableView.vd_isPullRefreshTrailerRefreshing = !self.tableView.vd_isPullRefreshTrailerRefreshing;
}
- (IBAction)onRemoveHeaderButtonClick:(id)sender {
    [self.tableView vd_setPullRefreshHeaderView:nil];
}
- (IBAction)onRemoveTrailerButtonClick:(id)sender {
    [self.tableView vd_setPullRefreshTrailerView:nil];
}



#pragma mark Delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PullToRefreshTableViewCell *cell = [PullToRefreshTableViewCell vd_dequeueCellWithTableView:tableView forIndexPath:indexPath];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%@ -- %@", @(self.refreshCount), @(indexPath.row)];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0f;
}

- (void)onPullRefreshView:(UIScrollView *)view headerPullingEnableStateChange:(BOOL)enabled {
    [self.headerEnableButton setTitle:(enabled ? @"Header Disable" : @"Header Enable") forState:UIControlStateNormal];
}
- (void)onPullRefreshView:(UIScrollView *)view headerRefreshingStateChange:(BOOL)refreshing {
     [self.headerRefreshingButton setTitle:(refreshing ? @"Stop Header" : @"Start Header") forState:UIControlStateNormal];
}
- (void)onPullRefreshView:(UIScrollView *)view trailerPullingEnableStateChange:(BOOL)enabled {
     [self.trailerEnableButton setTitle:(enabled ? @"Trailer Disable" : @"Trailer Enable") forState:UIControlStateNormal];
}
- (void)onPullRefreshView:(UIScrollView *)view trailerRefreshingStateChange:(BOOL)refreshing {
    [self.trailerRefreshingButton setTitle:(refreshing ? @"Stop Trailer" : @"Start Trailer") forState:UIControlStateNormal];
}

#pragma mark Private Methods
- (void)internalInitPullToRefreshViewController {
}

- (void)internalRefresh {
    self.refreshCount++;
    self.dataCount = 30;
    [self.tableView reloadData];
    [self.tableView vd_stopPullRefreshHeaderRefreshing];
    self.tableView.vd_isPullRefreshTrailerEnable = YES;
}

- (void)internalLoadMore {
    self.dataCount += 30;
    [self.tableView reloadData];
    [self.tableView vd_stopPullRefreshTrailerRefreshing];
    
    if (self.dataCount > 100) {
        [self.tableView vd_disablePullRefreshTrailder];
    }
}

@end
