//
//  VDWeakRef.m
//  objcTempUtilities
//
//  Created by Deng on 16/6/28.
//  Copyright © Deng. All rights reserved.
//

#import "VDWeakRef.h"


@interface VDWeakRef ()

@property (nonatomic, weak, readwrite) id object;

@end


@implementation VDWeakRef

#pragma mark Public Method
+ (instancetype)refWithObject:(id)object {
    VDWeakRef *ref = [self alloc];
    ref.object = object;
    return ref;
}

#pragma mark Properties


#pragma mark Overrides
- (void)forwardInvocation:(NSInvocation *)invocation {
    if (self.object) {
        invocation.target = self.object;
        [invocation invoke];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if (self.object) {
        return [self.object methodSignatureForSelector:sel];
    }
    else {
        return [NSObject methodSignatureForSelector:sel];;
    }
}

- (NSString *)description {
    if (self.object) {
        return [self.object description];
    }
    else {
        return [super description];
    }
}

- (BOOL)isEqual:(id)object {
    if (self.object) {
        return [object isEqual:self.object];
    }
    else {
        return NO;
    }
}


#pragma mark Delegates


#pragma mark Private Method

@end
