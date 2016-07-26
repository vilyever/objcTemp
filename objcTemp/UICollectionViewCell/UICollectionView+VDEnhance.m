//
//  UICollectionView+VDEnhance.m
//  objcTemp
//
//  Created by Deng on 16/7/25.
//  Copyright © Deng. All rights reserved.
//

#import "UICollectionView+VDEnhance.h"
#import "NSObject+VDKVO.h"
#import "VDMacros.h"

#import <objc/runtime.h>
//#import "objcTemp.h"
//@import objcTemp;


@implementation UICollectionView (VDEnhance)

#pragma mark Public Method
- (void)vd_enableAutoRelayoutOnFrameChange {
    if ([self vd_autoRelayoutKVOElement]
        && ![self vd_autoRelayoutKVOElement].isDisposed) {
        return;
    }
    
    VDWeakifySelf;
    VDKVOElement *element = [self vd_kvoWithTarget:self keyPath:VDKeyPath(self, bounds) action:^(VDKVOElement *element, NSDictionary *change) {
        VDStrongifySelf;
        CGRect oldBounds = [[change objectForKey:NSKeyValueChangeOldKey] CGRectValue];
        CGRect newBounds = [[change objectForKey:NSKeyValueChangeNewKey] CGRectValue];
        if (!CGSizeEqualToSize(oldBounds.size, newBounds.size)) {
            [self performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
        }
    }];
    
    [self setVd_autoRelayoutKVOElement:element];
}

- (void)vd_disableAutoRelayoutOnFrameChange {
    [[self vd_autoRelayoutKVOElement] dispose];
    [self setVd_autoRelayoutKVOElement:nil];
}

#pragma mark Properties
- (void)setVd_autoRelayoutKVOElement:(VDKVOElement *)vd_autoRelayoutKVOElement {
    objc_setAssociatedObject(self, @selector(vd_autoRelayoutKVOElement), vd_autoRelayoutKVOElement, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (VDKVOElement *)vd_autoRelayoutKVOElement {
    return objc_getAssociatedObject(self, @selector(vd_autoRelayoutKVOElement));
}

#pragma mark Private Method


@end
