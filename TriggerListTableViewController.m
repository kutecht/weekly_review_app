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
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:TRIGGER_ENTITY];
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


//
// Generated UUIDs in a command line app using: [[NSUUID UUID] UUIDString]
//
- (NSArray *)defaultTriggerList
{
    static NSArray *triggerList = nil;
    if (!triggerList)
    {
        triggerList =
        @[ @{ TRIGGER_KEY: @"spouse", TRIGGER_ID_KEY: @"A1D18BA8-04B1-449C-BD66-A031FDF45B9E", GROUP_KEY: @"Commitments"},
           @{ TRIGGER_KEY: @"children", TRIGGER_ID_KEY: @"41CA979A-76DD-4CF0-8CB0-6E09FEC7C2DF", GROUP_KEY: @"Commitments"},
           @{ TRIGGER_KEY: @"family", TRIGGER_ID_KEY: @"F39F1888-631A-442B-96A9-538EA2DF0702", GROUP_KEY: @"Commitments"},
           @{ TRIGGER_KEY: @"friends", TRIGGER_ID_KEY: @"D366A683-75DE-438A-9D73-EF0ADEEE7630", GROUP_KEY: @"Commitments"},
           @{ TRIGGER_KEY: @"boss/partners", TRIGGER_ID_KEY: @"159DB7BF-AC09-4E48-947A-4A5123627A11", GROUP_KEY: @"Commitments"},
           @{ TRIGGER_KEY: @"colleagues", TRIGGER_ID_KEY: @"CEB846AC-6272-4799-B88C-EF4D7A7BF8C2", GROUP_KEY: @"Commitments"},
           @{ TRIGGER_KEY: @"subordinates", TRIGGER_ID_KEY: @"B0586F81-142C-4809-8C97-85EA81BDB463", GROUP_KEY: @"Commitments"},
           @{ TRIGGER_KEY: @"customers", TRIGGER_ID_KEY: @"DF6EDD70-26C9-4F5F-A59E-7202B5D26048", GROUP_KEY: @"Commitments"},
           @{ TRIGGER_KEY: @"professionals", TRIGGER_ID_KEY: @"B34A1604-B351-47EF-953D-A9A5FEE5AC15", GROUP_KEY: @"Commitments"},
           @{ TRIGGER_KEY: @"other organizations", TRIGGER_ID_KEY: @"FFB4FB2F-F3A3-4E8E-B2E0-19BE1B3E39BA", GROUP_KEY: @"Commitments"},
           @{ TRIGGER_KEY: @"calls", TRIGGER_ID_KEY: @"41D4BA54-20B0-4F03-BDA3-5FC39E343A73", GROUP_KEY: @"Communications"},
           @{ TRIGGER_KEY: @"voice-mail", TRIGGER_ID_KEY: @"01DAEFF8-B179-472A-8B5C-197543852ABC", GROUP_KEY: @"Communications"},
           @{ TRIGGER_KEY: @"email", TRIGGER_ID_KEY: @"6B5E79AA-D113-4031-8FD0-26747A81B8DE", GROUP_KEY: @"Communications"},
           @{ TRIGGER_KEY: @"faxes", TRIGGER_ID_KEY: @"14F2FDDE-EFB7-4735-A8FC-D912D993DBFD", GROUP_KEY: @"Communications"},
           @{ TRIGGER_KEY: @"letters", TRIGGER_ID_KEY: @"E48826BF-33E2-4436-8BE3-198DF5F49187", GROUP_KEY: @"Communications"},
           @{ TRIGGER_KEY: @"memos", TRIGGER_ID_KEY: @"85D15995-78E9-4609-A3E5-CED4BC98FDC3", GROUP_KEY: @"Communications"},
           @{ TRIGGER_KEY: @"notes", TRIGGER_ID_KEY: @"2548331B-7B79-4B30-92DC-BFC3069AF991", GROUP_KEY: @"Communications"},
           @{ TRIGGER_KEY: @"birthdays", TRIGGER_ID_KEY: @"2A1D57A6-3B4E-4EB3-9725-E92D636B7862", GROUP_KEY: @"Upcoming events"},
           @{ TRIGGER_KEY: @"anniversaries", TRIGGER_ID_KEY: @"C2A1E339-8EDC-4ACD-8A08-80A56BB744C3", GROUP_KEY: @"Upcoming events"},
           @{ TRIGGER_KEY: @"weddings", TRIGGER_ID_KEY: @"1C8CA680-939C-4D46-A0A1-8556727DA7FD", GROUP_KEY: @"Upcoming events"},
           @{ TRIGGER_KEY: @"graduations", TRIGGER_ID_KEY: @"F5427D21-2DEF-42FE-A783-D0230033B551", GROUP_KEY: @"Upcoming events"},
           @{ TRIGGER_KEY: @"holidays", TRIGGER_ID_KEY: @"5A49E24F-2451-4DCB-8798-0FFCB0C3497C", GROUP_KEY: @"Upcoming events"},
           @{ TRIGGER_KEY: @"travel", TRIGGER_ID_KEY: @"59F756C7-E6CA-4C7B-B98B-FBD401B28DBC", GROUP_KEY: @"Upcoming events"},
           @{ TRIGGER_KEY: @"vacations", TRIGGER_ID_KEY: @"7298297E-9E00-4BB2-944C-3BC037B11B51", GROUP_KEY: @"Upcoming events"},
           @{ TRIGGER_KEY: @"social events", TRIGGER_ID_KEY: @"36D0B14E-9F1F-4155-81EC-6BD1FEF03FA2", GROUP_KEY: @"Upcoming events"},
           @{ TRIGGER_KEY: @"cultural events", TRIGGER_ID_KEY: @"3867B01D-6F8E-4E03-8F20-13212117DC0E", GROUP_KEY: @"Upcoming events"},
           @{ TRIGGER_KEY: @"sporting events", TRIGGER_ID_KEY: @"E9F4490A-7C62-489E-AEB8-13FC516FE2B0", GROUP_KEY: @"Upcoming events"},
           @{ TRIGGER_KEY: @"budget", TRIGGER_ID_KEY: @"22F7CA61-FBB3-4305-9D39-8FF2913BDBC2", GROUP_KEY: @"Administration"},
           @{ TRIGGER_KEY: @"bills", TRIGGER_ID_KEY: @"472C9766-CC37-431F-83CA-EC448D58227B", GROUP_KEY: @"Administration"},
           @{ TRIGGER_KEY: @"banks", TRIGGER_ID_KEY: @"DA4FA492-D8FE-412A-BC3F-3E5B0D2843DA", GROUP_KEY: @"Administration"},
           @{ TRIGGER_KEY: @"investments", TRIGGER_ID_KEY: @"96EC9A14-9CB4-4249-B6C0-B64116DCC8D3", GROUP_KEY: @"Administration"},
           @{ TRIGGER_KEY: @"loans", TRIGGER_ID_KEY: @"CB63C338-24C0-4AAE-8D44-73DB42660856", GROUP_KEY: @"Administration"},
           @{ TRIGGER_KEY: @"taxes", TRIGGER_ID_KEY: @"7F0F7F3B-470A-46FA-BBAF-7CF6F29DFD6F", GROUP_KEY: @"Administration"},
           @{ TRIGGER_KEY: @"insurance", TRIGGER_ID_KEY: @"78BC1E18-A594-4F03-BFDF-03A9805F5052", GROUP_KEY: @"Administration"},
           @{ TRIGGER_KEY: @"legal affairs", TRIGGER_ID_KEY: @"809EFE07-B1F9-4312-8C11-3A5E59ABF7B0", GROUP_KEY: @"Administration"},
           @{ TRIGGER_KEY: @"filing", TRIGGER_ID_KEY: @"E6DC9D6D-50FC-4FCD-95CE-A4A593AA01EE", GROUP_KEY: @"Administration"},
           @{ TRIGGER_KEY: @"mail", TRIGGER_ID_KEY: @"F011CFD4-C8AB-422D-9508-9A0CC2A0436E", GROUP_KEY: @"Waiting for"},
           @{ TRIGGER_KEY: @"repairs", TRIGGER_ID_KEY: @"1635DB7E-90E6-4EFC-82A1-BB8F785A20A9", GROUP_KEY: @"Waiting for"},
           @{ TRIGGER_KEY: @"reimbursements", TRIGGER_ID_KEY: @"5FF2B935-3CF8-4E2A-89D8-2BE2601CCD61", GROUP_KEY: @"Waiting for"},
           @{ TRIGGER_KEY: @"loaned items", TRIGGER_ID_KEY: @"7293440F-9D9C-4CF2-9F2D-9E5573C97CD3", GROUP_KEY: @"Waiting for"},
           @{ TRIGGER_KEY: @"rsvp's", TRIGGER_ID_KEY: @"7B5548D5-7EDD-4065-886F-3A3604A45916", GROUP_KEY: @"Waiting for"},
           @{ TRIGGER_KEY: @"property", TRIGGER_ID_KEY: @"AB06F914-732A-4F4B-9F86-46829BF80FA8", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"taxes", TRIGGER_ID_KEY: @"6CB1502B-5267-430D-AE7B-F1C634213993", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"builders/contractors", TRIGGER_ID_KEY: @"1E2AED4F-CD0D-4BCE-80BA-CF4A2FFE5681", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"heating/air-conditioning", TRIGGER_ID_KEY: @"E1EFC4F5-396F-4375-AB87-A6DDF5801B30", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"plumbing", TRIGGER_ID_KEY: @"2AD71A64-7CB4-4B3F-B3E1-D1AA3D276BEE", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"electricity", TRIGGER_ID_KEY: @"BC125BF4-F256-42C9-BDC0-04425774CE8E", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"roofing", TRIGGER_ID_KEY: @"AB51BE6A-E2D1-47DB-AE54-1CA066BD7917", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"landscape", TRIGGER_ID_KEY: @"2946BA82-E8CD-40D3-A552-6D759618BD0E", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"driveway", TRIGGER_ID_KEY: @"9C6289A3-C8C3-415B-B392-387D963B9F28", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"walls/floors/ceilings", TRIGGER_ID_KEY: @"9BB44340-2FB7-4737-9A0F-47614DCF0307", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"decor", TRIGGER_ID_KEY: @"E59303AB-5034-45B9-A099-B0AF935A4834", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"furniture", TRIGGER_ID_KEY: @"A06AF619-3741-4503-8EF3-F7D2209BFF7E", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"utilities", TRIGGER_ID_KEY: @"52BC8AA1-D26B-4343-AD8F-11AF17CE5CD2", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"kitchen appliances", TRIGGER_ID_KEY: @"536DDCA6-BC6A-4592-BC70-5EDCFEB7EB36", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"livingroom appliances", TRIGGER_ID_KEY: @"AD4D9095-F46B-477A-9783-DE14DBA3CF58", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"laundry room appliances", TRIGGER_ID_KEY: @"76E28FAB-B08A-4CB3-9F58-58E6E6FB13FE", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"lightbulbs/wiring", TRIGGER_ID_KEY: @"743661F7-BBBE-407E-BB27-F3F19B1A0F74", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"areas to organize", TRIGGER_ID_KEY: @"387943D3-37FF-4F9C-A831-1778FB333F91", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"office equipment", TRIGGER_ID_KEY: @"F729B6CA-8DAD-4AE9-B8F5-FF4CA666A4B3", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"sports equipment", TRIGGER_ID_KEY: @"B9538B8D-1595-4763-86FA-30E035190A6C", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"closets/clothes", TRIGGER_ID_KEY: @"24BFF91A-D898-462E-B74E-85E420699F9B", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"garage/storage", TRIGGER_ID_KEY: @"D536ACCE-9FBF-4614-B67E-4474DA0AB301", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"vehicle repair/maintenance", TRIGGER_ID_KEY: @"DE863542-F025-4AE0-9404-2E4845804A97", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"tools", TRIGGER_ID_KEY: @"FB18B76C-9B0D-403F-8A09-127CCE119D33", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"luggage", TRIGGER_ID_KEY: @"853CC298-9AB2-4EF9-8EFB-02A67B6548A4", GROUP_KEY: @"Household"},
           @{ TRIGGER_KEY: @"software", TRIGGER_ID_KEY: @"833B0EF4-E68A-41C0-A7BD-F6727C69FB34", GROUP_KEY: @"Computers"},
           @{ TRIGGER_KEY: @"hardware", TRIGGER_ID_KEY: @"863466AC-A3D8-410B-A1D6-4DC6B8D31535", GROUP_KEY: @"Computers"},
           @{ TRIGGER_KEY: @"perform backup", TRIGGER_ID_KEY: @"13D2DB83-F4CB-4204-B4CA-804C7536443A", GROUP_KEY: @"Computers"},
           @{ TRIGGER_KEY: @"purge files", TRIGGER_ID_KEY: @"D1B6CC1C-42D7-4753-B2F5-62208E5272C1", GROUP_KEY: @"Computers"},
           @{ TRIGGER_KEY: @"doctors", TRIGGER_ID_KEY: @"65718AFA-29B7-4558-86FB-7767A3925BFE", GROUP_KEY: @"Health"},
           @{ TRIGGER_KEY: @"dentists", TRIGGER_ID_KEY: @"8DD43D7C-CAB8-4DA4-AB31-0DDBB1BE68C3", GROUP_KEY: @"Health"},
           @{ TRIGGER_KEY: @"specialists", TRIGGER_ID_KEY: @"D3719BF8-D17A-4C46-8307-DBA4ED1FAC3B", GROUP_KEY: @"Health"},
           @{ TRIGGER_KEY: @"checkups", TRIGGER_ID_KEY: @"16C58AB5-66E0-4185-A968-C7824FC630F4", GROUP_KEY: @"Health"},
           @{ TRIGGER_KEY: @"diet", TRIGGER_ID_KEY: @"B0F826F2-FF1E-4A24-BC64-4BF251AD28DA", GROUP_KEY: @"Health"},
           @{ TRIGGER_KEY: @"exercise", TRIGGER_ID_KEY: @"37F6435A-7DE0-4614-AD96-B0E51CCD1416", GROUP_KEY: @"Health"},
           @{ TRIGGER_KEY: @"hobbies", TRIGGER_ID_KEY: @"F17D3740-E15D-48B8-ABEF-4BDD9C71C971", GROUP_KEY: @"Leisure"},
           @{ TRIGGER_KEY: @"books", TRIGGER_ID_KEY: @"3E15EBDA-79B1-4A53-8EF0-420A02A4E802", GROUP_KEY: @"Leisure"},
           @{ TRIGGER_KEY: @"music", TRIGGER_ID_KEY: @"C3A6DC31-B0F4-46E0-B894-43F6E28F6A53", GROUP_KEY: @"Leisure"},
           @{ TRIGGER_KEY: @"videos", TRIGGER_ID_KEY: @"D1EFE1D4-4B35-4E89-8A6C-6C7B64798659", GROUP_KEY: @"Leisure"},
           @{ TRIGGER_KEY: @"people to visit", TRIGGER_ID_KEY: @"5D46BD5F-2528-46F8-B9F2-4BD3D1E5E33D", GROUP_KEY: @"Leisure"},
           @{ TRIGGER_KEY: @"places to visit", TRIGGER_ID_KEY: @"54DC6F89-3056-4AA0-85F9-E7D4426CEF6B", GROUP_KEY: @"Leisure"},
           @{ TRIGGER_KEY: @"department store", TRIGGER_ID_KEY: @"2FCBC5E3-60AA-4222-BA18-A9A0D6073CE0", GROUP_KEY: @"Errands"},
           @{ TRIGGER_KEY: @"drugstore", TRIGGER_ID_KEY: @"93A583F9-8959-463B-B6DF-A10945E4581A", GROUP_KEY: @"Errands"},
           @{ TRIGGER_KEY: @"market", TRIGGER_ID_KEY: @"2F2C85EA-C9AD-401E-9598-8D16782FA13E", GROUP_KEY: @"Errands"},
           @{ TRIGGER_KEY: @"mall", TRIGGER_ID_KEY: @"A8127329-05D0-4511-88D5-B38F0CC5CAA6", GROUP_KEY: @"Errands"},
           @{ TRIGGER_KEY: @"bank", TRIGGER_ID_KEY: @"3412ECBF-05CC-4859-BB60-5C2CC4426DCD", GROUP_KEY: @"Errands"},
           @{ TRIGGER_KEY: @"neighborhood", TRIGGER_ID_KEY: @"128814AC-B87B-4843-B0A5-A5F7E6BA93B6", GROUP_KEY: @"Community"},
           @{ TRIGGER_KEY: @"schools", TRIGGER_ID_KEY: @"CF1BA2E4-21E0-48D9-945E-6789730C6CE0", GROUP_KEY: @"Community"},
           @{ TRIGGER_KEY: @"spiritual organization", TRIGGER_ID_KEY: @"0BDA6976-B862-4B72-8F6B-D41815F904BB", GROUP_KEY: @"Community"},
           @{ TRIGGER_KEY: @"volunteer activities", TRIGGER_ID_KEY: @"1B7D1E54-8E6B-4C42-8656-1CB2DC7E8F57", GROUP_KEY: @"Community"},
           @{ TRIGGER_KEY: @"reports", TRIGGER_ID_KEY: @"242B33B0-9D16-41A4-B373-FAACEAF65DCF", GROUP_KEY: @"Writing"},
           @{ TRIGGER_KEY: @"evaluations/reviews", TRIGGER_ID_KEY: @"04E0FAF9-CE2F-4218-B5EE-67040A78575C", GROUP_KEY: @"Writing"},
           @{ TRIGGER_KEY: @"proposals", TRIGGER_ID_KEY: @"FFB1D597-704C-435D-A922-6AA74AC247CA", GROUP_KEY: @"Writing"},
           @{ TRIGGER_KEY: @"articles", TRIGGER_ID_KEY: @"4E778CEA-A09C-4D70-BC6D-650DBAA4C7EA", GROUP_KEY: @"Writing"},
           @{ TRIGGER_KEY: @"promotional materials", TRIGGER_ID_KEY: @"A3F1CC19-9083-456D-B9B6-F5D6E0AA04A6", GROUP_KEY: @"Writing"},
           @{ TRIGGER_KEY: @"manuals/instructions", TRIGGER_ID_KEY: @"6A2B6E49-4780-49BC-A932-E2E562E00A75", GROUP_KEY: @"Writing"},
           @{ TRIGGER_KEY: @"rewrites and edits", TRIGGER_ID_KEY: @"257594FF-84EB-4FC4-86C4-A594A22532B5", GROUP_KEY: @"Writing"},
           @{ TRIGGER_KEY: @"training", TRIGGER_ID_KEY: @"B03B8495-0448-43C8-9693-3DB794717D39", GROUP_KEY: @"Professional development"},
           @{ TRIGGER_KEY: @"things to learn", TRIGGER_ID_KEY: @"7246CD1E-6207-4429-A4DC-64763B92C5F8", GROUP_KEY: @"Professional development"},
           @{ TRIGGER_KEY: @"things to look up", TRIGGER_ID_KEY: @"0FA2D167-0FDE-4456-8F87-DB222AB8BAEB", GROUP_KEY: @"Professional development"},
           @{ TRIGGER_KEY: @"skills to practice/learn", TRIGGER_ID_KEY: @"6999A4DF-A307-46B1-B1CE-047785D6AF41", GROUP_KEY: @"Professional development"},
           @{ TRIGGER_KEY: @"resume", TRIGGER_ID_KEY: @"DF71B352-3512-40F9-B2FA-7712D3898158", GROUP_KEY: @"Professional development"},
           @{ TRIGGER_KEY: @"wardrobe", TRIGGER_ID_KEY: @"2259DCD4-7517-4FFA-A51E-0DC99E2411FB", GROUP_KEY: @"Professional development"}
         ];
    }
    
    return triggerList;
}


- (void)refresh
{
    NSArray *triggerList = [self defaultTriggerList];
    
    [self.managedObjectContext performBlock:^{
        for (NSDictionary *trigger in triggerList)
        {
            [Trigger triggerWithInfo:trigger  inManagedObjectContex:self.managedObjectContext];
        }
    }];
    
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
        [self useDefaultTriggerList];
    }
}

- (void)useDefaultTriggerList
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
                  [self refresh];
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
