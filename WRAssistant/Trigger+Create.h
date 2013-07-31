//
//  Trigger+Create.h
//  WRAssistant
//
//  Created by Kevin Utecht on 7/23/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "Trigger.h"


@interface Trigger (Create)

+ (Trigger *)triggerWithInfo:(NSDictionary *)triggerDictionary
       inManagedObjectContex:(NSManagedObjectContext *)context;

@end
