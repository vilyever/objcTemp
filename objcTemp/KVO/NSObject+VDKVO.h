//
//  NSObject+VDKVO.h
//  objcTemp
//
//  Created by Deng on 16/7/25.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VDKVOElement.h"

@interface NSObject (VDKVO)

#pragma mark Public Method
- (VDKVOElement *)vd_kvoWithTarget:(id)target keyPath:(NSString *)keyPath action:(void(^)(VDKVOElement *element, NSDictionary *change))kvoBlock;

#pragma mark Properties
- (NSMutableArray *)vd_kvoElementArray;

@end
