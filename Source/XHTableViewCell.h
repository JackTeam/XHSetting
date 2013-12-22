//
//  XHTableViewCell.h
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XHTableViewBlocks.h"

@interface XHTableViewCell : NSObject

@property (nonatomic, strong) NSString *reuseIdentifier;
@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic) CGFloat cellHeight;
@property (nonatomic) UITableViewCellStyle cellStyle;
@property (nonatomic, strong) Class tableViewCellSubclass;
@property (nonatomic) UITableViewCellEditingStyle editingStyle; // Defaults to 'UITableViewCellEditingStyleNone'
@property (nonatomic) BOOL editable; // Defaults to 'NO'
@property (nonatomic) BOOL moveable; // Defaults to 'NO'

@property (nonatomic, copy) XHTableViewCellBlock configureBlock;
@property (nonatomic, copy) XHTableViewCellWhenSelectedBlock whenSelectedBlock;

- (void)setWhenSelectedBlock:(XHTableViewCellWhenSelectedBlock)whenSelectedBlock;

@end
