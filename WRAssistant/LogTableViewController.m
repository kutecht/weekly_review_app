//
//  LogTableViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/28/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "LogTableViewController.h"
#import "SessionItemTableViewController.h"
#import "Step11ViewController.h"

@interface LogTableViewController ()
@property (strong, nonatomic) NSMutableArray *historyLog;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@end

static NSString *const kTableCellIdLogDate = @"LogDateCell";
static NSString *const kSegueShowSessionItems = @"showSessionItems";


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
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"self" ascending:NO];
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
        [_dateFormatter setDateFormat:@"yyyy-MM-dd 'at' HH:mm"];
    }
    
    return _dateFormatter;
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:kSegueShowSessionItems sender:@(indexPath.row)];
}



@end
