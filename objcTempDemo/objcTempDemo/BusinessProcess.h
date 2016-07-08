//
//  BusinessProcess.h
//  FTETAssistantForiOS
//
//  Created by Deng on 16/7/6.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BusinessProcess;

@protocol BusinessProcessDelegate <NSObject>
@end

@interface BusinessProcess : NSObject

#pragma mark Public Method
- (void)registerDelegate:(id<BusinessProcessDelegate>)delegate;
- (void)registerWeakDelegate:(id<BusinessProcessDelegate>)delegate;
- (void)removeDelegate:(id<BusinessProcessDelegate>)delegate;

#pragma mark Protected Method

#pragma mark Properties
@property (nonatomic, strong) NSMutableArray *delegates;
@property (nonatomic, weak) UIViewController *relationController;

@end
