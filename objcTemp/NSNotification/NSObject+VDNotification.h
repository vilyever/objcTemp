//
//  NSObject+VDNotification.h
//  objcTemp
//
//  Created by Deng on 16/7/25.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDNotificationElement.h"


@interface NSObject (VDNotification)

#pragma mark Public Method
- (VDNotificationElement *)vd_notificationWithTarget:(id)target name:(NSString *)notificationName object:(id)object notificationBlock:(void(^)(VDNotificationElement *element, NSNotification *notification))notificationBlock;

#pragma mark Properties
- (NSMutableArray *)vd_notificationElementArray;

@end
