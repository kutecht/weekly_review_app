//
//  ReminderTableViewController.h
//  ReminderTableViewController
//
//  Created by Kevin Utecht on 7/30/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "TapsTableViewCell.h"
#import "SessionItem+Create.h"
#import "ReminderTableViewController.h"

@interface ReminderTableViewController () 

@property (nonatomic, strong) EKEventStore *eventStore;
@property (nonatomic, strong) NSArray *allReminders; // similar to allCalendars
@property (nonatomic, strong) NSArray *remindersList;
@property (nonatomic, strong) NSMutableDictionary *checkmarkStates; // key is row (NSNumber), value is ON/OFF (NSNumber)
@property (nonatomic) NSIndexPath *tableSelection;


@end

static NSString *const kTableCellIdReminder = @"ReminderCell";


@implementation ReminderTableViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.eventStore = [[EKEventStore alloc] init];
	self.remindersList = [[NSMutableArray alloc] initWithCapacity:0];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.checkmarkStates removeAllObjects];
    [self checkEventStoreAccess];
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
            [titles addObject:[[self.remindersList objectAtIndex:[rowNum intValue]] title]];
        }
    }
    [SessionItem createSessionItems:[WRConstants getCurrentSessionId] forStep:1 withTitles:titles];
}


- (NSMutableDictionary *)checkmarkStates
{
    if (!_checkmarkStates)
    {
        _checkmarkStates = [[NSMutableDictionary alloc] init];
    }
    
    return _checkmarkStates;
}

#pragma mark -
#pragma mark Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.remindersList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableCellIdReminder forIndexPath:indexPath];
    
    // Get the event at the row selected and display its title
    cell.textLabel.text = [[self.remindersList objectAtIndex:indexPath.row] title];
    
    if ([self.checkmarkStates[@(indexPath.row)] boolValue] == YES)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TapsTableViewCell *cell = (TapsTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.tapCount == 2) {
        if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
            self.checkmarkStates[@(indexPath.row)] = @(NO);
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            self.checkmarkStates[@(indexPath.row)] = @(YES);
        }
    }
}


#pragma mark -
#pragma mark Access Calendar

-(void)checkEventStoreAccess
{
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder];    
    
    switch (status)
    {
        case EKAuthorizationStatusAuthorized:
            [self accessGranted];
            break;
        case EKAuthorizationStatusNotDetermined:
            [self requestAccess];
            break;
        case EKAuthorizationStatusDenied:
        case EKAuthorizationStatusRestricted:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Privacy Warning" message:@"Permission was not granted for Reminders"
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


-(void)requestAccess
{
    [self.eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error)
    {
         if (granted)
         {
             ReminderTableViewController * __weak weakSelf = self;
             dispatch_async(dispatch_get_main_queue(), ^{
                 [weakSelf accessGranted];
             });
         }
     }];
}


-(void)accessGranted
{
    self.allReminders =  [self.eventStore calendarsForEntityType:EKEntityTypeReminder];
    NSPredicate *predicate = [self.eventStore predicateForRemindersInCalendars:self.allReminders];
    [self.eventStore fetchRemindersMatchingPredicate:predicate completion:^(NSArray *reminders) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.remindersList = reminders;
            [self.tableView reloadData];
        });
    }];
}


@end
