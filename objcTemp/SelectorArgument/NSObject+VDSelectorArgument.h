//
//  NSObject+VDSelectorArgument.h
//  objcTemp
//
//  Created by Deng on 16/7/6.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDSelectorArgument.h"



@interface NSObject (VDSelectorArgument)

#pragma mark Public Method
- (void)vd_performSelector:(SEL)selector withArguments:(NSArray *)arguments;
- (void)vd_performSelector:(SEL)selector withArguments:(NSArray *)arguments afterDelay:(NSTimeInterval)delay;

@end
