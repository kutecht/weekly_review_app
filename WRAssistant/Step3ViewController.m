//
//  Step3ViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/16/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "Step3ViewController.h"
#import "TriggerListTableViewController.h"
#import "AddTriggerViewController.h"

@interface Step3ViewController ()
@property (strong, nonatomic) TriggerListTableViewController *triggerTVC;
@end


static NSString *const kSegueShowTriggerList = @"showTriggerList";
static NSString *const kSegueShowAddTrigger = @"showAddTrigger";


@implementation Step3ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:kSegueShowTriggerList])
    {
        if ([segue.destinationViewController isKindOfClass:[TriggerListTableViewController class]])
        {
            self.triggerTVC = segue.destinationViewController;
        }
    }
    if ([segue.identifier isEqualToString:kSegueShowAddTrigger])
    {
        if ([segue.destinationViewController isKindOfClass:[AddTriggerViewController class]])
        {
            AddTriggerViewController *addTriggerController = (AddTriggerViewController *)[segue destinationViewController];
            addTriggerController.triggerGroups = self.triggerTVC.triggerGroups;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doneAddingTrigger:(UIStoryboardSegue *)segue
{
    if ([[segue sourceViewController] isKindOfClass:[AddTriggerViewController class]])
    {
        AddTriggerViewController *addTriggerController = (AddTriggerViewController *)[segue sourceViewController];
        [self.triggerTVC addTrigger:@{WRConstantsTriggerKey:addTriggerController.trigger,
                                      WRConstantsTriggerGroupKey:addTriggerController.section}];
    }
    
}

- (IBAction)cancelAddingTrigger:(UIStoryboardSegue *)segue
{
}

@end
