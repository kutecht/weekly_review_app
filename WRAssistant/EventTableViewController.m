//
//  EventTableViewController.h
//  EventTableViewController
//
//  Created by Kevin Utecht on 7/30/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "EventTableViewController.h"

@interface EventTableViewController () <EKEventViewDelegate>

@property (nonatomic, strong) EKEventStore *eventStore;
@property (nonatomic, strong) NSArray *allCalendars;
@property (nonatomic, strong) NSMutableArray *eventsList;

@end


@implementation EventTableViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.eventStore = [[EKEventStore alloc] init];
	self.eventsList = [[NSMutableArray alloc] initWithCapacity:0];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self checkEventStoreAccessForCalendar];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showEventViewController"])
    {
        EKEventViewController* eventViewController = (EKEventViewController *)[segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        eventViewController.event = [self.eventsList objectAtIndex:indexPath.row];
        eventViewController.allowsEditing = NO;
    }
}


#pragma mark -
#pragma mark Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.eventsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventCell" forIndexPath:indexPath];
    
    // Get the event at the row selected and display its title
    cell.textLabel.text = [[self.eventsList objectAtIndex:indexPath.row] title];
    return cell;
}


#pragma mark -
#pragma mark Access Calendar

-(void)checkEventStoreAccessForCalendar
{
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];    
 
    switch (status)
    {
        case EKAuthorizationStatusAuthorized: [self accessGrantedForCalendar];
            break;
        case EKAuthorizationStatusNotDetermined: [self requestCalendarAccess];
            break;
        case EKAuthorizationStatusDenied:
        case EKAuthorizationStatusRestricted:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Privacy Warning" message:@"Permission was not granted for Calendar"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
            break;
        default:
            break;
    }
}


-(void)requestCalendarAccess
{
    [self.eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error)
    {
         if (granted)
         {
             EventTableViewController * __weak weakSelf = self;
             dispatch_async(dispatch_get_main_queue(), ^{
                 [weakSelf accessGrantedForCalendar];
             });
         }
     }];
}


-(void)accessGrantedForCalendar
{
    self.allCalendars =  [self.eventStore calendarsForEntityType:EKEntityTypeEvent];
    self.eventsList = [self fetchEvents];
    [self.tableView reloadData];
}


#pragma mark -
#pragma mark Fetch events

- (NSMutableArray *)fetchEvents
{
    NSMutableArray *events = nil;
    
    if (self.startDate && self.endDate)
    {
        NSPredicate *predicate = [self.eventStore predicateForEventsWithStartDate:self.startDate
                                                                          endDate:self.endDate
                                                                        calendars:self.allCalendars];
	
	    events = [NSMutableArray arrayWithArray:[self.eventStore eventsMatchingPredicate:predicate]];
    }
    
	return events;
}


#pragma mark -
#pragma mark EKEventViewDelegate

- (void)eventViewController:(EKEventViewController *)controller 
		  didCompleteWithAction:(EKEventViewAction)action
{
    [self dismissViewControllerAnimated:YES completion:^ {}];
}


@end
