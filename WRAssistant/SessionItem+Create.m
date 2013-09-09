//
//  SessionItem+Create.m
//  WRAssistant
//
//  Created by Kevin Utecht on 9/6/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "SessionItem+Create.h"

@implementation SessionItem (Create)

+ (void)saveData:(NSString *)sessionId forStep:(int)step withTitles:(NSArray *)titles inManagedObjectContex:(NSManagedObjectContext *)context
{
    for (id title in titles)
    {
        if ([title isKindOfClass:[NSString class]])
        {
            SessionItem *item = [NSEntityDescription insertNewObjectForEntityForName:WRConstantsSessionItemEntity
                                                              inManagedObjectContext:context];
            item.title = (NSString *)title;
            item.session_id = sessionId;
            item.step = @(step);
            NSLog("**** ADDING SESSION ITEM: %@ - %d - %@", item.session_id, [item.step intValue], item.title);
        }
    }
}

+ (void)createSessionItems:(NSString *)sessionId forStep:(int)step withTitles:(NSArray *)titles
{
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    url = [url URLByAppendingPathComponent:WRConstantsSessionItemsDoc];
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:url];

    if (![[NSFileManager defaultManager] fileExistsAtPath:[url path]])
    {
        // create trigger list document
        [document saveToURL:url forSaveOperation:UIDocumentSaveForCreating
          completionHandler:^(BOOL success) {
              if (success)
              {
                  [self saveData:sessionId forStep:step withTitles:titles inManagedObjectContex:document.managedObjectContext];
              }
          }];
    }
    else if (document.documentState == UIDocumentStateClosed)
    {
        // open it
        [document openWithCompletionHandler:^(BOOL success) {
            if (success)
            {
                [self saveData:sessionId forStep:step withTitles:titles inManagedObjectContex:document.managedObjectContext];
            }
        }];
    }
    else
    {
        // try to us it
        [self saveData:sessionId forStep:step withTitles:titles inManagedObjectContex:document.managedObjectContext];
    }
}

+ (int)sessionItemsCount:(NSString *)sessionId inManagedObjectContex:(NSManagedObjectContext *)context
{
    int count = 0;

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:WRConstantsSessionItemEntity];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:WRConstantsSessionItemTitleKey ascending:YES
                                                               selector:@selector(localizedCaseInsensitiveCompare:)]];
    request.predicate = [NSPredicate predicateWithFormat:@"session_id = %@", sessionId];

    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    NSLog(@"HERE 100");
    if (matches)
    {
        NSLog(@"HERE 200: %d", [matches count]);
        count = [matches count];
    }
    
    return count;
}

@end
