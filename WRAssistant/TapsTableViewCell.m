//
//  TapsTableViewCell.m
//  WRAssistant
//
//  Created by Kevin Utecht on 9/3/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "TapsTableViewCell.h"

@implementation TapsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *aTouch = [touches anyObject];
    self.tapCount = [aTouch tapCount];
    [super touchesEnded:touches withEvent:event];
}

@end
