//
//  CMSSCountTimer.h
//  CountTime
//
//  Created by City-Online on 14/10/24.
//  Copyright (c) 2014年 City-Online. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CMSSCountEndBlock)(NSTimeInterval time);

@protocol CMSSCountTimerDelegate <NSObject>

/*
@optional
-(void)finshedCountDownTimerWithTime:(NSTimeInterval)countTime;
-(void)countingTo:(NSTimeInterval)time;
-(NSString*)customTextToDisplayAtTime:(NSTimeInterval)time;
*/
@end

@interface CMSSCountTimer : NSObject


/*--------Timer control methods to use*/
-(void)start;
#if NS_BLOCKS_AVAILABLE
-(void)startWithEndingBlock:(CMSSCountEndBlock)endBlock; //use it if you are not going to use delegate
#endif
-(void)pause;
-(void)reset;

/*--------Setter methods*/
-(void)setCountDownTime:(NSTimeInterval)time;

@end
