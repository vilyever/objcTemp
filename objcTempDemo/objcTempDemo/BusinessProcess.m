//
//  BusinessProcess.m
//  FTETAssistantForiOS
//
//  Created by Deng on 16/7/6.
//  Copyright © Deng. All rights reserved.
//

#import "BusinessProcess.h"
@import objcTemp;


@interface BusinessProcess ()



@end


@implementation BusinessProcess

#pragma mark Public Method
- (void)registerDelegate:(id<BusinessProcessDelegate>)delegate {
    if (![self.delegates containsObject:delegate]) {
        [self.delegates addObject:delegate];
    }
}

- (void)registerWeakDelegate:(id<BusinessProcessDelegate>)delegate {
    if (![self.delegates containsObject:delegate]) {
        [self.delegates addObject:[VDWeakRef refWithObject:delegate]];
    }
}

- (void)removeDelegate:(id<BusinessProcessDelegate>)delegate {
    [self.delegates removeObject:delegate];
}

#pragma mark Properties
- (NSMutableArray *)delegates {
    if (!_delegates) {
        _delegates = [NSMutableArray new];
    }
    
    return _delegates;
}

#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Private Method

@end
