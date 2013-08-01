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


// Trigger group strings
NSString *const kTGAdministration = @"Administration";
NSString *const kTGCommitments = @"Commitments";
NSString *const kTGCommunications = @"Communications";
NSString *const kTGCommunity = @"Community";
NSString *const kTGComputers = @"Computers";
NSString *const kTGErrands = @"Errands";
NSString *const kTGHealth = @"Health";
NSString *const kTGHousehold = @"Household";
NSString *const kTGLeisure = @"Leisure";
NSString *const kTGProfessionalDevelopment = @"Professional development";
NSString *const kTGUpcomingEvents = @"Upcoming events";
NSString *const kTGWaitingFor = @"Waiting for";
NSString *const kTGWriting = @"Writing";


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
      @{ WRConstantsTriggerKey: @"other organizations", WRConstantsTriggerGroupKey: kTGCommitments},
      
      // Communications
      @{ WRConstantsTriggerKey: @"calls", WRConstantsTriggerGroupKey: kTGCommunications},
      @{ WRConstantsTriggerKey: @"voice-mail", WRConstantsTriggerGroupKey: kTGCommunications},
      @{ WRConstantsTriggerKey: @"email", WRConstantsTriggerGroupKey: kTGCommunications},
      @{ WRConstantsTriggerKey: @"faxes", WRConstantsTriggerGroupKey: kTGCommunications},
      @{ WRConstantsTriggerKey: @"letters", WRConstantsTriggerGroupKey: kTGCommunications},
      @{ WRConstantsTriggerKey: @"memos", WRConstantsTriggerGroupKey: kTGCommunications},
      @{ WRConstantsTriggerKey: @"notes", WRConstantsTriggerGroupKey: kTGCommunications},
      
      // Community
      @{ WRConstantsTriggerKey: @"neighborhood", WRConstantsTriggerGroupKey: kTGCommunity},
      @{ WRConstantsTriggerKey: @"schools", WRConstantsTriggerGroupKey: kTGCommunity},
      @{ WRConstantsTriggerKey: @"spiritual organization", WRConstantsTriggerGroupKey: kTGCommunity},
      @{ WRConstantsTriggerKey: @"volunteer activities", WRConstantsTriggerGroupKey: kTGCommunity},
      
      // Computers
      @{ WRConstantsTriggerKey: @"software", WRConstantsTriggerGroupKey: kTGComputers},
      @{ WRConstantsTriggerKey: @"hardware", WRConstantsTriggerGroupKey: kTGComputers},
      @{ WRConstantsTriggerKey: @"perform backup", WRConstantsTriggerGroupKey: kTGComputers},
      @{ WRConstantsTriggerKey: @"purge files", WRConstantsTriggerGroupKey: kTGComputers},
      
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
      
      // Household
      @{ WRConstantsTriggerKey: @"property", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"taxes", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"builders/contractors", WRConstantsTriggerGroupKey: kTGHousehold},
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
      @{ WRConstantsTriggerKey: @"sports equipment", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"closets/clothes", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"garage/storage", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"vehicle repair/maintenance", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"tools", WRConstantsTriggerGroupKey: kTGHousehold},
      @{ WRConstantsTriggerKey: @"luggage", WRConstantsTriggerGroupKey: kTGHousehold},
      
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
      
      
      // Waiting-for
      @{ WRConstantsTriggerKey: @"mail", WRConstantsTriggerGroupKey: kTGWaitingFor},
      @{ WRConstantsTriggerKey: @"repairs", WRConstantsTriggerGroupKey: kTGWaitingFor},
      @{ WRConstantsTriggerKey: @"reimbursements", WRConstantsTriggerGroupKey: kTGWaitingFor},
      @{ WRConstantsTriggerKey: @"loaned items", WRConstantsTriggerGroupKey: kTGWaitingFor},
      @{ WRConstantsTriggerKey: @"rsvp's", WRConstantsTriggerGroupKey: kTGWaitingFor},
      
      // Writing
      @{ WRConstantsTriggerKey: @"reports", WRConstantsTriggerGroupKey: kTGWriting},
      @{ WRConstantsTriggerKey: @"evaluations/reviews", WRConstantsTriggerGroupKey: kTGWriting},
      @{ WRConstantsTriggerKey: @"proposals", WRConstantsTriggerGroupKey: kTGWriting},
      @{ WRConstantsTriggerKey: @"articles", WRConstantsTriggerGroupKey: kTGWriting},
      @{ WRConstantsTriggerKey: @"promotional materials", WRConstantsTriggerGroupKey: kTGWriting},
      @{ WRConstantsTriggerKey: @"manuals/instructions", WRConstantsTriggerGroupKey: kTGWriting},
      @{ WRConstantsTriggerKey: @"rewrites and edits", WRConstantsTriggerGroupKey: kTGWriting}
      ];
}

@end

