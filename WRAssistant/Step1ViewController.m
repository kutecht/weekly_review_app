//
//  Step1ViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/16/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "Step1ViewController.h"


@interface Step1ViewController ()
@property (strong, nonatomic) TimeCountdown *timeCountdown;
@property (weak, nonatomic) IBOutlet UILabel *timeCountdownLabel;
@end

@implementation Step1ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.timeCountdown = [[TimeCountdown alloc] init];
    self.timeCountdown.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([self.timeCountdown isStopped])
    {
        self.timeCountdown.minutes = [[NSUserDefaults standardUserDefaults] integerForKey:WRConstantsStepDurationInMinKey];
        self.timeCountdownLabel.text = self.timeCountdown.time;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneWithInfo:(UIStoryboardSegue *)segue
{
}


- (void)timeChanged:(NSString *)time
{
    self.timeCountdownLabel.text = time;
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
