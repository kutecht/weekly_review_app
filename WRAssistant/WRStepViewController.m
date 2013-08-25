//
//  WRStepViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/16/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "WRStepViewController.h"


@interface WRStepViewController ()
@property (strong, nonatomic) TimeCountdown *timeCountdown;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *timerButton;
@end


@implementation WRStepViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.timeCountdown = [[TimeCountdown alloc]
                          initWithDurationInMinutes:[[NSUserDefaults standardUserDefaults] integerForKey:WRConstantsStepDurationInMinKey]];
    self.timerButton.title = [self.timeCountdown description];
    self.timeCountdown.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.timeCountdown run];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.timeCountdown reset];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)timeChanged:(TimeCountdown *)sender
{
    self.timerButton.title = [sender description];
}

- (IBAction)toggleTimer:(UIBarButtonItem *)sender
{
    switch ([self.timeCountdown state])
    {
        case TimeCountdownNotStarted:
        case TimeCountdownPaused:
            [self.timeCountdown run];
            break;
        case TimeCountdownRunning:
            [self.timeCountdown pause];
            break;
        case TimeCountdownDone:
            // do nothing
            break;
    }
}


@end
