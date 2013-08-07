//
//  AddThougthGuideViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 8/2/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "AddThoughtGuideViewController.h"

@interface AddThoughtGuideViewController ()
@property (weak, nonatomic) IBOutlet UITextField *thoughtGuideTextField;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@end

@implementation AddThoughtGuideViewController

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
	// Do any additional setup after loading the view.
    self.thoughtGuideTextField.text = nil;
    self.doneButton.enabled = NO;
    [self.thoughtGuideTextField becomeFirstResponder];
    [self.thoughtGuideTextField setDelegate:self];
    [self.thoughtGuideTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)thoughtGuide
{
    return self.thoughtGuideTextField.text;
}

- (void)checkIfDone
{
    if (self.thoughtGuideTextField.text)
    {
        self.doneButton.enabled = YES;
    }
    else
    {
        self.doneButton.enabled = NO;
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)sender
{
    [sender resignFirstResponder];
    [self checkIfDone];
    
    return YES;
}


@end
