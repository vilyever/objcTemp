//
//  UITableViewCell+VDEnhance.m
//  objcTemp
//
//  Created by Deng on 16/7/6.
//  Copyright © Deng. All rights reserved.
//

#import "UITableViewCell+VDEnhance.h"

//#import <objc/runtime.h>


@implementation UITableViewCell (VDEnhance)

#pragma mark Public Method
+ (void)vd_registerNibWithTableView:(UITableView *)tableView {
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass( [self class] ) bundle:nil] forCellReuseIdentifier:NSStringFromClass( [self class] ) ];
}

+ (void)vd_registerClassWithTableView:(UITableView *)tableView {
    [tableView registerClass:self forCellReuseIdentifier:NSStringFromClass( [self class] ) ];
}

+ (instancetype)vd_dequeueCellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass( [self class] ) forIndexPath:indexPath];
}

#pragma mark Private Method


@end
