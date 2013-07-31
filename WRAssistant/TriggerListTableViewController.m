//
//  TriggerListTableViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/18/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "TriggerListTableViewController.h"
#import "Trigger+Create.h"


@interface TriggerListTableViewController ()
@property (nonatomic) BOOL beganUpdates;
@end

@implementation TriggerListTableViewController

#define CELL_IDENTIFIER  @"TriggerCell"

- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    
    if (managedObjectContext)
    {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:WRConstantsTriggerEntity];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"group.title" ascending:YES
                                                                 selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = nil; // all Triggers
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:managedObjectContext sectionNameKeyPath:@"group.title" cacheName:nil];
    }
    else
    {
        self.fetchedResultsController = nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    
    Trigger *trigger = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = trigger.title;

    return cell;
}

- (NSArray *)defaultTriggerList
{
    static NSArray *triggerList = nil;
    if (!triggerList)
    {
        triggerList =
        @[ @{ WRConstantsTriggerKey: @"spouse", WRConstantsTriggerGroupKey: @"Commitments"},
           @{ WRConstantsTriggerKey: @"children", WRConstantsTriggerGroupKey: @"Commitments"},
           @{ WRConstantsTriggerKey: @"family", WRConstantsTriggerGroupKey: @"Commitments"},
           @{ WRConstantsTriggerKey: @"friends", WRConstantsTriggerGroupKey: @"Commitments"},
           @{ WRConstantsTriggerKey: @"boss/partners", WRConstantsTriggerGroupKey: @"Commitments"},
           @{ WRConstantsTriggerKey: @"colleagues", WRConstantsTriggerGroupKey: @"Commitments"},
           @{ WRConstantsTriggerKey: @"subordinates", WRConstantsTriggerGroupKey: @"Commitments"},
           @{ WRConstantsTriggerKey: @"customers", WRConstantsTriggerGroupKey: @"Commitments"},
           @{ WRConstantsTriggerKey: @"professionals", WRConstantsTriggerGroupKey: @"Commitments"},
           @{ WRConstantsTriggerKey: @"other organizations", WRConstantsTriggerGroupKey: @"Commitments"},
           @{ WRConstantsTriggerKey: @"calls", WRConstantsTriggerGroupKey: @"Communications"},
           @{ WRConstantsTriggerKey: @"voice-mail", WRConstantsTriggerGroupKey: @"Communications"},
           @{ WRConstantsTriggerKey: @"email", WRConstantsTriggerGroupKey: @"Communications"},
           @{ WRConstantsTriggerKey: @"faxes", WRConstantsTriggerGroupKey: @"Communications"},
           @{ WRConstantsTriggerKey: @"letters", WRConstantsTriggerGroupKey: @"Communications"},
           @{ WRConstantsTriggerKey: @"memos", WRConstantsTriggerGroupKey: @"Communications"},
           @{ WRConstantsTriggerKey: @"notes", WRConstantsTriggerGroupKey: @"Communications"},
           @{ WRConstantsTriggerKey: @"birthdays", WRConstantsTriggerGroupKey: @"Upcoming events"},
           @{ WRConstantsTriggerKey: @"anniversaries", WRConstantsTriggerGroupKey: @"Upcoming events"},
           @{ WRConstantsTriggerKey: @"weddings", WRConstantsTriggerGroupKey: @"Upcoming events"},
           @{ WRConstantsTriggerKey: @"graduations", WRConstantsTriggerGroupKey: @"Upcoming events"},
           @{ WRConstantsTriggerKey: @"holidays", WRConstantsTriggerGroupKey: @"Upcoming events"},
           @{ WRConstantsTriggerKey: @"travel", WRConstantsTriggerGroupKey: @"Upcoming events"},
           @{ WRConstantsTriggerKey: @"vacations", WRConstantsTriggerGroupKey: @"Upcoming events"},
           @{ WRConstantsTriggerKey: @"social events", WRConstantsTriggerGroupKey: @"Upcoming events"},
           @{ WRConstantsTriggerKey: @"cultural events", WRConstantsTriggerGroupKey: @"Upcoming events"},
           @{ WRConstantsTriggerKey: @"sporting events", WRConstantsTriggerGroupKey: @"Upcoming events"},
           @{ WRConstantsTriggerKey: @"budget", WRConstantsTriggerGroupKey: @"Administration"},
           @{ WRConstantsTriggerKey: @"bills", WRConstantsTriggerGroupKey: @"Administration"},
           @{ WRConstantsTriggerKey: @"banks", WRConstantsTriggerGroupKey: @"Administration"},
           @{ WRConstantsTriggerKey: @"investments", WRConstantsTriggerGroupKey: @"Administration"},
           @{ WRConstantsTriggerKey: @"loans", WRConstantsTriggerGroupKey: @"Administration"},
           @{ WRConstantsTriggerKey: @"taxes", WRConstantsTriggerGroupKey: @"Administration"},
           @{ WRConstantsTriggerKey: @"insurance", WRConstantsTriggerGroupKey: @"Administration"},
           @{ WRConstantsTriggerKey: @"legal affairs", WRConstantsTriggerGroupKey: @"Administration"},
           @{ WRConstantsTriggerKey: @"filing", WRConstantsTriggerGroupKey: @"Administration"},
           @{ WRConstantsTriggerKey: @"mail", WRConstantsTriggerGroupKey: @"Waiting for"},
           @{ WRConstantsTriggerKey: @"repairs", WRConstantsTriggerGroupKey: @"Waiting for"},
           @{ WRConstantsTriggerKey: @"reimbursements", WRConstantsTriggerGroupKey: @"Waiting for"},
           @{ WRConstantsTriggerKey: @"loaned items", WRConstantsTriggerGroupKey: @"Waiting for"},
           @{ WRConstantsTriggerKey: @"rsvp's", WRConstantsTriggerGroupKey: @"Waiting for"},
           @{ WRConstantsTriggerKey: @"property", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"taxes", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"builders/contractors", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"heating/air-conditioning", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"plumbing", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"electricity", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"roofing", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"landscape", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"driveway", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"walls/floors/ceilings", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"decor", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"furniture", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"utilities", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"kitchen appliances", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"livingroom appliances", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"laundry room appliances", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"lightbulbs/wiring", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"areas to organize", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"office equipment", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"sports equipment", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"closets/clothes", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"garage/storage", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"vehicle repair/maintenance", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"tools", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"luggage", WRConstantsTriggerGroupKey: @"Household"},
           @{ WRConstantsTriggerKey: @"software", WRConstantsTriggerGroupKey: @"Computers"},
           @{ WRConstantsTriggerKey: @"hardware", WRConstantsTriggerGroupKey: @"Computers"},
           @{ WRConstantsTriggerKey: @"perform backup", WRConstantsTriggerGroupKey: @"Computers"},
           @{ WRConstantsTriggerKey: @"purge files", WRConstantsTriggerGroupKey: @"Computers"},
           @{ WRConstantsTriggerKey: @"doctors", WRConstantsTriggerGroupKey: @"Health"},
           @{ WRConstantsTriggerKey: @"dentists", WRConstantsTriggerGroupKey: @"Health"},
           @{ WRConstantsTriggerKey: @"specialists", WRConstantsTriggerGroupKey: @"Health"},
           @{ WRConstantsTriggerKey: @"checkups", WRConstantsTriggerGroupKey: @"Health"},
           @{ WRConstantsTriggerKey: @"diet", WRConstantsTriggerGroupKey: @"Health"},
           @{ WRConstantsTriggerKey: @"exercise", WRConstantsTriggerGroupKey: @"Health"},
           @{ WRConstantsTriggerKey: @"hobbies", WRConstantsTriggerGroupKey: @"Leisure"},
           @{ WRConstantsTriggerKey: @"books", WRConstantsTriggerGroupKey: @"Leisure"},
           @{ WRConstantsTriggerKey: @"music", WRConstantsTriggerGroupKey: @"Leisure"},
           @{ WRConstantsTriggerKey: @"videos", WRConstantsTriggerGroupKey: @"Leisure"},
           @{ WRConstantsTriggerKey: @"people to visit", WRConstantsTriggerGroupKey: @"Leisure"},
           @{ WRConstantsTriggerKey: @"places to visit", WRConstantsTriggerGroupKey: @"Leisure"},
           @{ WRConstantsTriggerKey: @"department store", WRConstantsTriggerGroupKey: @"Errands"},
           @{ WRConstantsTriggerKey: @"pharmacy", WRConstantsTriggerGroupKey: @"Errands"},
           @{ WRConstantsTriggerKey: @"market", WRConstantsTriggerGroupKey: @"Errands"},
           @{ WRConstantsTriggerKey: @"mall", WRConstantsTriggerGroupKey: @"Errands"},
           @{ WRConstantsTriggerKey: @"bank", WRConstantsTriggerGroupKey: @"Errands"},
           @{ WRConstantsTriggerKey: @"neighborhood", WRConstantsTriggerGroupKey: @"Community"},
           @{ WRConstantsTriggerKey: @"schools", WRConstantsTriggerGroupKey: @"Community"},
           @{ WRConstantsTriggerKey: @"spiritual organization", WRConstantsTriggerGroupKey: @"Community"},
           @{ WRConstantsTriggerKey: @"volunteer activities", WRConstantsTriggerGroupKey: @"Community"},
           @{ WRConstantsTriggerKey: @"reports", WRConstantsTriggerGroupKey: @"Writing"},
           @{ WRConstantsTriggerKey: @"evaluations/reviews", WRConstantsTriggerGroupKey: @"Writing"},
           @{ WRConstantsTriggerKey: @"proposals", WRConstantsTriggerGroupKey: @"Writing"},
           @{ WRConstantsTriggerKey: @"articles", WRConstantsTriggerGroupKey: @"Writing"},
           @{ WRConstantsTriggerKey: @"promotional materials", WRConstantsTriggerGroupKey: @"Writing"},
           @{ WRConstantsTriggerKey: @"manuals/instructions", WRConstantsTriggerGroupKey: @"Writing"},
           @{ WRConstantsTriggerKey: @"rewrites and edits", WRConstantsTriggerGroupKey: @"Writing"},
           @{ WRConstantsTriggerKey: @"training", WRConstantsTriggerGroupKey: @"Professional development"},
           @{ WRConstantsTriggerKey: @"things to learn", WRConstantsTriggerGroupKey: @"Professional development"},
           @{ WRConstantsTriggerKey: @"things to look up", WRConstantsTriggerGroupKey: @"Professional development"},
           @{ WRConstantsTriggerKey: @"skills to practice/learn", WRConstantsTriggerGroupKey: @"Professional development"},
           @{ WRConstantsTriggerKey: @"resume", WRConstantsTriggerGroupKey: @"Professional development"},
           @{ WRConstantsTriggerKey: @"wardrobe", WRConstantsTriggerGroupKey: @"Professional development"}
         ];
    }
    
    return triggerList;
}

