//
//  CMSSCountTimer.m
//  CountTime
//
//  Created by City-Online on 14/10/24.
//  Copyright (c) 2014年 City-Online. All rights reserved.
//

#import "CMSSCountTimer.h"


@interface CMSSCountTimer (){
    dispatch_source_t _timer;
    NSTimeInterval timeUserValue;
}

@property (nonatomic, strong) CMSSCountEndBlock endBlock;

@end


@implementation CMSSCountTimer

- (void)dealloc{
    dispatch_source_cancel(_timer);
    //[super dealloc];
}

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [self setup];
    }
    return self;
}


- (void)setup{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
}


#pragma mark ---Timer control methods to use

-(void)start{
    //__block int timeout=30; //倒计时时间
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeUserValue<=0){ //倒计时结束，关闭
            NSLog(@"_____cancel");
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
            });
        }else{
            //            int minutes = timeout / 60;
            int second = (int)timeUserValue  % 60;
            int minute = ((int)timeUserValue / 60) % 60;
            int hours = timeUserValue / 3600;
            //return [NSString stringWithFormat:@"%02dh %02dm %02ds",hours,minute,second];
            NSString *strTime = [NSString stringWithFormat:@"%02dh %02dm %02ds",hours,minute,second];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"____%@",strTime);
                
            });
            timeUserValue--;
            
        }
    });
    dispatch_resume(_timer);

}
#if NS_BLOCKS_AVAILABLE
-(void)startWithEndingBlock:(CMSSCountEndBlock)endBlock{
    [self start];
    self.endBlock = endBlock;
}
#endif
-(void)pause{
    dispatch_suspend(_timer);
}
-(void)reset{
    dispatch_resume(_timer);
}

#pragma mark ---set method
-(void)setCountDownTime:(NSTimeInterval)time{
    timeUserValue = (time < 0)? 0 : time;
}

@end
