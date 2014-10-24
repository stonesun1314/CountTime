//
//  CMSSTimerView.m
//  CountTime
//
//  Created by City-Online on 14/10/24.
//  Copyright (c) 2014年 City-Online. All rights reserved.
//

#import "CMSSTimerView.h"

@interface CMSSTimerView ()

@property (nonatomic, strong) UILabel *hoursLabel;
@property (nonatomic, strong) UILabel *minutesLabel;
@property (nonatomic, strong) UILabel *secondsLabel;

@end

@implementation CMSSTimerView

- (void)dealloc{
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}



@end
