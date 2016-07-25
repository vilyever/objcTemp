//
//  VDNotificationElement.h
//  objcTemp
//
//  Created by Deng on 16/7/25.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>


@class VDNotificationElement;


@interface VDNotificationElement : NSObject

#pragma mark Public Method
- (instancetype)initWithTarget:(id)target name:(NSString *)notificationName object:(id)object notificationBlock:(void(^)(VDNotificationElement *element, NSNotification *notification))notificationBlock;
- (void)dispose;

#pragma mark Properties
@property (nonatomic, weak) id target;
@property (nonatomic, copy) NSString *notificationName;
@property (nonatomic, weak) id object;
@property (nonatomic, strong) void(^notificationBlock)(VDNotificationElement *element, NSNotification *notification);

@property (nonatomic, assign, readonly) BOOL isDisposed;

#pragma mark Private Method
- (void)internalInitVDNotificationElement;


@end
