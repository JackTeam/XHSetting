//
//  XHTableViewBlocks.h
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import <Foundation/Foundation.h>

@class XHTableViewSection, XHTableViewCell;

typedef void(^XHTableViewCellBlock)(XHTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath);
typedef void(^XHTableViewCellWhenSelectedBlock)(NSIndexPath *indexPath);

typedef void(^XHTableViewControllerAddSectionBlock)(XHTableViewSection *section, NSUInteger sectionIndex);

typedef void(^XHTableViewFooterLoginButtonBlock)(BOOL selected);