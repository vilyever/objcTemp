//
//  HomeItemTableViewCell.m
//  objcTempDemo
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "HomeItemTableViewCell.h"
//#import "objcTemp.h"


@interface HomeItemTableViewCell ()

@end


@implementation HomeItemTableViewCell

#pragma mark Public Method
+ (CGSize)cellSizeWithEstimatedSize:(CGSize)estimatedSize {
//    HomeItemTableViewCell *cell = [self cellInstance];
    
    return estimatedSize;
}

- (void)setType:(HomeItemType)type {
    switch (type) {
        case HomeItemTypeAutoPanUp: {
            self.titleLabel.text = @"AutoPanUp";
            break;
        }
        case HomeItemTypeHud: {
            self.titleLabel.text = @"Hud";
            break;
        }
        case HomeItemTypeLoadingView: {
            self.titleLabel.text = @"LoadingView";
            break;
        }
    }
}

#pragma mark Properties


#pragma mark Overrides
- (void)awakeFromNib {
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)dealloc {
    
}


#pragma mark IBActions


#pragma mark Delegates


#pragma mark Private Method
//+ (instancetype)cellInstance {
//    static HomeItemTableViewCell *cell = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        cell = [HomeItemTableViewCell vd_viewFromNib];
//    } );
//    
//    return cell;
//}

@end
