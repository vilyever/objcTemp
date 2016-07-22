//
//  HomeBusinessProcess.h
//  objcTempDemo
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "BusinessProcess.h"

typedef NS_ENUM(NSInteger, HomeItemType) {
    HomeItemTypeAutoPanNone = -1,
    HomeItemTypeAutoPanUp,
    HomeItemTypeHud,
    HomeItemTypeLoadingView,
    HomeItemTypePullToRefresh,
};

@class HomeBusinessProcess;

@protocol HomeBusinessProcessDelegate <BusinessProcessDelegate>

@optional
- (void)onSelectedHomeItemTypeChange:(HomeItemType)type;

@end

@interface HomeBusinessProcess : BusinessProcess

#pragma mark Public Method
+ (NSMutableArray *)obtainHomeItemTypes;
+ (void)modifySelectedItemType:(HomeItemType)itemType;
+ (HomeItemType)obtainSelectedItemType;

#pragma mark Properties
@property (nonatomic, strong) NSMutableArray *homeItemTypes;
@property (nonatomic, assign) HomeItemType selectedItemType;

@end
