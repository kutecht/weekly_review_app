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


@interface WRConstants : NSObject

+ (NSArray *)defaultTriggerList;
+ (NSArray *)defaultThoughtGuides;
+ (void)logDateTime;

@end
