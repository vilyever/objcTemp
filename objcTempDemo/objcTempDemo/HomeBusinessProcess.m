//
//  HomeBusinessProcess.m
//  objcTempDemo
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "HomeBusinessProcess.h"
#import "AppRouterAutoPanUp.h"
#import "AppRouterHud.h"
#import "AppRouterLoadingView.h"
#import "AppRouterPullToRefresh.h"
//#import "objcTemp.h"


@interface HomeBusinessProcess ()


@end


@implementation HomeBusinessProcess

#pragma mark Public Method
+ (NSMutableArray *)obtainHomeItemTypes {
    return [HomeBusinessProcess vd_sharedInstance].homeItemTypes;
}

+ (void)modifySelectedItemType:(HomeItemType)itemType {
    [HomeBusinessProcess vd_sharedInstance].selectedItemType = itemType;
}

+ (HomeItemType)obtainSelectedItemType {
    return [HomeBusinessProcess vd_sharedInstance].selectedItemType;
}

#pragma mark Properties
- (NSMutableArray *)homeItemTypes {
    if (!_homeItemTypes) {
        _homeItemTypes = [NSMutableArray arrayWithArray:@[
                                                          @(HomeItemTypeAutoPanUp),
                                                          @(HomeItemTypeHud),
                                                          @(HomeItemTypeLoadingView),
                                                          @(HomeItemTypePullToRefresh),
                                                          ]];
    }
    
    return _homeItemTypes;
}

- (void)setSelectedItemType:(HomeItemType)selectedItemType {
    if (_selectedItemType != selectedItemType) {
        _selectedItemType = selectedItemType;
        
        switch (selectedItemType) {
            case HomeItemTypeAutoPanUp: {
                // TODO: check current controller is on top, is new controller is opening, avoid to do this, for quick touch the same button or sth.
                [AppRouterAutoPanUp open];
                break;
            }
            case HomeItemTypeHud: {
                [AppRouterHud open];
                break;
            }
            case HomeItemTypeLoadingView: {
                [AppRouterLoadingView open];
                break;
            }
            case HomeItemTypePullToRefresh: {
                [AppRouterPullToRefresh open];
                break;
            }
            default:
                break;
        }
        
        for (id delegate in [self.delegates copy]) {
            if ([delegate respondsToSelector:@selector(onSelectedHomeItemTypeChange:)]) {
                [delegate onSelectedHomeItemTypeChange:_selectedItemType];
            }
        }
    }
}

+ (void)triggerDelegate:(id)delegate {
    if ([delegate respondsToSelector:@selector(onSelectedHomeItemTypeChange:)]) {
        [delegate onSelectedHomeItemTypeChange:[self obtainSelectedItemType]];
    }
}

#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Private Method

@end
