//
//  Group+Create.h
//  WRAssistant
//
//  Created by Kevin Utecht on 7/23/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "Group.h"


@interface Group (Create)

+ (Group *)groupWithInfo:(NSString *)groupTitle
   inManagedObjectContex:(NSManagedObjectContext *)context;

@end
