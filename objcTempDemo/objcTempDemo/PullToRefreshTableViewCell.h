//
//  PullToRefreshTableViewCell.h
//  objcTempDemo
//
//  Created by Deng on 16/7/21.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@class PullToRefreshTableViewCell;

@interface PullToRefreshTableViewCell : UITableViewCell

#pragma mark Public Method
+ (CGSize)cellSizeWithEstimatedSize:(CGSize)estimatedSize;


#pragma mark Properties
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


#pragma mark Private Method
- (void)internalInitPullToRefreshTableViewCell;

@end
