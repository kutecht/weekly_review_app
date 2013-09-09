//
//  SessionItem+Create.h
//  WRAssistant
//
//  Created by Kevin Utecht on 9/6/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "SessionItem.h"

@interface SessionItem (Create)

+ (void)createSessionItems:(NSString *)sessionId forStep:(int)step withTitles:(NSArray *)titles;

@end
