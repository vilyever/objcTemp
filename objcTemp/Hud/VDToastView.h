//
//  VDToastView.h
//  objcTemp
//
//  Created by Deng on 16/7/13.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@class VDToastView;

@interface VDToastView : UIView

#pragma mark Public Method
+ (VDToastView *)sharedToastView;
+ (void)showToast:(NSString *)info;
+ (void)showToast:(NSString *)info withShowTime:(NSTimeInterval)showTime;
- (void)pushInfo:(NSString *)info;


#pragma mark Properties
@property (nonatomic, strong, readonly) UILabel *infoLabel;
@property (nonatomic, strong) NSMutableArray *infoArray;
@property (nonatomic, assign) NSTimeInterval defaultShowTime;

#pragma mark Private Method
- (void)internalInitVDToastView;

@end
