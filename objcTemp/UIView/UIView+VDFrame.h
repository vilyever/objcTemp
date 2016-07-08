//
//  UIView+VDFrame.h
//  objcTempUtilities
//
//  Created by Deng on 16/6/15.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (VDFrame)

#pragma mark Public Method
@property (nonatomic, assign) CGPoint vd_frameOrigin;
@property (nonatomic, assign) CGSize vd_frameSize;
@property (nonatomic, assign) float vd_frameX;
@property (nonatomic, assign) float vd_frameY;
@property (nonatomic, assign) float vd_frameWidth;
@property (nonatomic, assign) float vd_frameHeight;

@end
