//
//  WRConstants.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/31/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "WRConstants.h"

// UserDefaults key strings
NSString *const WRConstantsLogKey = @"weekly_review_assistant.log";
NSString *const WRConstantsStepDurationInMinKey = @"step_duration";


// Trigger list dictionary strings
NSString *const WRConstantsTriggerGroupKey = @"group";
NSString *const WRConstantsTriggerKey = @"trigger";
NSString *const WRConstantsTriggerIdKey = @"trigger_id";


// Trigger list CoreData strings
NSString *const WRConstantsTriggerGroupEntity = @"Group";
NSString *const WRConstantsTriggerEntity = @"Trigger";
NSString *const WRConstantsTriggerListDoc = @"TriggerList";
NSString *const WRConstantsRelationshipGroupTitleKey = @"group.title";

// Segues
NSString *const WRConstantsSegueShowEventViewController = @"showEventViewController";
NSString *const WRConstantsSegueShowPastEvents = @"showPastEvents";
NSString *const WRConstantsSegueShowFutureEvents = @"showFutureEvents";

// Table cell identifier strings
NSString *const WRConstantsTriggerCellId = @"TriggerCell";
NSString *const WRConstantsEventCellId = @"EventCell";
NSString *const WRConstantsLogDateCellId = @"LogDateCell";
NSString *const WRConstantsReminderCellId = @"ReminderCell";

// Calendar event fetching constants
unsigned int const WRConstantsPastEventsInWeeks = -3;
unsigned int const WRConstantsFutureEventsInWeeks = 2;

