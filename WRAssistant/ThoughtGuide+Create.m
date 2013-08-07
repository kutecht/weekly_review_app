//
//  ThoughtGuide+Create.m
//  WRAssistant
//
//  Created by Kevin Utecht on 8/7/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "ThoughtGuide+Create.h"

@implementation ThoughtGuide (Create)

+ (ThoughtGuide *)thoughtGuideWithInfo:(NSString *)title
                 inManagedObjectContex:(NSManagedObjectContext *)context
{
    ThoughtGuide *thoughtGuide = nil;
    
    if (title.length)
    {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:WRConstantsThoughtGuideEntity];
        
        // sorting
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title"
                                                                  ascending:YES
                                                                   selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = [NSPredicate predicateWithFormat:@"title = %@", title];
        
        NSError *error = nil;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || ([matches count] > 1))
        {
            // handle error
            NSLog(@"Error: Thought group fetch match result was unexpected");
        }
        else if (![matches count])
        {
            thoughtGuide = [NSEntityDescription insertNewObjectForEntityForName:WRConstantsThoughtGuideEntity inManagedObjectContext:context];
            thoughtGuide.title = title;
        }
        else
        {
            thoughtGuide = [matches lastObject];
        }
    }
    
    return thoughtGuide;
    
}

@end
