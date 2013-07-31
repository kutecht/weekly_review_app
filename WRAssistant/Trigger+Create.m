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
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:WRConstantsTriggerEntity];
    
    // sorting
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", [triggerDictionary[WRConstantsTriggerIdKey] description]];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1))
    {
        // handle error
        NSLog(@"Error: Trigger fetch match result was unexpected");
    }
    else if (![matches count])
    {
        trigger = [NSEntityDescription insertNewObjectForEntityForName:WRConstantsTriggerEntity inManagedObjectContext:context];
        
        trigger.title = [triggerDictionary[WRConstantsTriggerKey] description];
        trigger.unique = [[NSUUID UUID] UUIDString];
        NSString *groupTitle = [triggerDictionary[WRConstantsTriggerGroupKey] description];
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
