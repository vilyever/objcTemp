//
//  VDBusinessProcess.h
//  objcTemp
//
//  Created by Deng on 16/7/27.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class VDBusinessProcess;

@protocol VDBusinessProcessDelegate <NSObject>
@optional
- (void)bp_onBusinessProcessChange:(VDBusinessProcess *)businessProcess;
@end

@interface VDBusinessProcess : NSObject

#pragma mark Public Method
+ (instancetype)mainBusinessProcess;
+ (instancetype)newBranchBusinessProcess;

- (instancetype)initWithMain:(BOOL)isMain;

- (void)bindDelegate:(UIViewController<VDBusinessProcessDelegate> *)delegate;
- (void)unbindDelegate:(UIViewController<VDBusinessProcessDelegate> *)delegate;

- (void)triggerAllDelegates;
- (void)triggerDelegate:(UIViewController<VDBusinessProcessDelegate> *)delegate;
- (void)triggerDelegate:(UIViewController<VDBusinessProcessDelegate> *)delegate cancelOnViewDisappeared:(BOOL)cancelOnViewDisappeared;
- (void)triggerDelegateAfterViewWillAppear:(UIViewController<VDBusinessProcessDelegate> *)delegate;
- (void)triggerDelegateAfterViewDidAppear:(UIViewController<VDBusinessProcessDelegate> *)delegate;

#pragma mark Properties
@property (nonatomic, assign, readonly) BOOL isMain;
@property (nonatomic, weak) VDBusinessProcess *parentBusinessProcess;


#pragma mark Private Method
- (void)internalInitVDBusinessProcess;

- (void)internalOnMainBusinessProcessChange:(VDBusinessProcess *)mainBusinessProcess;
- (void)internalOnChildBusinessProcessChange:(VDBusinessProcess *)childBusinessProcess;
- (void)internalOnBusinessProcessUnbindAllDelegates;

@end
