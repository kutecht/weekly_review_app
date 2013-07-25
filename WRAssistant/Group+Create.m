//
//  Group+Create.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/23/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "Group+Create.h"

@implementation Group (Create)

+ (Group *)groupWithInfo:(NSString *)groupTitle
   inManagedObjectContex:(NSManagedObjectContext *)context
{
    Group *group = nil;
 
    if (groupTitle.length)
    {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:GROUP_ENTITY];
        
        // sorting
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title"
                                                                  ascending:YES
                                                                   selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = [NSPredicate predicateWithFormat:@"title = %@", groupTitle];
        
        NSError *error = nil;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || ([matches count] > 1))
        {
            // handle error
            NSLog(@"Error: Group fetch match result was unexpected");
        }
        else if (![matches count])
        {
            group = [NSEntityDescription insertNewObjectForEntityForName:GROUP_ENTITY inManagedObjectContext:context];
            group.title = groupTitle;
        }
        else
        {
            group = [matches lastObject];
        }
    }
    
    return group;
}


@end
