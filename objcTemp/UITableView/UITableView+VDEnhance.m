//
//  UITableView+VDEnhance.m
//  objcTemp
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import "UITableView+VDEnhance.h"

//#import <objc/runtime.h>
//#import "objcTemp.h"


@implementation UITableView (VDEnhance)

#pragma mark Public Method
- (void)vd_setDelaysContentTouches:(BOOL)delay {
    self.delaysContentTouches = delay;
    for (id view in [self.subviews copy]) {
        if ([view respondsToSelector:@selector(setDelaysContentTouches:)]) {
            [view setDelaysContentTouches:delay];
        }
    }
}

#pragma mark Private Method


@end
