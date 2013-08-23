//
//  WRStepsTableViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 8/11/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "WRStepsTableViewController.h"

@interface WRStepsTableViewController () <UISplitViewControllerDelegate>
@end


@implementation WRStepsTableViewController

- (void)awakeFromNib
{
    self.splitViewController.delegate = self;
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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionTop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation
{
    return NO; // never hide it
}


@end
