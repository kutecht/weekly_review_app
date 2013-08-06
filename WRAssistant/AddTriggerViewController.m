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
@property (nonatomic, strong) UIPickerView *pickerView;
@end


@implementation AddTriggerViewController

- (UIPickerView *)pickerView
{
    if (!_pickerView)
    {
        _pickerView = [[UIPickerView alloc] init];
#if 0
    initWithFrame:CGRectMake(0.0f, 480.0f, 320.0f, 270.0f)];
#endif
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
    [self.triggerTextField becomeFirstResponder];
    [self.triggerTextField setDelegate:self];
    [self.sectionTextField setDelegate:self];
    self.sectionTextField.text = nil;
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
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.sections count];
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [[self.sections objectAtIndex:row] name];
}

// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"You selected this: %@", [[self.sections objectAtIndex:row] name]);
    self.sectionTextField.text = [[self.sections objectAtIndex:row] name];
    [self.sectionTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)sender
{
    [sender resignFirstResponder];
    
    return YES;
}



@end
