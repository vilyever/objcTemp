//
//  AppRouterHome.h
//  objcTempDemo
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import <objcTemp/objcTemp.h>


@class AppRouterHome;


@interface AppRouterHome : VDRouter

#pragma mark Public Method
+ (void)bindViewController:(Class)clazz;
+ (void)asRoot;
+ (UIViewController *)open;

#pragma mark Properties

#pragma mark Private Method
+ (UIViewController *)internalOpen;

@end
