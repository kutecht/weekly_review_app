//
//  WRConstants.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/31/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "WRConstants.h"

// UserDefaults key strings
NSString *const WRConstantsSessionKey = @"weekly_review_assistant.session";
NSString *const WRConstantsSessionIdKey = @"weekly_review_assistant.session.id";
NSString *const WRConstantsSessionStartKey = @"weekly_review_assistant.session.start";
NSString *const WRConstantsSessionFinishKey = @"weekly_review_assistant.session.finish";

NSString *const WRConstantsLogKey = @"weekly_review_assistant.log";
NSString *const WRConstantsStepDurationInMinKey = @"weekly_review_assistant.step_duration";

// Dictionary strings
NSString *const WRConstantsThoughtGuideKey = @"thought_guide";
NSString *const WRConstantsTriggerGroupKey = @"group";
NSString *const WRConstantsTriggerKey = @"trigger";
NSString *const WRConstantsTriggerIdKey = @"trigger_id";

// CoreData strings
NSString *const WRConstantsTriggerGroupEntity = @"Group";
NSString *const WRConstantsTriggerEntity = @"Trigger";
NSString *const WRConstantsThoughtGuideEntity = @"ThoughtGuide";
NSString *const WRConstantsTriggerListDoc = @"TriggerList";
NSString *const WRConstantsThoughtGuidesDoc = @"ThoughtGuides";
NSString *const WRConstantsRelationshipGroupTitleKey = @"group.title";
NSString *const WRConstantsThoughtGuideTitleKey = @"title";

// Trigger group title strings
static NSString *const kTGAdministration = @"Administration";
static NSString *const kTGCommitments = @"Commitments";
static NSString *const kTGCommunications = @"Communications";
static NSString *const kTGCommunity = @"Community";
static NSString *const kTGErrands = @"Errands";
static NSString *const kTGHealth = @"Health";
static NSString *const kTGHousehold = @"Household";
static NSString *const kTGLeisure = @"Leisure";
static NSString *const kTGProfessionalDevelopment = @"Professional development";
static NSString *const kTGUpcomingEvents = @"Upcoming events";

static NSString *const kErrUndefined = @"Err: Undefined!";


@implementation WRConstants

