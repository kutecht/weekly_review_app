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
@property (weak, nonatomic) IBOutlet UILabel *timeCountdownLabel;
@property (weak, nonatomic) IBOutlet UIButton *goButton;
@end



@implementation WRStepViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.timeCountdown = [[TimeCountdown alloc]
                          initWithDurationInMinutes:[[NSUserDefaults standardUserDefaults] integerForKey:WRConstantsStepDurationInMinKey]];
    self.timeCountdownLabel.text = [self.timeCountdown description];
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
    self.timeCountdownLabel.text = time;
    if ([time isEqualToString:TimeCountdownTimesUp])
    {
        self.goButton.enabled = NO;
    }
}

- (IBAction)toggleTimeCountdown:(UIButton *)sender
{
    if (!sender.selected)
    {
        [self.timeCountdown start];
    }
    else
    {
        [self.timeCountdown stop];
    }
    
    // toggle selected state
    sender.selected = !sender.selected;
}


@end
