//
//  HomeBusinessProcess.h
//  objcTempDemo
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "BusinessProcess.h"

typedef NS_ENUM(NSInteger, HomeItemType) {
    HomeItemTypeAutoPanNone,
    HomeItemTypeAutoPanUp,
};

@class HomeBusinessProcess;

@protocol HomeBusinessProcessDelegate <BusinessProcessDelegate>

@optional
- (void)onHomeItemTypeChange:(HomeItemType)type;

@end

@interface HomeBusinessProcess : BusinessProcess

#pragma mark Public Method


#pragma mark Properties
@property (nonatomic, strong) NSMutableArray *homeItemTypes;
@property (nonatomic, assign) HomeItemType selectedItemType;

@end
