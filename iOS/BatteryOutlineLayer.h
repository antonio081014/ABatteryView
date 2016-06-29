//
//  BatteryOutlineLayer.h
//
//  Created by Antonio081014 on 1/20/15.
//  Copyright (c) 2015 Antonio081014.com. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface BatteryOutlineLayer : CAShapeLayer

// 0 - 100 in %.
@property (nonatomic) NSInteger batteryLevel;

// Designate Initializer.
- (instancetype)initWithFrame:(CGRect)frame;
@end
