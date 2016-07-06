//
//  UITableViewCell+VDEnhance.h
//  objcTemp
//
//  Created by Deng on 16/7/6.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITableViewCell (VDEnhance)

#pragma mark Public Method
+ (void)vd_registerNibWithTableView:(UITableView *)tableView;

+ (void)vd_registerClassWithTableView:(UITableView *)tableView;

+ (instancetype)vd_dequeueCellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;

@end
