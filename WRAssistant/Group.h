//
//  Group.h
//  WRAssistant
//
//  Created by Kevin Utecht on 8/6/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Trigger;

@interface Group : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *triggers;
@end

@interface Group (CoreDataGeneratedAccessors)

- (void)addTriggersObject:(Trigger *)value;
- (void)removeTriggersObject:(Trigger *)value;
- (void)addTriggers:(NSSet *)values;
- (void)removeTriggers:(NSSet *)values;

@end
