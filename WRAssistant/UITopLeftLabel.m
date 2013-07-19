//
//  UITopLeftLabel.m
//  WRAssistant
//
//  Created by Kevin Utecht on 7/16/13.
//  Copyright (c) 2013 kevin utecht. All rights reserved.
//

#import "UITopLeftLabel.h"

@implementation UITopLeftLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)drawTextInRect:(CGRect)rect
{
    CGRect draw = [self textRectForBounds:rect limitedToNumberOfLines:[self numberOfLines]];
    draw.origin = CGPointZero;
    [super drawTextInRect:draw];
}

@end
