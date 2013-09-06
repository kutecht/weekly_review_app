//
//  WRStepViewController.h
//  WRAssistant
//
//  Created by Kevin Utecht on 7/16/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeCountdown.h"

@interface WRStepViewController : UIViewController <TimeCountdownDelegate>

- (void)pause;

@end
