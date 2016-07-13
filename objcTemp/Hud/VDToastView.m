//
//  VDToastView.m
//  objcTemp
//
//  Created by Deng on 16/7/13.
//  Copyright © Deng. All rights reserved.
//

#import "VDToastView.h"
//#import "objcTemp.h"
//@import objcTemp;


@interface VDToastView ()

@end


@implementation VDToastView

#pragma mark Public Method

#pragma mark Properties


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    [self internalInitVDToastView];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self internalInitVDToastView];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    [self internalInitVDToastView];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)dealloc {
    
}


#pragma mark IBActions


#pragma mark Delegates


#pragma mark Private Method
- (void)internalInitVDToastView {
    
}

@end
