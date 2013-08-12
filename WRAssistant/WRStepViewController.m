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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goButton;
@end

static NSString *const kGoButtonStoppedTitle = @"Go!";


@implementation WRStepViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.timeCountdown = [[TimeCountdown alloc]
                          initWithDurationInMinutes:[[NSUserDefaults standardUserDefaults] integerForKey:WRConstantsStepDurationInMinKey]];
    self.timeCountdown.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)timeChanged:(NSString *)time
{
    self.goButton.title = time;
    if ([time isEqualToString:TimeCountdownTimesUp])
    {
        self.goButton.enabled = NO;
    }
}

- (IBAction)toggleTimer:(UIBarButtonItem *)sender
{
    if ([sender.title isEqualToString:kGoButtonStoppedTitle])
    {
        [self.timeCountdown start];
    }
    else
    {
        [self.timeCountdown stop];
        self.goButton.title =  kGoButtonStoppedTitle;
    }
}


@end
