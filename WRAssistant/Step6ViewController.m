//
//  Step6ViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/16/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "Step6ViewController.h"
#import "EventTableViewController.h"

@interface Step6ViewController ()
@end

static const unsigned int kWeeklyReviewStep6 = 6;
static const unsigned int kFutureEventsInWeeks = 2;
static NSString *const kSegueShowFutureEvents = @"showFutureEvents";


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
    

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:kSegueShowFutureEvents])
    {
        // Show events for the next two weeks
        EventTableViewController* eventTableViewController = (EventTableViewController *)[segue destinationViewController];
        eventTableViewController.wrStep = kWeeklyReviewStep6;
        eventTableViewController.startDate = [NSDate date];
        NSDateComponents *spanDateComponents = [[NSDateComponents alloc] init];
        spanDateComponents.week = kFutureEventsInWeeks;
        eventTableViewController.endDate =
        [[NSCalendar currentCalendar] dateByAddingComponents:spanDateComponents
                                                      toDate:eventTableViewController.startDate
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
