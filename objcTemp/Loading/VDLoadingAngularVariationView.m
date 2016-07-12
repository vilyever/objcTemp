//
//  VDLoadingAngularVariationView.m
//  objcTemp
//
//  Created by Deng on 16/7/12.
//  Copyright © Deng. All rights reserved.
//

#import "VDLoadingAngularVariationView.h"
#import "UIColor+VDEnhance.h"
//#import "objcTemp.h"
//@import objcTemp;


@interface VDLoadingAngularVariationView ()

@end


@implementation VDLoadingAngularVariationView

#pragma mark Public Method

#pragma mark Properties


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    return self;
}

- (void)dealloc {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _angularColor = [UIColor vd_colorWithHexValue:0x1E90FF];
    _radius = 35.0f;
    _torusWidth = 5.0f;
    _minAngular = 10;
    _maxAngular = 300;
    _leapAngular = 360 * 2 + 120;
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat widthHeight = (self.radius + self.torusWidth / 2.0f) * 2.0f;
    size.width = MIN(widthHeight, size.width);
    size.height = MIN(widthHeight, size.height);
    return size;
}


#pragma mark IBActions


#pragma mark Delegates
- (void)drawLayer:(VDLoadingLayer *)layer inContext:(CGContextRef)ctx {
    [super drawLayer:layer inContext:ctx];
    
    UIGraphicsPushContext(ctx);
    
    [self.angularColor set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = self.torusWidth;
    
    CGFloat centerX = self.bounds.size.width / 2.0f;
    CGFloat centerY = self.bounds.size.height / 2.0f;
    
    CGFloat radius = self.radius;
    radius = MIN(radius, self.bounds.size.width / 2.0f);
    radius = MIN(radius, self.bounds.size.height / 2.0f);
    
    radius -= self.torusWidth / 2.0f;
    
    CGFloat loopStartAngle = self.leapAngular * self.progressAnimationRepeatedTimes % 360;
    CGFloat forwardAngle = 0.0f;
    CGFloat sweepAngle = 0.0f;
    
    CGFloat slowProgress = 0.15f;
    CGFloat fastProgress = 1.0f - slowProgress * 2.0f;
    CGFloat slowLeapAngle = self.leapAngular * 0.1f;
    CGFloat collapseLeapAngle = self.leapAngular * 0.1f;
    CGFloat fastLeapAngle = self.leapAngular - slowLeapAngle - collapseLeapAngle;
    
    CGFloat minAngular = MIN(self.minAngular, self.leapAngular);
    CGFloat maxAngluar = MIN(self.maxAngular, fastLeapAngle);
    
    if (layer.animatingProgress < slowProgress) {
        CGFloat progress = layer.animatingProgress / slowProgress;
        
        forwardAngle = fmodf(loopStartAngle + slowLeapAngle * progress, 360.0f);
        if (self.progressAnimationRepeatedTimes == 0) {
            sweepAngle = fmodf(minAngular * progress, 360.0f);
        }
        else {
            sweepAngle = minAngular;
        }
    }
    else if (layer.animatingProgress < fastProgress) {
        CGFloat progress = (layer.animatingProgress - slowProgress) / (fastProgress - slowProgress);
        forwardAngle = fmodf(loopStartAngle + slowLeapAngle + fastLeapAngle * progress, 360.0f);
        sweepAngle = fmodf(minAngular + (maxAngluar - minAngular) * progress, 360.0f);
    }
    else {
        float progress = (layer.animatingProgress - fastProgress) / (1.0f - fastProgress);
        forwardAngle = fmodf(loopStartAngle + slowLeapAngle + fastLeapAngle + collapseLeapAngle * progress, 360.0f);
        sweepAngle = fmodf(maxAngluar - (maxAngluar - minAngular) * progress, 360.0f);
    }
    
    CGFloat startAngle = forwardAngle - sweepAngle;
    CGFloat endAngle = forwardAngle;
    
    startAngle = startAngle / 180.0f * M_PI;
    endAngle = endAngle / 180.0f * M_PI;
    
    [path addArcWithCenter:CGPointMake(centerX, centerY) radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    [path stroke];
    
    UIGraphicsPopContext();

}


#pragma mark Private Method

@end
