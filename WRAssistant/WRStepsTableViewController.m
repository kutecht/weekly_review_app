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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *timerButton;
@end


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
    self.timerButton.title = [self.timeCountdown description];
    self.timeCountdown.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionTop];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
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
