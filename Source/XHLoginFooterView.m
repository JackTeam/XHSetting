//
//  XHLoginFooterView.m
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "XHLoginFooterView.h"

@implementation XHLoginFooterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 44)];
        [self.loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [self.loginButton setTitle:@"Login now" forState:UIControlStateNormal];
        [self.loginButton setBackgroundColor:[UIColor redColor]];
        [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:self.loginButton];
    }
    return self;
}

- (void)loginButtonClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.loginBlock) {
        self.loginBlock(sender.selected);
    }
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
