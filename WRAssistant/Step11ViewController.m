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
static NSString *const kSegueShowAddThoughtGuide = @"showAddThoughtGuide";
static NSString *const kSegueDone = @"unwindDoneWithWeeklyReview";
static NSString *const kCloseTitle = @"Done";


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
    
    
    UIBarButtonItem *addThoughtGuideBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addThoughtGuidePressed:)];

    // Note: iPad has one item so the Add button is wired up in the storyboard
    
    if (!self.splitViewController)
    {
        // iPhone - programmatically adding bar button items
        UIBarButtonItem *closeBarButton = [[UIBarButtonItem alloc] initWithTitle:kCloseTitle style:UIBarButtonItemStyleBordered target:self action:@selector(closePressed:)];
        
        self.navigationItem.rightBarButtonItems = @[closeBarButton, addThoughtGuideBarButton];


    }
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


- (IBAction)cancelAddingThoughtGuide:(UIStoryboardSegue *)segue
{
}

- (IBAction)addThoughtGuidePressed:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:kSegueShowAddThoughtGuide sender:self];
}

- (IBAction)closePressed:(UIBarButtonItem *)sender
{
    // the Weekly Review is over.  Cleaning up.

    [WRConstants sessionFinish];
    
    [self performSegueWithIdentifier:kSegueDone sender:self];
}

@end
