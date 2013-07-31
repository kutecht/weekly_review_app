//
//  ReminderTableViewController.h
//  ReminderTableViewController
//
//  Created by Kevin Utecht on 7/30/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "ReminderTableViewController.h"

@interface ReminderTableViewController () 

@property (nonatomic, strong) EKEventStore *eventStore;
@property (nonatomic, strong) NSArray *remindersList;

@end


@implementation ReminderTableViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.eventStore = [[EKEventStore alloc] init];
	self.remindersList = [[NSMutableArray alloc] initWithCapacity:0];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self checkEventStoreAccess];
}


#pragma mark -
#pragma mark Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.remindersList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReminderCell" forIndexPath:indexPath];
    
    // Get the event at the row selected and display its title
    cell.textLabel.text = [[self.remindersList objectAtIndex:indexPath.row] title];
    return cell;
}


#pragma mark -
#pragma mark Access Calendar

-(void)checkEventStoreAccess
{
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder];    
 
    switch (status)
    {
        case EKAuthorizationStatusAuthorized: [self accessGranted];
            break;
        case EKAuthorizationStatusNotDetermined: [self requestAccess];
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
    self.remindersList = [self.eventStore calendarsForEntityType:EKEntityTypeReminder];
    [self.tableView reloadData];
}


@end
