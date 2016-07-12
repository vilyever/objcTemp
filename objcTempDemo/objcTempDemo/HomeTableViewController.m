//
//  HomeTableViewController.m
//  objcTempDemo
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "HomeTableViewController.h"
#import "HomeItemTableViewCell.h"
@import objcTemp;


@interface HomeTableViewController () <HomeBusinessProcessDelegate>

@end

@implementation HomeTableViewController

#pragma mark Public Method


#pragma mark Properties


#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    self.tableView.delaysContentTouches = NO;
    
    [HomeItemTableViewCell vd_registerNibWithTableView:self.tableView];
    
    [HomeBusinessProcess registerDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [self.navigationController setNavigationBarHidden:YES];
    [HomeBusinessProcess modifySelectedItemType:HomeItemTypeAutoPanNone];
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [HomeBusinessProcess vd_sharedInstance].homeItemTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeItemTableViewCell *cell = [HomeItemTableViewCell vd_dequeueCellWithTableView:tableView forIndexPath:indexPath];
    
//    cell.delegate = self;
    HomeItemType type = [[HomeBusinessProcess vd_sharedInstance].homeItemTypes[indexPath.item] integerValue];
    [cell setType:type];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HomeItemType type = [[HomeBusinessProcess vd_sharedInstance].homeItemTypes[indexPath.item] integerValue];
    
    [[HomeBusinessProcess vd_sharedInstance] setSelectedItemType:type];
}

- (void)onSelectedHomeItemTypeChange:(HomeItemType)type {
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:type inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark Private Method

@end
