//
//  AppRouterAutoPanUp.h
//  objcTempDemo
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import <objcTemp/objcTemp.h>


@class AppRouterAutoPanUp;


@interface AppRouterAutoPanUp : VDRouter

#pragma mark Public Method
+ (void)bindViewController:(Class)clazz;
+ (UIViewController *)open;

#pragma mark Properties


@end
