//
//  ViewController.m
//  CountTime
//
//  Created by City-Online on 14/10/24.
//  Copyright (c) 2014年 City-Online. All rights reserved.
//

#import "ViewController.h"
#import "MZTimerLabel.h"
#import "CMSSTimerView.h"

@interface ViewController ()<MZTimerLabelDelegate>{
    MZTimerLabel *timerExample9;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"倒计时"]];
    
    UILabel *_lblTimerExample9 = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 91, 15)];
    _lblTimerExample9.font = [UIFont systemFontOfSize:13];
    _lblTimerExample9.textColor = [UIColor grayColor];
    [_lblTimerExample9 setBackgroundColor:color];
    [self.view addSubview:_lblTimerExample9];
    

    /*******************************************
     * ------Example 9-----
     * Use delegate to determine what text to be shown in corresponding time
     * This one display days as addtional hours, see implementation at line number 218
     ********************************************/
    
    timerExample9 = [[MZTimerLabel alloc] initWithLabel:_lblTimerExample9 andTimerType:MZTimerLabelTypeTimer];
    [timerExample9 setCountDownTime:3600*24*2];
    timerExample9.delegate = self;
    [timerExample9 start];
    
    CMSSTimerView *timerView = [[CMSSTimerView alloc] initWithFrame:CGRectMake(100, 200, 150, 30)];
    [self.view addSubview:timerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)timerLabel:(MZTimerLabel*)timerLabel customTextToDisplayAtTime:(NSTimeInterval)time{
    if([timerLabel isEqual:timerExample9]){
        int second = (int)time  % 60;
        int minute = ((int)time / 60) % 60;
        int hours = time / 3600;
        return [NSString stringWithFormat:@"%02d : %02d : %02d",hours,minute,second];
    }
    else
        return nil;
}

@end
