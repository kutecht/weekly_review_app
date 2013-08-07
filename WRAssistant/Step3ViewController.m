//
//  Step3ViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/16/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "Step3ViewController.h"
#import "TriggerListTableViewController.h"
#import "AddTriggerViewController.h"

@interface Step3ViewController ()
@property (strong, nonatomic) TimeCountdown *timeCountdown;
@property (weak, nonatomic) IBOutlet UILabel *timeCountdownLabel;
@property (strong, nonatomic) TriggerListTableViewController *triggerTVC;
@end


static NSString *const kSegueShowTriggerList = @"showTriggerList";
static NSString *const kSegueShowAddTrigger = @"showAddTrigger";


@implementation Step3ViewController

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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:kSegueShowTriggerList])
    {
        if ([segue.destinationViewController isKindOfClass:[TriggerListTableViewController class]])
        {
            self.triggerTVC = segue.destinationViewController;
        }
    }
    if ([segue.identifier isEqualToString:kSegueShowAddTrigger])
    {
        if ([segue.destinationViewController isKindOfClass:[AddTriggerViewController class]])
        {
            AddTriggerViewController *addTriggerController = (AddTriggerViewController *)[segue destinationViewController];
            addTriggerController.triggerGroups = self.triggerTVC.triggerGroups;
        }
    }
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



- (IBAction)doneAddingTrigger:(UIStoryboardSegue *)segue
{
    if ([[segue sourceViewController] isKindOfClass:[AddTriggerViewController class]])
    {
        AddTriggerViewController *addTriggerController = (AddTriggerViewController *)[segue sourceViewController];
        [self.triggerTVC addTrigger:@{WRConstantsTriggerKey:addTriggerController.trigger,
                                      WRConstantsTriggerGroupKey:addTriggerController.section}];
    }
    
}

- (IBAction)cancelAddingTrigger:(UIStoryboardSegue *)segue
{
}

@end
