//
//  NSObject+VDPersistent.h
//  objcTemp
//
//  Created by Deng on 16/7/1.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol VDPersistentProtocol <NSObject>
@end

@interface NSObject (VDPersistent)

#pragma mark Public Method
- (void)vd_initPersistent;

@end
