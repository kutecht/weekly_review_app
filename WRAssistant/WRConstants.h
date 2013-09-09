//
//  WRConstants.h
//  WRAssistant
//
//  Created by Kevin Utecht on 7/31/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import <Foundation/Foundation.h>

// UserDefaults key strings
extern NSString *const WRConstantsSessionKey; // dictionary of session information
extern NSString *const WRConstantsSessionIdKey;
extern NSString *const WRConstantsSessionFinishKey; // finish date-time
extern NSString *const WRConstantsLogKey; // an array of session information
extern NSString *const WRConstantsStepDurationInMinKey;

// Dictionary strings
extern NSString *const WRConstantsThoughtGuideKey;
extern NSString *const WRConstantsTriggerGroupKey;
extern NSString *const WRConstantsTriggerKey;
extern NSString *const WRConstantsTriggerIdKey;

// CoreData strings
extern NSString *const WRConstantsTriggerGroupEntity;
extern NSString *const WRConstantsTriggerEntity;
extern NSString *const WRConstantsThoughtGuideEntity;
extern NSString *const WRConstantsTriggerListDoc;
extern NSString *const WRConstantsThoughtGuidesDoc;
extern NSString *const WRConstantsRelationshipGroupTitleKey;
extern NSString *const WRConstantsThoughtGuideTitleKey;
extern NSString *const WRConstantsSessionItemEntity;
extern NSString *const WRConstantsSessionItemTitleKey;
extern NSString *const WRConstantsSessionItemsDoc;

// Weekly Revew Steps
extern const unsigned int WRConstantsStep1;
extern const unsigned int WRConstantsStep2;
extern const unsigned int WRConstantsStep3;
extern const unsigned int WRConstantsStep4;
extern const unsigned int WRConstantsStep5;
extern const unsigned int WRConstantsStep6;
extern const unsigned int WRConstantsStep7;
extern const unsigned int WRConstantsStep8;
extern const unsigned int WRConstantsStep9;
extern const unsigned int WRConstantsStep10;
extern const unsigned int WRConstantsStep11;

@interface WRConstants : NSObject

+ (NSArray *)defaultTriggerList;
+ (NSArray *)defaultThoughtGuides;
+ (void)sessionStart;
+ (void)sessionFinish;
+ (NSString *)getCurrentSessionId;

@end
