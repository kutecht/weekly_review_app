//
//  LogTableViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/28/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "LogTableViewController.h"
#import "SessionItemTableViewController.h"
#import "SessionItem+Create.h"
#import "Step11ViewController.h"

@interface LogTableViewController ()
@property (strong, nonatomic) NSMutableArray *historyLog;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end

static NSString *const kTableCellIdLogDate = @"LogDateCell";
static NSString *const kSegueShowSessionItems = @"showSessionItems";
static NSString *const kDateFormat = @"MM/dd/yyyy  HH:mm";


@implementation LogTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (NSMutableArray *)historyLog
{
    if (!_historyLog)
    {
        _historyLog = [NSMutableArray array];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        for (NSDictionary *session in [defaults objectForKey:WRConstantsLogKey]) {
                [_historyLog addObject:session];
        }
        
        // sort, showing most recent at the top
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:WRConstantsSessionFinishKey ascending:NO];
        NSArray *descriptors = [NSArray arrayWithObject: descriptor];
        [_historyLog sortUsingDescriptors:descriptors];
    }
    
    return _historyLog;
}

- (NSDateFormatter *)dateFormatter
{
    if (!_dateFormatter)
    {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:kDateFormat];
    }
    
    return _dateFormatter;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)refresh
{
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    url = [url URLByAppendingPathComponent:WRConstantsSessionItemsDoc];
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:url];

    if (![[NSFileManager defaultManager] fileExistsAtPath:[url path]])
    {
        // create trigger list document
        [document saveToURL:url forSaveOperation:UIDocumentSaveForCreating
          completionHandler:^(BOOL success) {
              if (success)
              {
                  self.managedObjectContext = document.managedObjectContext;
                  [self.tableView reloadData];
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
                [self.tableView reloadData];
            }
        }];
    }
    else
    {
        // try to us it
        self.managedObjectContext = document.managedObjectContext;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!self.managedObjectContext)
    {
        [self refresh];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:kSegueShowSessionItems] &&
        [[segue destinationViewController] isKindOfClass:[SessionItemTableViewController class]] &&
        [sender isKindOfClass:[NSNumber class]])
    {
        NSNumber *row = (NSNumber *)sender;
        SessionItemTableViewController* sessionItemTableViewController = (SessionItemTableViewController *)[segue destinationViewController];
        sessionItemTableViewController.sessionId = [self.historyLog[[row intValue]] objectForKey:WRConstantsSessionIdKey];
    }
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.historyLog count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableCellIdLogDate forIndexPath:indexPath];

    cell.textLabel.text = [self.dateFormatter stringFromDate:[self.historyLog[indexPath.row] objectForKey:WRConstantsSessionFinishKey]];

    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", [SessionItem sessionItemsCount:[self.historyLog[indexPath.row] objectForKey:WRConstantsSessionIdKey] inManagedObjectContex:self.managedObjectContext]];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:kSegueShowSessionItems sender:@(indexPath.row)];
}



@end
