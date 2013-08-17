//
//  TimeCountdown.m
//  TimeCountdown
//
//  Created by Kevin Utecht on 7/8/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#include <AudioToolbox/AudioToolbox.h>
#import "TimeCountdown.h"

@interface TimeCountdown ()
@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic) int seconds;
@property (nonatomic) int minutes;
@property (nonatomic) int initialDurationInMinutes;
@property (nonatomic) TimeCountdownState currentState;
@property (nonatomic) CFURLRef beepFinishedURLRef;
@property (nonatomic)  SystemSoundID beepFinishedObject;
@property (nonatomic) CFURLRef beep1MinLeftURLRef;
@property (nonatomic)  SystemSoundID beep1MinLeftObject;
@end

static const int kDefaultDurationInMinutes = 5;


@implementation TimeCountdown

// Designated initializer
- (id)initWithDurationInMinutes:(int)minutes
{
    if ((self = [super init]))
    {
        self.currentState = TimeCountdownNotStarted;
        self.initialDurationInMinutes = minutes;
        self.minutes = minutes;
        self.seconds = 0;
        
        NSURL *beepFinishedSound   = [[NSBundle mainBundle] URLForResource: @"BeepFinished"
                                                             withExtension: @"aif"];
        self.beepFinishedURLRef = (__bridge CFURLRef) beepFinishedSound;
        
        AudioServicesCreateSystemSoundID (_beepFinishedURLRef, &_beepFinishedObject);
        
        NSURL *beep1MinLeftSound   = [[NSBundle mainBundle] URLForResource: @"Beep1MinLeft"
                                                             withExtension: @"aif"];
        self.beep1MinLeftURLRef = (__bridge CFURLRef) beep1MinLeftSound;
        
        AudioServicesCreateSystemSoundID (_beep1MinLeftURLRef, &_beep1MinLeftObject);
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
    if (self.minutes == 0 && self.seconds == 0)
    {
        [self.timer invalidate];
        
        // play 2 beeps when times-up
        AudioServicesPlaySystemSound(self.beepFinishedObject);
        self.currentState = TimeCountdownDone;
    }
    else
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
        
        // 1 beep when 1 minute to go
        if (self.minutes == 1 && self.seconds == 0)
        {
            AudioServicesPlaySystemSound(self.beep1MinLeftObject);
        }
    }
        
    [self.delegate timeChanged:self];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%d:%02d", self.minutes, self.seconds];
}

- (void)reset
{
    [self.timer invalidate];
    self.currentState = TimeCountdownNotStarted;
    self.minutes = self.initialDurationInMinutes;
    self.seconds = 0;
    [self.delegate timeChanged:self];
}

- (void)run
{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    self.currentState = TimeCountdownRunning;
}

- (void)pause
{
    [self.timer invalidate];
    self.currentState = TimeCountdownPaused;
    [self.delegate timeChanged:self];
}

- (TimeCountdownState)state
{
    return self.currentState;
}

@end
