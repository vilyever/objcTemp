//
//  AppRouter.m
//  objcTempDemo
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import "AppRouter.h"
//#import "objcTemp.h"
//@import objcTemp;


@interface AppRouter ()


@end


@implementation AppRouter

#pragma mark Public Method
+ (void)bindViewController:(Class)clazz {
    [VDRouter bindViewController:clazz identifier:[self vd_className]];
}

+ (void)asRoot {
    [VDRouter setRootViewControllerIdentifier:[self vd_className]];
}

+ (UIViewController *)open {
//    UIViewController *controller = [VDRouter push:[self vd_className] withPrepareBlock:^(UIViewController *controller) {
////        [controller vd_setRouterParamsObject:@(action) forKey:AppRouterHomeActionKey];
//    }];
    
    UIViewController *controller = [VDRouter push:[self vd_className]];
    
    return controller;
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
