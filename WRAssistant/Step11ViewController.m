//
//  Step11ViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/16/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "Step11ViewController.h"
#import "Step1ViewController.h"
#import "ThoughtGuideTableViewController.h"
#import "AddThoughtGuideViewController.h"

@interface Step11ViewController ()
@property (strong, nonatomic) ThoughtGuideTableViewController *thoughtGuideTVC;
@end

static NSString *const kSegueShowThoughtGuideTable = @"showThoughtGuideList";
static NSString *const kSegueShowAddTrigger = @"showAddThoughtGuide";
static NSString *const kSegueShowStep1 = @"showStep1";
static NSString *const kStep1Title = @"1";


@implementation Step11ViewController



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
    
    UIBarButtonItem *step1BarButton = [[UIBarButtonItem alloc] initWithTitle:kStep1Title style:UIBarButtonItemStyleBordered target:self action:@selector(step1Pressed:)];
    
    UIBarButtonItem *addThoughtGuideBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addThoughtGuidePressed:)];
    
    self.navigationItem.rightBarButtonItems = @[step1BarButton, addThoughtGuideBarButton];
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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneAddingThoughtGuide:(UIStoryboardSegue *)segue
{
    if ([[segue sourceViewController] isKindOfClass:[AddThoughtGuideViewController class]])
    {
        AddThoughtGuideViewController *addGuideViewController = (AddThoughtGuideViewController *)[segue sourceViewController];
        [self.thoughtGuideTVC addThoughtGuide:addGuideViewController.thoughtGuide];
    }
}

// iPad only method
- (IBAction)weeklyReviewCompletedPressed:(UIBarButtonItem *)sender
{
    [WRConstants logDateTime];
    // TODO: Add an alert that time was logged -- popup
}

- (IBAction)cancelAddingThoughtGuide:(UIStoryboardSegue *)segue
{
}

- (IBAction)addThoughtGuidePressed:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"showAddThoughtGuide" sender:self];
}

- (IBAction)step1Pressed:(UIBarButtonItem *)sender
{
    if ([self canPerformUnwindSegueAction:@selector(doneWithWeeklyReview:) fromViewController:self withSender:sender])
    {
        
    }
}

@end
