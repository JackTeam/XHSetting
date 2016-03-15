//
//  XHBadgeLabel.m
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
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
