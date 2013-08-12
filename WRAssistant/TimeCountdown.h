//
//  TimeCountdown.h
//  TimeCountdown
//
//  Created by Kevin Utecht on 7/8/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

@class TimeCountdown;

@protocol TimeCountdownDelegate
- (void)timeChanged:(TimeCountdown *)sender;
@end


typedef NS_ENUM(NSUInteger, TimeCountdownState)
{
    TimeCountdownNotStarted,
    TimeCountdownRunning,
    TimeCountdownPaused,
    TimeCountdownDone
};


@interface TimeCountdown : NSObject 

@property (weak, nonatomic) id <TimeCountdownDelegate> delegate;

- (id)initWithDurationInMinutes:(int)minutes;
- (void)run;
- (void)pause;
- (void)reset;
- (TimeCountdownState)state;

@end
