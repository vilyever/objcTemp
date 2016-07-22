//
//  LoadingHudViewController.h
//  FTETAssistantForiOS
//
//  Created by Deng on 16/7/13.
//  Copyright © Deng. All rights reserved.
//

#import <objcTemp/objcTemp.h>
@import objcTemp;


@class LoadingHudViewController;

@interface LoadingHudViewController : VDSimpleHudViewController

#pragma mark Public Method


#pragma mark Properties
@property (nonatomic, strong, readonly) VDLoadingAngularVariationView *loadingView;

#pragma mark Private Method
- (void)internalInitLoadingHudViewController;

@end
