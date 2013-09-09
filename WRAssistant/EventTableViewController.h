//
//  EventTableViewController.h
//  EventTableViewController
//
//  Created by Kevin Utecht on 7/30/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

@interface EventTableViewController : UITableViewController

@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;
@property (nonatomic) int wrStep;

@end
