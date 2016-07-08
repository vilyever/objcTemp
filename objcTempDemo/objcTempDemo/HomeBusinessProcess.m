//
//  HomeBusinessProcess.m
//  objcTempDemo
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "HomeBusinessProcess.h"
#import "AppRouterAutoPanUp.h"
//#import "objcTemp.h"


@interface HomeBusinessProcess ()


@end


@implementation HomeBusinessProcess

#pragma mark Public Method


#pragma mark Properties
- (NSMutableArray *)homeItemTypes {
    if (!_homeItemTypes) {
        _homeItemTypes = [NSMutableArray arrayWithArray:@[
                                                          @(HomeItemTypeAutoPanUp),
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
            default:
                break;
        }
        
        for (id delegate in self.delegates) {
            if ([delegate respondsToSelector:@selector(onHomeItemTypeChange:)]) {
                [delegate onHomeItemTypeChange:_selectedItemType];
            }
        }
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
