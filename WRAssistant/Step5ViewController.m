//
//  Step5ViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/16/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "Step5ViewController.h"
#import "EventTableViewController.h"

@interface Step5ViewController ()
@end

static const int kPastEventsInWeeks = -3;
static NSString *const kSegueShowPastEvents = @"showPastEvents";


@implementation Step5ViewController

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:kSegueShowPastEvents])
    {
        // Show events for the next two weeks
        EventTableViewController* eventTableViewController = (EventTableViewController *)[segue destinationViewController];
        eventTableViewController.wrStep = WRConstantsStep5;
        eventTableViewController.endDate = [NSDate date];
        NSDateComponents *spanDateComponents = [[NSDateComponents alloc] init];
        spanDateComponents.weekOfYear = kPastEventsInWeeks;
        eventTableViewController.startDate =
        [[NSCalendar currentCalendar] dateByAddingComponents:spanDateComponents
                                                      toDate:eventTableViewController.endDate
                                                     options:0];
        //NSLog(@"start: %@", [eventTableViewController.startDate description]);
        //NSLog(@"end: %@", [eventTableViewController.endDate description]);
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
