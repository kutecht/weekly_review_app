//
//  Trigger.h
//  WRAssistant
//
//  Created by Kevin Utecht on 7/24/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Group;

@interface Trigger : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * unique;
@property (nonatomic, retain) Group *group;

@end
