//
//  ThoughtGuide+Create.h
//  WRAssistant
//
//  Created by Kevin Utecht on 8/7/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "ThoughtGuide.h"

@interface ThoughtGuide (Create)

+ (ThoughtGuide *)thoughtGuideWithInfo:(NSString *)title
   inManagedObjectContex:(NSManagedObjectContext *)context;

@end
