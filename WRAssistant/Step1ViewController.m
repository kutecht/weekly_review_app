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
    
    [WRConstants sessionStart];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self pause];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doneWithInfo:(UIStoryboardSegue *)segue
{
}

- (IBAction)doneWithWeeklyReview:(UIStoryboardSegue *)segue
{
}

@end
