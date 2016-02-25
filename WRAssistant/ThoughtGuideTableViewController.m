//
//  ThoughtGuideTableViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 8/2/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "TapsTableViewCell.h"
#import "ThoughtGuideTableViewController.h"
#import "SessionItem+Create.h"
#import "ThoughtGuide+Create.h"

@interface ThoughtGuideTableViewController ()
@property (nonatomic) BOOL beganUpdates;
@property (nonatomic, strong) NSMutableDictionary *checkmarkStates; // key is indexPath, value is ON/OFF (NSNumber)
@end

static NSString *const kTableCellIdThoughtGuide = @"ThoughtGuideCell";

@implementation ThoughtGuideTableViewController

- (NSMutableDictionary *)checkmarkStates
{
    if (!_checkmarkStates)
    {
        _checkmarkStates = [[NSMutableDictionary alloc] init];
    }
    
    return _checkmarkStates;
}

- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    
    if (managedObjectContext)
    {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:WRConstantsThoughtGuideEntity];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:WRConstantsThoughtGuideTitleKey ascending:YES
                                                                   selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = nil; // all ThoughtGuides
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    }
    else
    {
        self.fetchedResultsController = nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableCellIdThoughtGuide];
    
    ThoughtGuide *thoughtGuide = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = thoughtGuide.title;
    
    if ([self.checkmarkStates[indexPath] boolValue] == YES)
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
            self.checkmarkStates[indexPath] = @(NO);
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            self.checkmarkStates[indexPath] = @(YES);
        }
    }
}


- (void)refreshWithDefaultData
{
    NSArray *thoughtGuides = [WRConstants defaultThoughtGuides];
    
    [self.managedObjectContext performBlock:^{
        for (NSDictionary *thoughtGuide in thoughtGuides)
        {
            [ThoughtGuide thoughtGuideWithInfo:thoughtGuide[WRConstantsThoughtGuideKey] inManagedObjectContex:self.managedObjectContext];
        }
    }];
}

- (void)refresh
{
    [self.checkmarkStates removeAllObjects];    
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    url = [url URLByAppendingPathComponent:WRConstantsThoughtGuidesDoc];
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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!self.managedObjectContext)
    {
        [self refresh];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    // add checkmarked items to SessionItem database table
    NSMutableArray *titles = [[NSMutableArray alloc] init];
    for (NSIndexPath *indexPath in self.checkmarkStates)
    {
        if ([self.checkmarkStates[indexPath] boolValue] == YES)
        {
            [titles addObject:[[self.fetchedResultsController objectAtIndexPath:indexPath] title]];
        }
    }
    [SessionItem createSessionItems:[WRConstants getCurrentSessionId]
                            forStep:WRConstantsStep11
                         withTitles:titles];
    
    [WRConstants sessionFinish];
    
    // Starting over
    [WRConstants sessionStart];
}


#pragma mark - Table view data source



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.managedObjectContext deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)addThoughtGuide:(NSString *)title
{
    [self.managedObjectContext performBlock:^{
        [ThoughtGuide thoughtGuideWithInfo:title  inManagedObjectContex:self.managedObjectContext];
    }];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)setFetchedResultsController:(NSFetchedResultsController *)newfrc
{
    NSFetchedResultsController *oldfrc = _fetchedResultsController;
    if (newfrc != oldfrc) {
        _fetchedResultsController = newfrc;
        newfrc.delegate = self;
        if ((!self.title || [self.title isEqualToString:oldfrc.fetchRequest.entity.name]) && (!self.navigationController || !self.navigationItem.title))
        {
            self.title = newfrc.fetchRequest.entity.name;
        }
        
        if (newfrc)
        {
            NSError *error;
            [newfrc performFetch:&error];
            if (error)
            {
                NSLog(@"[%@ %@] %@ (%@)", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [error localizedDescription], [error localizedFailureReason]);
            }
            [self.tableView reloadData];
        }
        else
        {
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
            case NSFetchedResultsChangeMove:
                break;

            case NSFetchedResultsChangeUpdate:
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
