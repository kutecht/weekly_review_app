//
//  AddTriggerViewController.m
//  WRAssistant
//
//  Created by Kevin Utecht on 8/5/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "AddTriggerViewController.h"

@interface AddTriggerViewController ()
@property (weak, nonatomic) IBOutlet UITextField *triggerTextField;
@property (weak, nonatomic) IBOutlet UITextField *sectionTextField;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (nonatomic, strong) UIPickerView *pickerView;
@end


@implementation AddTriggerViewController

- (UIPickerView *)pickerView
{
    if (!_pickerView)
    {
        _pickerView = [[UIPickerView alloc] init];
    }
    
    return _pickerView;
}

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

    self.triggerTextField.text = nil;
    self.sectionTextField.text = nil;
    self.doneButton.enabled = NO;
    [self.triggerTextField becomeFirstResponder];
    [self.triggerTextField setDelegate:self];
    [self.sectionTextField setDelegate:self];
    [self.pickerView setDataSource:self];
    [self.pickerView setDelegate:self];    
    [self.sectionTextField setInputAccessoryView:self.pickerView];
}

- (NSString *)trigger
{
    return self.triggerTextField.text;
}

- (NSString *)section
{
    return self.sectionTextField.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Number of components.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// Total rows in our component.
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.triggerGroups count];
}

// Display each row's data.
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [[self.triggerGroups objectAtIndex:row] name];
}

- (void)checkIfDone
{
    if (self.triggerTextField.text && self.sectionTextField)
    {
        self.doneButton.enabled = YES;
    }
    else
    {
        self.doneButton.enabled = NO;
    }
}


// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.sectionTextField.text = [[self.triggerGroups objectAtIndex:row] name];
    [self.sectionTextField resignFirstResponder];
    [self checkIfDone];
}

- (BOOL)textFieldShouldReturn:(UITextField *)sender
{
    [sender resignFirstResponder];
    [self checkIfDone];
    
    return YES;
}



@end
