//
//  BatteryOutlineLayer.m
//
//  Created by Antonio081014 on 1/20/15.
//  Copyright (c) 2015 Antonio081014.com. All rights reserved.
//

#import "BatteryOutlineLayer.h"
@import UIKit;

const CGFloat kBatteryBodyInPercent = .95;

@interface BatteryOutlineLayer()
@property (nonatomic, strong) CAShapeLayer *batteryLevelDisplayLayer;
@property (nonatomic, strong) CAShapeLayer *batteryBodyLayer;
@property (nonatomic, strong) CAShapeLayer *batteryHeadLayer;

@end

@implementation BatteryOutlineLayer
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.batteryHeadLayer = [CAShapeLayer layer];
        self.batteryBodyLayer = [CAShapeLayer layer];
        self.batteryLevelDisplayLayer = [CAShapeLayer layer];
//        self.batteryLevelDisplayLayer.mask = self.batteryBodyLayer;
        [self addSublayer:self.batteryHeadLayer];
        [self addSublayer:self.batteryBodyLayer];
        [self addSublayer:self.batteryLevelDisplayLayer];
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.batteryLevel = 0;
    [self updateLayer];
}

- (void)updateLayer
{
    [self updateHeadLayer];
    [self updateBodyLayer];
    
    [self setNeedsDisplay];
}

- (void)updateBodyLayer
{
    CGFloat width1 = CGRectGetWidth(self.frame) * kBatteryBodyInPercent;
    CGFloat height1 = CGRectGetHeight(self.frame);
    CGFloat x1 = 0.f;
    CGFloat y1 = 0.f;
    self.batteryBodyLayer.frame = CGRectMake(x1, y1, width1, height1);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(x1, y1, width1, height1) cornerRadius:MIN(width1, height1) / 10.f];
    self.batteryBodyLayer.path = path.CGPath;
    
    self.batteryBodyLayer.fillColor = [UIColor clearColor].CGColor;
    self.batteryBodyLayer.strokeColor = [UIColor whiteColor].CGColor;
}

- (void)updateHeadLayer
{
    CGFloat width1 = CGRectGetWidth(self.frame) * kBatteryBodyInPercent;
    CGFloat width2 = CGRectGetWidth(self.frame) * (1.f - kBatteryBodyInPercent);
    CGFloat height2 = CGRectGetHeight(self.frame) / 3.f;
    CGFloat x2 = width1;
    CGFloat y2 = CGRectGetHeight(self.frame) / 3.f;
    self.batteryHeadLayer.frame = CGRectMake(x2, y2, width2, height2);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0.f, 0.f, width2, height2)];
    self.batteryHeadLayer.path = path.CGPath;
    
    self.batteryHeadLayer.fillColor = [UIColor whiteColor].CGColor;
    self.batteryHeadLayer.strokeColor = [UIColor grayColor].CGColor;
}

const CGFloat kBatteryBodyFillInsetX = .01f;
const CGFloat kBatteryBodyFillInsetY = .01f;

- (void)setBatteryLevel:(NSInteger)batteryLevel
{
    if (batteryLevel < 0 || batteryLevel > 100) return;
    
    _batteryLevel = batteryLevel;
    
    CGFloat width = CGRectGetWidth(self.frame) * kBatteryBodyInPercent * batteryLevel / 100.f;
    CGFloat height = CGRectGetHeight(self.frame);
    self.batteryLevelDisplayLayer.frame = self.batteryBodyLayer.frame;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(CGRectGetWidth(self.frame) * kBatteryBodyFillInsetX, CGRectGetHeight(self.frame) * kBatteryBodyFillInsetY, width * (1.f - 2.f * kBatteryBodyFillInsetX), height * (1.f - 2.f * kBatteryBodyFillInsetY)) cornerRadius:MIN(width, height) / 8.f];
    
    self.batteryLevelDisplayLayer.path = path.CGPath;
    
    UIColor *fillColor = [UIColor clearColor];
    if (batteryLevel >= 85) {
        fillColor = [UIColor greenColor];
    } else if (batteryLevel >= 25) {
        fillColor = [UIColor orangeColor];
    } else {
        fillColor = [UIColor redColor];
    }
    
    self.batteryLevelDisplayLayer.fillColor = fillColor.CGColor;
    self.batteryLevelDisplayLayer.strokeColor = [UIColor clearColor].CGColor;
    
    [self setNeedsDisplay];
}

@end
