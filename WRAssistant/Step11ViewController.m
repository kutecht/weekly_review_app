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
@property (strong, nonatomic) ThoughtGuideTableViewController *thoughtGuideTVC;

@end

static NSString *const kSegueShowThoughtGuideTable = @"showThoughtGuideList";

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

- (IBAction)weeklyReviewCompletedPressed:(UIBarButtonItem *)sender
{
    [WRConstants logDateTime];
    // TODO: Add an alert that time was logged -- popup
}

- (IBAction)cancelAddingThoughtGuide:(UIStoryboardSegue *)segue
{
}



@end
