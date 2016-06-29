//
//  BatteryView.h
//
//  Created by Antonio081014 on 1/19/15.
//  Copyright (c) 2015 Antonio081014.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BatteryView : UIView
// Indicate the the current level of the battery.
@property (nonatomic) NSInteger batteryLevel;
// Indicate the charging status of the battery.
@property (nonatomic, getter=isCharging) BOOL charging;

// Designate Initializer.
- (instancetype)initWithFrame:(CGRect)frame;
@end
