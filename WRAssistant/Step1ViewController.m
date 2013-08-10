//
//  Step1ViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/16/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "Step1ViewController.h"


@interface Step1ViewController ()
@end

@implementation Step1ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)logDateTime
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *log = [[defaults objectForKey:WRConstantsLogKey] mutableCopy];
    if (!log) log = [NSMutableArray array];
    [log addObject:[NSDate date]];
    [defaults setObject:log forKey:WRConstantsLogKey];
    [defaults synchronize];
}

- (IBAction)doneWithInfo:(UIStoryboardSegue *)segue
{
}

- (IBAction)doneWithWeeklyReview:(UIStoryboardSegue *)segue
{
    [self logDateTime];
}

@end
