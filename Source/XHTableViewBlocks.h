//
//  XHTableViewBlocks.h
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XHTableViewSection, XHTableViewCell;

typedef void(^XHTableViewCellBlock)(XHTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath);
typedef void(^XHTableViewCellWhenSelectedBlock)(NSIndexPath *indexPath);

typedef void(^XHTableViewControllerAddSectionBlock)(XHTableViewSection *section, NSUInteger sectionIndex);

typedef void(^XHTableViewFooterLoginButtonBlock)(BOOL selected);