+ (NSArray *)defaultTriggerList
{
    return
    @[// Administration
      @{ WRConstantsTriggerKey: @"budget", WRConstantsTriggerGroupKey: kTGAdministration},
      @{ WRConstantsTriggerKey: @"bills", WRConstantsTriggerGroupKey: kTGAdministration},
      @{ WRConstantsTriggerKey: @"banks", WRConstantsTriggerGroupKey: kTGAdministration},
      @{ WRConstantsTriggerKey: @"investments", WRConstantsTriggerGroupKey: kTGAdministration},
      @{ WRConstantsTriggerKey: @"loans", WRConstantsTriggerGroupKey: kTGAdministration},
      @{ WRConstantsTriggerKey: @"taxes", WRConstantsTriggerGroupKey: kTGAdministration},
      @{ WRConstantsTriggerKey: @"insurance", WRConstantsTriggerGroupKey: kTGAdministration},
      @{ WRConstantsTriggerKey: @"legal affairs", WRConstantsTriggerGroupKey: kTGAdministration},
      @{ WRConstantsTriggerKey: @"filing", WRConstantsTriggerGroupKey: kTGAdministration},
      
      // Commitments
      @{ WRConstantsTriggerKey: @"spouse", WRConstantsTriggerGroupKey: kTGCommitments},
      @{ WRConstantsTriggerKey: @"children", WRConstantsTriggerGroupKey: kTGCommitments},
      @{ WRConstantsTriggerKey: @"family", WRConstantsTriggerGroupKey: kTGCommitments},
      @{ WRConstantsTriggerKey: @"friends", WRConstantsTriggerGroupKey: kTGCommitments},
      @{ WRConstantsTriggerKey: @"boss/partners", WRConstantsTriggerGroupKey: kTGCommitments},
      @{ WRConstantsTriggerKey: @"colleagues", WRConstantsTriggerGroupKey: kTGCommitments},
      @{ WRConstantsTriggerKey: @"subordinates", WRConstantsTriggerGroupKey: kTGCommitments},
      @{ WRConstantsTriggerKey: @"customers", WRConstantsTriggerGroupKey: kTGCommitments},
      @{ WRConstantsTriggerKey: @"professionals", WRConstantsTriggerGroupKey: kTGCommitments},
      
      // Communications
      @{ WRConstantsTriggerKey: @"calls", WRConstantsTriggerGroupKey: kTGCommunications},
      @{ WRConstantsTriggerKey: @"email", WRConstantsTriggerGroupKey: kTGCommunications},
      @{ WRConstantsTriggerKey: @"letters", WRConstantsTriggerGroupKey: kTGCommunications},
      @{ WRConstantsTriggerKey: @"notes", WRConstantsTriggerGroupKey: kTGCommunications},
      
      // Community
      @{ WRConstantsTriggerKey: @"neighborhood", WRConstantsTriggerGroupKey: kTGCommunity},
      @{ WRConstantsTriggerKey: @"schools", WRConstantsTriggerGroupKey: kTGCommunity},
      @{ WRConstantsTriggerKey: @"spiritual organization", WRConstantsTriggerGroupKey: kTGCommunity},
      @{ WRConstantsTriggerKey: @"volunteer activities", WRConstantsTriggerGroupKey: kTGCommunity},
      
      // Errands
      @{ WRConstantsTriggerKey: @"department store", WRConstantsTriggerGroupKey: kTGErrands},
      @{ WRConstantsTriggerKey: @"pharmacy", WRConstantsTriggerGroupKey: kTGErrands},
      @{ WRConstantsTriggerKey: @"market", WRConstantsTriggerGroupKey: kTGErrands},
      @{ WRConstantsTriggerKey: @"mall", WRConstantsTriggerGroupKey: kTGErrands},
      @{ WRConstantsTriggerKey: @"bank", WRConstantsTriggerGroupKey: kTGErrands},
      
      // Health
      @{ WRConstantsTriggerKey: @"doctors", WRConstantsTriggerGroupKey: kTGHealth},
      @{ WRConstantsTriggerKey: @"dentists", WRConstantsTriggerGroupKey: kTGHealth},
      @{ WRConstantsTriggerKey: @"specialists", WRConstantsTriggerGroupKey: kTGHealth},
      @{ WRConstantsTriggerKey: @"checkups", WRConstantsTriggerGroupKey: kTGHealth},
      @{ WRConstantsTriggerKey: @"diet", WRConstantsTriggerGroupKey: kTGHealth},
      @{ WRConstantsTriggerKey: @"exercise", WRConstantsTriggerGroupKey: kTGHealth},
      @{ WRConstantsTriggerKey: @"metrics", WRConstantsTriggerGroupKey: kTGHealth},
      
      // Household
      @{ WRConstantsTriggerKey: @"property", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"taxes", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"heating/air-conditioning", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"plumbing", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"electricity", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"roofing", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"landscape", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"driveway", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"walls/floors/ceilings", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"decor", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"furniture", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"utilities", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"kitchen appliances", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"livingroom appliances", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"laundry room appliances", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"lightbulbs/wiring", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"areas to organize", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"office equipment", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"computer backup", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"sports equipment", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"closets/clothes", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"garage/storage", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"vehicle repair/maintenance", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"tools", WRConstantsTriggerGroupKey: kTGHousehold},
      
      // Leisure
      @{ WRConstantsTriggerKey: @"hobbies", WRConstantsTriggerGroupKey: kTGLeisure},
      @{ WRConstantsTriggerKey: @"books", WRConstantsTriggerGroupKey: kTGLeisure},
      @{ WRConstantsTriggerKey: @"music", WRConstantsTriggerGroupKey: kTGLeisure},
      @{ WRConstantsTriggerKey: @"videos", WRConstantsTriggerGroupKey: kTGLeisure},
      @{ WRConstantsTriggerKey: @"people to visit", WRConstantsTriggerGroupKey: kTGLeisure},
      @{ WRConstantsTriggerKey: @"places to visit", WRConstantsTriggerGroupKey: kTGLeisure},
      
      // Professional Development
      @{ WRConstantsTriggerKey: @"training", WRConstantsTriggerGroupKey: kTGProfessionalDevelopment},
      @{ WRConstantsTriggerKey: @"things to learn", WRConstantsTriggerGroupKey: kTGProfessionalDevelopment},
      @{ WRConstantsTriggerKey: @"things to look up", WRConstantsTriggerGroupKey: kTGProfessionalDevelopment},
      @{ WRConstantsTriggerKey: @"skills to practice/learn", WRConstantsTriggerGroupKey: kTGProfessionalDevelopment},
      @{ WRConstantsTriggerKey: @"resume", WRConstantsTriggerGroupKey: kTGProfessionalDevelopment},
      @{ WRConstantsTriggerKey: @"wardrobe", WRConstantsTriggerGroupKey: kTGProfessionalDevelopment},
      
      // Upcoming Events
      @{ WRConstantsTriggerKey: @"birthdays", WRConstantsTriggerGroupKey: kTGUpcomingEvents},
      @{ WRConstantsTriggerKey: @"anniversaries", WRConstantsTriggerGroupKey: kTGUpcomingEvents},
      @{ WRConstantsTriggerKey: @"weddings", WRConstantsTriggerGroupKey: kTGUpcomingEvents},
      @{ WRConstantsTriggerKey: @"graduations", WRConstantsTriggerGroupKey: kTGUpcomingEvents},
      @{ WRConstantsTriggerKey: @"holidays", WRConstantsTriggerGroupKey: kTGUpcomingEvents},
      @{ WRConstantsTriggerKey: @"travel", WRConstantsTriggerGroupKey: kTGUpcomingEvents},
      @{ WRConstantsTriggerKey: @"vacations", WRConstantsTriggerGroupKey: kTGUpcomingEvents},
      @{ WRConstantsTriggerKey: @"social events", WRConstantsTriggerGroupKey: kTGUpcomingEvents},
      @{ WRConstantsTriggerKey: @"cultural events", WRConstantsTriggerGroupKey: kTGUpcomingEvents},
      @{ WRConstantsTriggerKey: @"sporting events", WRConstantsTriggerGroupKey: kTGUpcomingEvents},
      ];
}