- (void)refreshWithDefaultData
{
    NSArray *triggerList = [self defaultTriggerList];
    
    [self.managedObjectContext performBlock:^{
        for (NSDictionary *trigger in triggerList)
        {
            [Trigger triggerWithInfo:trigger  inManagedObjectContex:self.managedObjectContext];
        }
    }];
    
}

- (void)refresh
{
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    url = [url URLByAppendingPathComponent:@"DefaultTriggerList"];
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:url];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:[url path]])
    {
        // create trigger list document
        [document saveToURL:url forSaveOperation:UIDocumentSaveForCreating
          completionHandler:^(BOOL success) {
              if (success)
              {
                  self.managedObjectContext = document.managedObjectContext;
                  [self refreshWithDefaultData];
              }
          }];
    }
    else if (document.documentState == UIDocumentStateClosed)
    {
        // open it
        [document openWithCompletionHandler:^(BOOL success) {
            if (success)
            {
                self.managedObjectContext = document.managedObjectContext;

            }
        }];
    }
    else
    {
        // try to us it
        self.managedObjectContext = document.managedObjectContext;
    }

    [self.refreshControl endRefreshing];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.debug = YES;
    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!self.managedObjectContext)
    {
        [self refresh];
    }
}

//
// Following is based on CS193P lecture #14 Feb. 2013 -- TODO: remove debug (instructor code) before ship, research what NSFetchRequest docs say to add
//

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Fetching

