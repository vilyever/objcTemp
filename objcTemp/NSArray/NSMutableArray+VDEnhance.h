//
//  NSMutableArray+VDEnhance.h
//  objcTemp
//
//  Created by Deng on 16/7/13.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableArray (VDEnhance)

#pragma mark Public Method
- (void)vd_queuePush:(id)obj;
- (id)vd_queuePop;
- (void)vd_stackPush:(id)obj;
- (id)vd_stackPop;

@end
