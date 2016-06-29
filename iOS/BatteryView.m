//
//  BatteryView.m
//
//  Created by Antonio081014 on 1/19/15.
//  Copyright (c) 2015 Antonio081014.com. All rights reserved.
//

#import "BatteryView.h"
#import "BatteryCharginSignLayer.h"
#import "BatteryOutlineLayer.h"

@interface BatteryView()
@property (nonatomic, strong) BatteryOutlineLayer *batteryFillLayer;
@property (nonatomic, strong) BatteryCharginSignLayer *batteryChargingLayer;
@end

@implementation BatteryView

const CGFloat percentOfChargingSign = .2f;
//const CGFloat percentOfFrameHeight = .8f;
const CGFloat ratioOfWidthHeight4FillLayer = 1.f / 3.f;
const CGFloat ratioOfWidthHeight4ChargingLayer = 1.f / 1.f;

- (BatteryCharginSignLayer *)batteryChargingLayer
{
    if (!_batteryChargingLayer) {
        CGFloat height = CGRectGetHeight(self.frame);
        CGFloat width = height * ratioOfWidthHeight4ChargingLayer;
        CGFloat relativeCenterX = CGRectGetWidth(self.frame) * 19.f / 40.f;
        _batteryChargingLayer = [[BatteryCharginSignLayer alloc] initWithFrame:CGRectMake(relativeCenterX - width / 2.f, 0.f, width, height)];
    }
    return _batteryChargingLayer;
}

- (BatteryOutlineLayer *)batteryFillLayer
{
    if (!_batteryFillLayer) {
        CGFloat width = CGRectGetWidth(self.frame);
        CGFloat height = width * ratioOfWidthHeight4FillLayer;
        _batteryFillLayer = [[BatteryOutlineLayer alloc] initWithFrame:CGRectMake(0.f, 0.f, width, height)];
    }
    return _batteryFillLayer;
}

- (void)setBatteryLevel:(NSInteger)batteryLevel
{
    _batteryLevel = batteryLevel;
    
    self.batteryFillLayer.batteryLevel = batteryLevel;
    
    [self setNeedsDisplay];
}

- (void)setCharging:(BOOL)charging
{
    if (_charging != charging) {
        _charging = charging;
        
        if (charging) {
            [self.batteryFillLayer addSublayer:self.batteryChargingLayer];
        } else {
            [self.batteryChargingLayer removeFromSuperlayer];
        }
    }
    
    [self setNeedsDisplay];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.layer addSublayer:self.batteryFillLayer];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer addSublayer:self.batteryFillLayer];
        
        self.backgroundColor = [UIColor cyanColor];
    }
    return self;
}




@end