- (void)performFetch
{
    if (self.fetchedResultsController) {
        if (self.fetchedResultsController.fetchRequest.predicate) {
            if (self.debug) NSLog(@"[%@ %@] fetching %@ with predicate: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), self.fetchedResultsController.fetchRequest.entityName, self.fetchedResultsController.fetchRequest.predicate);
        } else {
            if (self.debug) NSLog(@"[%@ %@] fetching all %@ (i.e., no predicate)", NSStringFromClass([self class]), NSStringFromSelector(_cmd), self.fetchedResultsController.fetchRequest.entityName);
        }
        NSError *error;
        [self.fetchedResultsController performFetch:&error];
        if (error) NSLog(@"[%@ %@] %@ (%@)", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [error localizedDescription], [error localizedFailureReason]);
    } else {
        if (self.debug) NSLog(@"[%@ %@] no NSFetchedResultsController (yet?)", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }
    [self.tableView reloadData];
}

- (void)setFetchedResultsController:(NSFetchedResultsController *)newfrc
{
    NSFetchedResultsController *oldfrc = _fetchedResultsController;
    if (newfrc != oldfrc) {
        _fetchedResultsController = newfrc;
        newfrc.delegate = self;
        if ((!self.title || [self.title isEqualToString:oldfrc.fetchRequest.entity.name]) && (!self.navigationController || !self.navigationItem.title)) {
            self.title = newfrc.fetchRequest.entity.name;
        }
        if (newfrc) {
            if (self.debug) NSLog(@"[%@ %@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), oldfrc ? @"updated" : @"set");
            [self performFetch];
        } else {
            if (self.debug) NSLog(@"[%@ %@] reset to nil", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
            [self.tableView reloadData];
        }
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [[[self.fetchedResultsController sections] objectAtIndex:section] name];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
	return [self.fetchedResultsController sectionForSectionIndexTitle:title atIndex:index];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self.fetchedResultsController sectionIndexTitles];
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    if (!self.suspendAutomaticTrackingOfChangesInManagedObjectContext) {
        [self.tableView beginUpdates];
        self.beganUpdates = YES;
    }
}

- (void)controller:(NSFetchedResultsController *)controller
  didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
		   atIndex:(NSUInteger)sectionIndex
	 forChangeType:(NSFetchedResultsChangeType)type
{
    if (!self.suspendAutomaticTrackingOfChangesInManagedObjectContext)
    {
        switch(type)
        {
            case NSFetchedResultsChangeInsert:
                [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
                break;
                
            case NSFetchedResultsChangeDelete:
                [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
                break;
        }
    }
}


- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
	   atIndexPath:(NSIndexPath *)indexPath
	 forChangeType:(NSFetchedResultsChangeType)type
	  newIndexPath:(NSIndexPath *)newIndexPath
{
    if (!self.suspendAutomaticTrackingOfChangesInManagedObjectContext)
    {
        switch(type)
        {
            case NSFetchedResultsChangeInsert:
                [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
                break;
                
            case NSFetchedResultsChangeDelete:
                [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
                break;
                
            case NSFetchedResultsChangeUpdate:
                [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
                break;
                
            case NSFetchedResultsChangeMove:
                [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
                [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
                break;
        }
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    if (self.beganUpdates) [self.tableView endUpdates];
}

- (void)endSuspensionOfUpdatesDueToContextChanges
{
    _suspendAutomaticTrackingOfChangesInManagedObjectContext = NO;
}

- (void)setSuspendAutomaticTrackingOfChangesInManagedObjectContext:(BOOL)suspend
{
    if (suspend) {
        _suspendAutomaticTrackingOfChangesInManagedObjectContext = YES;
    } else {
        [self performSelector:@selector(endSuspensionOfUpdatesDueToContextChanges) withObject:0 afterDelay:0];
    }
}


@end
