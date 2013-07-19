//
//  Step6ViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/16/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "Step6ViewController.h"

@interface Step6ViewController ()
@property (strong, nonatomic) TimeCountdown *timeCountdown;
@property (weak, nonatomic) IBOutlet UILabel *timeCountdownLabel;
@end

@implementation Step6ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.timeCountdown = [[TimeCountdown alloc] init];
    self.timeCountdown.delegate = self;
    self.timeCountdown.minutes = [[NSUserDefaults standardUserDefaults] integerForKey:@"step_duration"];
    self.timeCountdownLabel.text = self.timeCountdown.time;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
