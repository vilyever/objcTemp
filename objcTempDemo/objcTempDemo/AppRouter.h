//
//  AppRouter.h
//  objcTempDemo
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "objcTemp.h"
@import objcTemp;

@class AppRouter;


@interface AppRouter : NSObject

#pragma mark Public Method
+ (void)bindViewController:(Class)clazz;
+ (void)asRoot;
+ (UIViewController *)open;

#pragma mark Properties


@end
