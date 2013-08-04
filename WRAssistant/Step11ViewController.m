//
//  Step11ViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/16/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "Step11ViewController.h"
#import "ThoughtGuideTableViewController.h"
#import "AddThoughtGuideViewController.h"

@interface Step11ViewController ()
@property (strong, nonatomic) TimeCountdown *timeCountdown;
@property (weak, nonatomic) IBOutlet UILabel *timeCountdownLabel;
@property (strong, nonatomic) ThoughtGuideTableViewController *thoughtGuideTVC;
@end

static NSString *const kSegueShowThoughtGuideTable = @"showThoughtGuideTable";

@implementation Step11ViewController


- (void)logDateTime
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *log = [[defaults objectForKey:WRConstantsLogKey] mutableCopy];
    if (!log) log = [NSMutableArray array];
    [log addObject:[NSDate date]];
    [defaults setObject:log forKey:WRConstantsLogKey];
    [defaults synchronize];
}

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
    
    [self logDateTime];;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:kSegueShowThoughtGuideTable])
    {
        if ([segue.destinationViewController isKindOfClass:[ThoughtGuideTableViewController class]])
        {
            self.thoughtGuideTVC = segue.destinationViewController;
        }
    }
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

- (IBAction)doneAddingThoughtGuide:(UIStoryboardSegue *)segue
{
    if ([[segue sourceViewController] isKindOfClass:[AddThoughtGuideViewController class]])
    {
        AddThoughtGuideViewController *addGuideViewController = (AddThoughtGuideViewController *)[segue sourceViewController];
        [self.thoughtGuideTVC addThoughtGuide:addGuideViewController.thoughtGuideTextField.text];
    }
}

- (IBAction)cancelAddingThoughtGuide:(UIStoryboardSegue *)segue
{
}
@end
