//
//  XHBadgeLabel.m
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "XHBadgeLabel.h"

@implementation XHBadgeLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.font = [UIFont boldSystemFontOfSize:10];
        self.textAlignment = UITextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor redColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 7.0;
    }
    return self;
}

- (void)setText:(NSString *)text {
    if (!text)
        return;
    
    [super setText:text];
    CGRect labelFrame = self.frame;
    labelFrame.size.width = [text sizeWithFont:self.font].width + 10;
    labelFrame.size.height = 20;
    self.frame = labelFrame;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
