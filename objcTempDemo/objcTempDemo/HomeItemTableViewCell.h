//
//  HomeItemTableViewCell.h
//  objcTempDemo
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeBusinessProcess.h"

@class HomeItemTableViewCell;

@interface HomeItemTableViewCell : UITableViewCell

#pragma mark Public Method
+ (CGSize)cellSizeWithEstimatedSize:(CGSize)estimatedSize;
- (void)setType:(HomeItemType)type;

#pragma mark Properties
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end
