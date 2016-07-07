//
//  UILabel+VDVerticalAlignment.h
//  objcTempUtilities
//
//  Created by Deng on 16/6/15.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UILabel (VDVerticalAlignment)

#pragma mark Public Method
- (void)vd_setVerticalAligmentToTop;
- (void)vd_setVerticalAligmentToCenter;
- (void)vd_setVerticalAligmentToBottom;

#pragma mark Private Method
- (CGRect)vd_verticalAlignmentTextRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines;
- (void)vd_verticalAlignmentDrawTextInRect:(CGRect)rect;

@end
