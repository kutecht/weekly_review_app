//
//  TimeCountdown.m
//  TimeCountdown
//
//  Created by Kevin Utecht on 7/8/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "TimeCountdown.h"

@interface TimeCountdown ()
@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic) int seconds;
@property (nonatomic) int minutes;
@end

NSString *const TimeCountdownTimesUp = @"0:00";
static const int kDefaultDurationInMinutes = 5;


@implementation TimeCountdown

// Designated initializer
- (id)initWithDurationInMinutes:(int)minutes
{
    if ((self = [super init]))
    {
        self.minutes = minutes;
        self.seconds = 0;
    }
    return self;
}

// Superclass's designated initializer
- (id)init
{
    return [self initWithDurationInMinutes:kDefaultDurationInMinutes];
}


-(void)timerFired
{
    if ((self.minutes > 0 || self.seconds >= 0) && self.minutes >= 0)
    {
        if (self.seconds == 0)
        {
            self.minutes -= 1;
            self.seconds = 59;
        }
        else if (self.seconds > 0)
        {
            self.seconds -=1 ;
        }
        
        if (self.minutes >- 1)
        {
            [self.delegate timeChanged:[self description]];
        }
    }
    else
    {
        [self.timer invalidate];
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%d:%02d", self.minutes, self.seconds];
}

- (void)start
{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

- (void)stop
{
    [self.timer invalidate];
}

- (BOOL)isStopped
{
    if (self.timer)
    {
        return NO;
    }
    
    return YES;
}

@end
