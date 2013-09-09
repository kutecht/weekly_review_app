//
//  EventTableViewController.h
//  EventTableViewController
//
//  Created by Kevin Utecht on 7/30/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "TapsTableViewCell.h"
#import "SessionItem+Create.h"
#import "EventTableViewController.h"

@interface EventTableViewController () <EKEventViewDelegate>

@property (nonatomic, strong) EKEventStore *eventStore;
@property (nonatomic, strong) NSArray *allCalendars;
@property (nonatomic, strong) NSMutableArray *eventsList;
@property (nonatomic, strong) NSTimer *tapTimer;
@property (nonatomic, strong) NSMutableDictionary *checkmarkStates; // key is row (NSNumber), value is ON/OFF (NSNumber)

@end

static NSString *const kSegueShowEventViewController = @"showEventViewController";
static NSString *const kTableCellIdEvent = @"EventCell";
static NSString *const kCheckmark = @"✓";
static NSString *const kNoDetail = @"";



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
    [self.checkmarkStates removeAllObjects];
    [SessionItem deleteSessionItems:[WRConstants getCurrentSessionId] forStep:self.wrStep];
    [self checkEventStoreAccessForCalendar];
}



- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // add checkmarked items to SessionItem database table
    NSMutableArray *titles = [[NSMutableArray alloc] init];    
    for (NSNumber *rowNum in self.checkmarkStates)
    {
        if ([self.checkmarkStates[rowNum] boolValue] == YES)
        {
            [titles addObject:[[self.eventsList objectAtIndex:[rowNum intValue]] title]];
        }
    }
    [SessionItem createSessionItems:[WRConstants getCurrentSessionId] forStep:self.wrStep withTitles:titles];
}

- (NSMutableDictionary *)checkmarkStates
{
    if (!_checkmarkStates)
    {
        _checkmarkStates = [[NSMutableDictionary alloc] init];
    }
    
    return _checkmarkStates;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:kSegueShowEventViewController] &&
        [sender isKindOfClass:[NSNumber class]])
    {
        NSNumber *row = (NSNumber *)sender;
        NSLog(@"Row = %d", [row intValue]);
        EKEventViewController* eventViewController = (EKEventViewController *)[segue destinationViewController];
        eventViewController.event = [self.eventsList objectAtIndex:[row intValue]];
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
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableCellIdEvent forIndexPath:indexPath];
    
    // Get the event at the row selected and display its title
    cell.textLabel.text = [[self.eventsList objectAtIndex:indexPath.row] title];
    
    if ([self.checkmarkStates[@(indexPath.row)] boolValue] == YES)
    {
        cell.detailTextLabel.text = kCheckmark;
    }
    else
    {
        cell.detailTextLabel.text = kNoDetail;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TapsTableViewCell *cell = (TapsTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.tapCount == 1)
    {
        //This is the first tap. If there is no tap till tapTimer is fired, it is a single tap
        self.tapTimer = [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(tapTimerFired:) userInfo:[NSNumber numberWithInt:(indexPath.row)] repeats:NO];
    }
    else if (cell.tapCount == 2)
    {
        //double tap - Put your double tap code here
        if (self.tapTimer)
        {
            [self.tapTimer invalidate];
            self.tapTimer = nil;
        }
        if ([cell.detailTextLabel.text isEqualToString:kNoDetail])
        {
            cell.detailTextLabel.text = kCheckmark;
            self.checkmarkStates[@(indexPath.row)] = @(YES);
        }
        else
        {
            cell.detailTextLabel.text = kNoDetail;
            self.checkmarkStates[@(indexPath.row)] = @(NO);
        }
    }
}

- (void)tapTimerFired:(NSTimer *)aTimer
{
    // single tap
    [self performSegueWithIdentifier:kSegueShowEventViewController sender:aTimer.userInfo];
    if (self.tapTimer != nil)
    {
        self.tapTimer = nil;
    }
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
