//
//  WRMacros.h
//  WRAssistant
//
//  Created by Kevin Utecht on 7/31/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#ifndef WRAssistant_WRMacros_h
#define WRAssistant_WRMacros_h

// redefine NSLog so it prefixes message with file and line #
#define NSLog(__FORMAT__, ...) NSLog((@"%s [Line %d] " __FORMAT__), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)


#endif
