//
//  XHLoginFooterView.h
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHTableViewBlocks.h"

@interface XHLoginFooterView : UIView
@property (nonatomic, copy) XHTableViewFooterLoginButtonBlock loginBlock;
@property (nonatomic, retain) UIButton *loginButton;
@end
