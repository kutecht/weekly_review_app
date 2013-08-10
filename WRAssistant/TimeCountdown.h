//
//  TimeCountdown.h
//  TimeCountdown
//
//  Created by Kevin Utecht on 7/8/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

@protocol TimeCountdownDelegate
- (void)timeChanged:(NSString *)time;
@end


@interface TimeCountdown : NSObject 

@property (weak, nonatomic) id <TimeCountdownDelegate> delegate;

- (id)initWithDurationInMinutes:(int)minutes;
- (void)start;
- (void)stop;
- (BOOL)isStopped;

@end
