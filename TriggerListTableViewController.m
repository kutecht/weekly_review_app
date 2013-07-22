//
//  TriggerListTableViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/18/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "TriggerListTableViewController.h"




@interface TriggerListTableViewController ()

@end

@implementation TriggerListTableViewController

#define CELL_IDENTIFIER  @"TriggerCell"

#define GROUP_KEY        @"group"
#define TRIGGERS_KEY     @"triggers"


+ (NSArray *)defaultTriggerList
{
    static NSArray *triggerList = nil;
    if (!triggerList)
    {
        triggerList =
        @[ @{ GROUP_KEY: @"Commitments",
              TRIGGERS_KEY: @[@"spouse",
                             @"children",
                             @"family",
                             @"friends",
                             @"boss/partners",
                             @"colleagues",
                             @"subordinates",
                             @"customers",
                             @"professionals",
                             @"other organizations"]
            },
           @{ GROUP_KEY: @"Communications",
              TRIGGERS_KEY: @[@"calls",
                             @"voice-mail",
                             @"email",
                             @"faxes",
                             @"letters",
                             @"memos",
                             @"notes"]
              },
           @{ GROUP_KEY: @"Upcoming events",
              TRIGGERS_KEY: @[@"birthdays",
                             @"anniversaries",
                             @"weddings",
                             @"graduations",
                             @"holidays",
                             @"travel",
                             @"vacations",
                             @"social events",
                             @"cultural events",
                             @"sporting events"]
              },
           @{ GROUP_KEY: @"Administration",
              TRIGGERS_KEY: @[@"budget",
                             @"bills",
                             @"banks",
                             @"investments",
                             @"loans",
                             @"taxes",
                             @"insurance",
                             @"legal affairs",
                             @"filing"]
              },
           @{ GROUP_KEY: @"Waiting for",
              TRIGGERS_KEY: @[@"mail",
                             @"repairs",
                             @"reimbursements",
                             @"loaned items",
                             @"rsvp's"]
              },
           @{ GROUP_KEY: @"Household",
              TRIGGERS_KEY: @[@"property",
                             @"taxes",
                             @"builders/contractors",
                             @"heating/air-conditioning",
                             @"plumbing",
                             @"electricity",
                             @"roofing",
                             @"landscape",
                             @"driveway",
                             @"walls/floors/ceilings",
                             @"decor",
                             @"furniture",
                             @"utilities",
                             @"kitchen appliances",
                             @"livingroom appliances",
                             @"laundry room appliances",
                             @"lightbulbs/wiring",
                             @"areas to organize",
                             @"office equipment",
                             @"sports equipment",
                             @"closets/clothes",
                             @"garage/storage",
                             @"vehicle repair/maintenance",
                             @"tools",
                             @"luggage"]
              },
           @{ GROUP_KEY: @"Computers",
              TRIGGERS_KEY: @[@"software",
                             @"hardware",
                             @"perform backup",
                             @"purge files"]
              },
           @{ GROUP_KEY: @"Health",
              TRIGGERS_KEY: @[@"doctors",
                             @"dentists",
                             @"specialists",
                             @"checkups",
                             @"diet",
                             @"exercise"]
              },
           @{ GROUP_KEY: @"Leisure",
              TRIGGERS_KEY: @[@"hobbies",
                             @"books",
                             @"music",
                             @"videos",
                             @"people to visit",
                             @"places to visit"]
              },
           @{ GROUP_KEY: @"Errands",
              TRIGGERS_KEY: @[@"department store",
                             @"drugstore",
                             @"market",
                             @"mall",
                             @"bank"]
              },
           @{ GROUP_KEY: @"Community",
              TRIGGERS_KEY: @[@"neighborhood",
                             @"schools",
                             @"spiritual organization",
                             @"volunteer activities"]
              },
           @{ GROUP_KEY: @"Writing",
              TRIGGERS_KEY: @[@"reports",
                             @"evaluations/reviews",
                             @"proposals",
                             @"articles",
                             @"promotional materials",
                             @"manuals/instructions",
                             @"rewrites and edits"]
              },
           @{ GROUP_KEY: @"Professional development",
              TRIGGERS_KEY: @[@"training",
                             @"things to learn",
                             @"things to look up",
                             @"skills to practice/learn",
                             @"resume",
                             @"wardrobe"]
              }
           ];
    }
    
    return triggerList;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [TriggerListTableViewController defaultTriggerList].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSDictionary *triggerDictionary = [TriggerListTableViewController defaultTriggerList][section];
    NSArray *triggers = [triggerDictionary valueForKey:TRIGGERS_KEY];
    return triggers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = CELL_IDENTIFIER;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *triggerDictionary = [TriggerListTableViewController defaultTriggerList][indexPath.section];
    NSArray *triggers = [triggerDictionary valueForKey:TRIGGERS_KEY];
    cell.textLabel.text = triggers[indexPath.row];
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *triggerDictionary = [TriggerListTableViewController defaultTriggerList][section];
    return [triggerDictionary valueForKey:GROUP_KEY];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
