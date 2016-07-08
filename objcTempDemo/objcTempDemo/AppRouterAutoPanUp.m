//
//  AppRouterAutoPanUp.m
//  objcTempDemo
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "AppRouterAutoPanUp.h"
//#import "objcTemp.h"
//@import objcTemp;


@interface AppRouterAutoPanUp ()

@end


@implementation AppRouterAutoPanUp

#pragma mark Public Method
+ (void)bindViewController:(Class)clazz {
    [VDRouter bindViewController:clazz identifier:[self vd_className]];
}

+ (UIViewController *)open {
    return [VDRouter push:[self vd_className]];
}

#pragma mark Properties


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
