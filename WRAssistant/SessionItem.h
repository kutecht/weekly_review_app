//
//  SessionItem.h
//  WRAssistant
//
//  Created by Kevin Utecht on 9/5/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SessionItem : NSManagedObject

@property (nonatomic, retain) NSString * session_id;
@property (nonatomic, retain) NSString * step;
@property (nonatomic, retain) NSString * title;

@end
