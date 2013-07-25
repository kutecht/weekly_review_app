//
//  Trigger+Create.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/23/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "Trigger+Create.h"
#import "Group+Create.h"

@implementation Trigger (Create)

+ (Trigger *)triggerWithInfo:(NSDictionary *)triggerDictionary
       inManagedObjectContex:(NSManagedObjectContext *)context
{
    Trigger *trigger = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:TRIGGER_ENTITY];
    
    // sorting
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", [triggerDictionary[TRIGGER_ID_KEY] description]];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1))
    {
        // handle error
        NSLog(@"Error: Trigger fetch match result was unexpected");
    }
    else if (![matches count])
    {
        trigger = [NSEntityDescription insertNewObjectForEntityForName:TRIGGER_ENTITY inManagedObjectContext:context];
        
        trigger.title = [triggerDictionary[TRIGGER_KEY] description];
        trigger.unique = [triggerDictionary[TRIGGER_ID_KEY] description];
        NSString *groupTitle = [triggerDictionary[GROUP_KEY] description];
        Group *group =  [Group groupWithInfo:groupTitle inManagedObjectContex:context];
        trigger.group = group;
    }
    else
    {
        trigger = [matches lastObject];
    }
    
    return trigger;
}


@end
