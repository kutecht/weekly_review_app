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

+ (NSArray *)sectionStrings
{
    static NSArray *sectionStrings = nil;
    if (!sectionStrings)
    {
        sectionStrings =
        @[@"Commitments",
          @"Communications",
          @"Upcoming events",
          @"Administration",
          @"Waiting for",
          @"Household",
          @"Computers",
          @"Health",
          @"Leisure",
          @"Errands",
          @"Community",
          @"Writing",
          @"Professional development"];
    }
    return sectionStrings;
}

+ (NSArray *)itemStrings
{
    static NSArray *itemStrings = nil;
    if (!itemStrings)
    {
        itemStrings =
        @[ @[@"God",                         // Commitments
             @"spouse",
             @"children",
             @"family",
             @"friends",
             @"boss/partners",
             @"colleagues",
             @"subordinates",
             @"customers",
             @"professionals",
             @"other organizations"],
           @[@"calls",                      // Communications
             @"voice-mail",
             @"email",
             @"faxes",
             @"letters",
             @"memos",
             @"notes"],
           @[@"birthdays",                  // Upcoming events
             @"anniversaries",
             @"weddings",
             @"graduations",
             @"holidays",
             @"travel",
             @"vacations",
             @"social events",
             @"cultural events",
             @"sporting events"],
           @[@"budget",                     // Administration
             @"bills",
             @"banks",
             @"investments",
             @"loans",
             @"taxes",
             @"insurance",
             @"legal affairs",
             @"filing"],
           @[@"mail",                       // Waiting for
             @"repairs",
             @"reimbursements",
             @"loaned items",
             @"rsvp's"],
           @[@"property",                   // Household
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
             @"luggage"],
           @[@"software",                   // Computer
             @"hardware",
             @"perform backup",
             @"purge files"],
           @[@"doctors",                    // Health
             @"dentists",
             @"specialists",
             @"checkups",
             @"diet",
             @"exercise"],
           @[@"hobbies",                    // Leisure
             @"books",
             @"music",
             @"videos",
             @"people to visit",
             @"places to visit"],
           @[@"department store",           // Errands
             @"drugstore",
             @"market",
             @"mall",
             @"bank"],
           @[@"neighborhood",               // Community
             @"schools",
             @"spiritual organization",
             @"volunteer activities"],
           @[@"reports",                    // Writing
             @"evaluations/reviews",
             @"proposals",
             @"articles",
             @"promotional materials",
             @"manuals/instructions",
             @"rewrites and edits"],
           @[@"training",                   // Professional development
             @"things to learn",
             @"things to look up",
             @"skills to practice/learn",
             @"resume",
             @"wardrobe"]];

    }
    return itemStrings;
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
    return [TriggerListTableViewController sectionStrings].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSArray *sectionItems = [TriggerListTableViewController itemStrings][section];
    return sectionItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TriggerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSArray *sectionItems = [TriggerListTableViewController itemStrings][indexPath.section];
    cell.textLabel.text = sectionItems[indexPath.row];
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [TriggerListTableViewController sectionStrings][section];
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
