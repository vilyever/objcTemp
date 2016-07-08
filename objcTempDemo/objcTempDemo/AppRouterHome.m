//
//  AppRouterHome.m
//  objcTempDemo
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "AppRouterHome.h"
//#import "objcTemp.h"
//@import objcTemp;


@interface AppRouterHome ()


@end


@implementation AppRouterHome

#pragma mark Public Method
+ (void)bindViewController:(Class)clazz {
    [VDRouter bindViewController:clazz identifier:[self vd_className]];
}

+ (void)asRoot {
    [VDRouter setRootViewControllerIdentifier:[self vd_className]];
}

+ (UIViewController *)open {
    return [self internalOpen];
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
+ (UIViewController *)internalOpen {
    UIViewController *controller = [VDRouter push:[self vd_className] withPrepareBlock:^(UIViewController *controller) {
        //        [controller vd_setRouterParamsObject:@(action) forKey:AppRouterHomeActionKey];
    }];
    
    return controller;
}

@end
