//
//  VDBusinessProcess.m
//  objcTemp
//
//  Created by Deng on 16/7/27.
//  Copyright © Deng. All rights reserved.
//

#import "VDBusinessProcess.h"
#import "VDMacros.h"
#import "NSObject+VDEnhance.h"
#import "VDWeakRef.h"
#import "NSObject+VDHook.h"
//#import "objcTemp.h"
//@import objcTemp;


@interface VDBusinessProcess ()

@property (nonatomic, assign, readwrite) BOOL isMain;

@property (nonatomic, strong, readwrite) NSMutableArray<__kindof UIViewController<VDBusinessProcessDelegate> *> *delegates;
@property (nonatomic, strong, readwrite) NSMutableArray<__kindof VDBusinessProcess *> *branchArray;

@end


@implementation VDBusinessProcess

#pragma mark Public Method
+ (instancetype)mainBusinessProcess {
    return [self vd_sharedInstance:^id{
        return [[self alloc] initWithMain:YES];
    }];
}

+ (instancetype)newBranchBusinessProcess {
    return [[self alloc] initWithMain:NO];
}

- (instancetype)initWithMain:(BOOL)isMain {
    self = [super init];
    
    _isMain = isMain;
    
    [self internalInitVDBusinessProcess];
    
    return self;
}

- (void)bindDelegate:(UIViewController<VDBusinessProcessDelegate> *)delegate {
    id weakRef = [VDWeakRef refWithObject:delegate];
    if (![self.delegates containsObject:weakRef]) {
        [self.delegates addObject:weakRef];
    }
    if (!self.isMain) {
        [[[self class] mainBusinessProcess] internalAddBranch:self];
    }
    
    VDWeakifySelf;
    __weak __typeof(&*delegate)vd_weak_delegate = delegate;
    [delegate vd_hookSelector:VDHookDeallocSelector beforeBlock:^(VDHookElement *element, VDHookInvocationInfo *info) {
        VDStrongifySelf;
        __strong __typeof(&*vd_weak_delegate)delegate = vd_weak_delegate;
        [self unbindDelegate:delegate];
    }];
}

- (void)unbindDelegate:(UIViewController<VDBusinessProcessDelegate> *)delegate {
    [self.delegates removeObject:delegate];
    
    NSMutableArray *releasedDeleages = [NSMutableArray new];
    for (VDWeakRef *delegate in self.delegates) {
        if (!delegate.weakObject) {
            [releasedDeleages addObject:delegate];
        }
    }
    [self.delegates removeObjectsInArray:releasedDeleages];
    
    
    if (self.delegates.count == 0) {
        [self internalOnBusinessProcessUnbindAllDelegates];
        if (!self.isMain) {
            [[[self class] mainBusinessProcess] internalRemoveBranch:self];
        }
    }
}

- (void)triggerAllDelegates {
    for (id delegate in [self.delegates copy]) {
        [self triggerDelegate:delegate];
    }
    
    if (self.isMain) {
        for (VDBusinessProcess *branch in [self.branchArray copy]) {
            [branch internalOnMainBusinessProcessChange:self];
        }
    }
    
    if (self.parentBusinessProcess) {
        [self.parentBusinessProcess internalOnChildBusinessProcessChange:self];
    }
}

- (void)triggerDelegate:(UIViewController<VDBusinessProcessDelegate> *)delegate {
    [self triggerDelegate:delegate cancelOnViewDisappeared:YES];
}

- (void)triggerDelegate:(UIViewController<VDBusinessProcessDelegate> *)delegate cancelOnViewDisappeared:(BOOL)cancelOnViewDisappeared {
    if (!cancelOnViewDisappeared
        || (cancelOnViewDisappeared
            && (delegate.isViewLoaded
                && delegate.view.window)))  {
        if ([delegate respondsToSelector:@selector(bp_onBusinessProcessChange:)]) {
            [delegate bp_onBusinessProcessChange:self];
        }
    }
}

- (void)triggerDelegateAfterViewWillAppear:(UIViewController<VDBusinessProcessDelegate> *)delegate {
    VDWeakifySelf;
    __weak __typeof(&*delegate)vd_weak_delegate = delegate;
    [delegate vd_hookSelector:@selector(viewWillAppear:) afterBlock:^(VDHookElement *element, VDHookInvocationInfo *info) {
        VDStrongifySelf;
        __strong __typeof(&*vd_weak_delegate)delegate = vd_weak_delegate;
        [self triggerDelegate:delegate cancelOnViewDisappeared:NO];
    }];
}

- (void)triggerDelegateAfterViewDidAppear:(UIViewController<VDBusinessProcessDelegate> *)delegate {
    VDWeakifySelf;
    __weak __typeof(&*delegate)vd_weak_delegate = delegate;
    [delegate vd_hookSelector:@selector(viewDidAppear:) afterBlock:^(VDHookElement *element, VDHookInvocationInfo *info) {
        VDStrongifySelf;
        __strong __typeof(&*vd_weak_delegate)delegate = vd_weak_delegate;
        [self triggerDelegate:delegate cancelOnViewDisappeared:NO];
    }];
}

#pragma mark Properties
- (NSMutableArray<__kindof UIViewController<VDBusinessProcessDelegate> *> *)delegates {
    if (!_delegates) {
        _delegates = [NSMutableArray new];
    }
    
    return _delegates;
}

- (NSMutableArray<__kindof VDBusinessProcess *> *)branchArray {
    if (!_branchArray) {
        _branchArray = [NSMutableArray new];
    }
    
    return _branchArray;
}

#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    [self internalInitVDBusinessProcess];
    
    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Private Method
- (void)internalInitVDBusinessProcess {
    
}

- (void)internalOnMainBusinessProcessChange:(VDBusinessProcess *)mainBusinessProcess {
    
}

- (void)internalOnChildBusinessProcessChange:(VDBusinessProcess *)childBusinessProcess {
    
}

- (void)internalOnBusinessProcessUnbindAllDelegates {
}

- (void)internalAddBranch:(VDBusinessProcess *)branch {
    if (!self.isMain) {
        return;
    }
    
    if (![self.branchArray containsObject:branch]) {
        [self.branchArray addObject:branch];
    }
}

- (void)internalRemoveBranch:(VDBusinessProcess *)branch {
    if (!self.isMain) {
        return;
    }
    
    [self.branchArray removeObject:branch];
}

@end
