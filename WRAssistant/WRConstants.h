//
//  WRConstants.h
//  WRAssistant
//
//  Created by Kevin Utecht on 7/31/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import <Foundation/Foundation.h>

// UserDefaults key strings
extern NSString *const WRConstantsLogKey;
extern NSString *const WRConstantsStepDurationInMinKey;

// Trigger list dictionary strings
extern NSString *const WRConstantsTriggerGroupKey;
extern NSString *const WRConstantsTriggerKey;
extern NSString *const WRConstantsTriggerIdKey;

// Trigger list CoreData strings
extern NSString *const WRConstantsTriggerGroupEntity;
extern NSString *const WRConstantsTriggerEntity;
extern NSString *const WRConstantsTriggerListDoc;
extern NSString *const WRConstantsRelationshipGroupTitleKey;

// Segue strings
extern NSString *const WRConstantsSegueShowEventViewController;
extern NSString *const WRConstantsSegueShowPastEvents;
extern NSString *const WRConstantsSegueShowFutureEvents;

// Table cell identifier strings
extern NSString *const WRConstantsTriggerCellId;
extern NSString *const WRConstantsEventCellId;
extern NSString *const WRConstantsLogDateCellId;
extern NSString *const WRConstantsReminderCellId;

// Calendar event fetching constants
extern unsigned int const WRConstantsPastEventsInWeeks;
extern unsigned int const WRConstantsFutureEventsInWeeks;


@interface WRConstants : NSObject

+ (NSArray *)defaultTriggerList;

@end
