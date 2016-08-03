//
//  PullToRefreshTableViewCell.m
//  objcTempDemo
//
//  Created by Deng on 16/7/21.
//  Copyright © Deng. All rights reserved.
//

#import "PullToRefreshTableViewCell.h"
//#import "objcTemp.h"
//@import objcTemp;


@interface PullToRefreshTableViewCell ()

@end


@implementation PullToRefreshTableViewCell

#pragma mark Public Method
+ (CGSize)cellSizeWithEstimatedSize:(CGSize)estimatedSize {
//    PullToRefreshTableViewCell *cell = [self cellInstance];
    
    return estimatedSize;
}

#pragma mark Properties


#pragma mark Overrides
- (void)awakeFromNib {
    // Initialization code
    [self internalInitPullToRefreshTableViewCell];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    UICollectionViewCell
    // Configure the view for the selected state
}

- (void)dealloc {
    
}


#pragma mark IBActions


#pragma mark Delegates


#pragma mark Private Method
//+ (instancetype)cellInstance {
//    static PullToRefreshTableViewCell *cell = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        cell = [PullToRefreshTableViewCell vd_viewFromNib];
//    } );
//    
//    return cell;
//}

- (void)internalInitPullToRefreshTableViewCell {
    
}

@end