+ (NSArray *)defaultThoughtGuides
{
    return
    @[@{ WRConstantsThoughtGuideKey: @"Any new thought-provoking, creative, risk taking ideas?"},
      @{ WRConstantsThoughtGuideKey: @"What's really got my attention in my job, family, environment?"},
      @{ WRConstantsThoughtGuideKey: @"What good have I done in the past week?"},
      @{ WRConstantsThoughtGuideKey: @"What good shall I do next week?"},
      @{ WRConstantsThoughtGuideKey: @"What didn't work?"},
      @{ WRConstantsThoughtGuideKey: @"What am I greatful for?"},
      @{ WRConstantsThoughtGuideKey: @"Am I reaching my life goals?"}
      ];
}

+ (void)sessionStart
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *session = [[defaults objectForKey:WRConstantsSessionKey] mutableCopy];
    if (!session) session = [NSMutableDictionary dictionary];
    session[WRConstantsSessionStartKey] = [NSDate date];
    session[WRConstantsSessionIdKey] = [[NSUUID UUID] UUIDString];
    [defaults setObject:session forKey:WRConstantsSessionKey];
    [defaults synchronize];
    
    //NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
}

+ (NSString *)getCurrentSessionId
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *session = [[defaults objectForKey:WRConstantsSessionKey] mutableCopy];
    
    if (session)
    {
        return session[WRConstantsSessionIdKey];
    }
    else
    {
        return kErrUndefined;
    }
}

+ (void)sessionFinish
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *log = [[defaults objectForKey:WRConstantsLogKey] mutableCopy];
    NSMutableDictionary *session = [[defaults objectForKey:WRConstantsSessionKey] mutableCopy];
    if (!log) log = [NSMutableArray array];
    if (!session) session = [NSMutableDictionary dictionary];
    session[WRConstantsSessionFinishKey] = [NSDate date];
    [log addObject:session];
    [defaults setObject:log forKey:WRConstantsLogKey];
    [session removeAllObjects];
    [defaults setObject:session forKey:WRConstantsSessionKey];
    [defaults synchronize];
    
    //NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
}

@end

