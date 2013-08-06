//
//  AddTriggerViewController.h
//  WRAssistant
//
//  Created by Kevin Utecht on 8/5/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTriggerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

// init sections prior to loading (preferrably in prepareForSegue)
@property (nonatomic, strong) NSArray *sections;

// resulting added trigger information
@property (nonatomic, readonly) NSString *trigger;
@property (nonatomic, readonly) NSString *section;

@end
