//
//  WRStepsTableViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 8/11/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "WRStepsTableViewController.h"

@interface WRStepsTableViewController () <UISplitViewControllerDelegate>
@property (strong, nonatomic) TimeCountdown *timeCountdown;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goButton;
@end

static NSString *const kGoButtonStoppedTitle = @"Go!";


@implementation WRStepsTableViewController

- (void)awakeFromNib
{
    self.splitViewController.delegate = self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.timeCountdown = [[TimeCountdown alloc]
                          initWithDurationInMinutes:[[NSUserDefaults standardUserDefaults] integerForKey:WRConstantsStepDurationInMinKey]];
    self.timeCountdown.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)timeChanged:(NSString *)time
{
    if ([time isEqualToString:TimeCountdownTimesUp])
    {
        self.goButton.title = kGoButtonStoppedTitle;
        [self.timeCountdown stop];
        [self.timeCountdown reset];
    }
    else
    {
        self.goButton.title = time;
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
