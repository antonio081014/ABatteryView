//
//  BatteryCharginSignLayer.m
//
//  Created by Antonio081014 on 1/20/15.
//  Copyright (c) 2015 Antonio081014.com. All rights reserved.
//

#import "BatteryCharginSignLayer.h"

@implementation BatteryCharginSignLayer

// Designate Initializer.
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        self.frame = frame;
        [self setup];
    }
    return self;
}

// Setup the layer with init values.
- (void)setup
{
    self.fillColor = [UIColor whiteColor].CGColor;
    [self updateLayer];
}

// Update layer with updating path of the layer by using UIBeierPath
- (void)updateLayer
{
    // Draw at the center of frame;
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    CGPoint center = CGPointMake(width / 2.f, height / 2.f);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(center.x +  width * .25f, center.y + height * -.5f)];
    [path addLineToPoint:CGPointMake(center.x + width * -.25f, center.y + 0.f)];
    [path addLineToPoint:CGPointMake(center.x + width * .25f, center.y + 0.f)];
    [path addLineToPoint:CGPointMake(center.x + width * -.25f, center.y + height * .5f)];
    [path closePath];

    self.path = path.CGPath;
    [self setNeedsDisplay];
}

@end
