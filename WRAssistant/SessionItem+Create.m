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

+ (void)deleteData:(NSString *)sessionId forStep:(int)step inManagedObjectContex:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:WRConstantsSessionItemEntity];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:WRConstantsSessionItemTitleKey ascending:YES
                                                               selector:@selector(localizedCaseInsensitiveCompare:)]];
    request.predicate = [NSPredicate predicateWithFormat:@"session_id = %@ AND step = %d", sessionId, step];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    for (NSManagedObject *managedObject in matches)
    {
        [context deleteObject:managedObject];
    }
}


+ (void)deleteSessionItems:(NSString *)sessionId forStep:(int)step
{
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    url = [url URLByAppendingPathComponent:WRConstantsSessionItemsDoc];
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:url];
    
    if (document.documentState == UIDocumentStateClosed)
    {
        // open it
        [document openWithCompletionHandler:^(BOOL success) {
            if (success)
            {
                [self deleteData:sessionId forStep:step inManagedObjectContex:document.managedObjectContext];
            }
        }];
    }
    else
    {
        // try to us it
        [self deleteData:sessionId forStep:step inManagedObjectContex:document.managedObjectContext];
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
    
    if (matches)
    {
        count = (int)[matches count];
    }
    
    return count;
}

@end
