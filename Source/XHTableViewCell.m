//
//  XHTableViewCell.m
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHTableViewCell.h"

@implementation XHTableViewCell

- (id) init {
	self = [super init];
	if(!self) return nil;
    
	self.cellHeight = UITableViewAutomaticDimension;
	self.tableViewCellSubclass = [UITableViewCell class];
	self.cellStyle = UITableViewCellStyleDefault;
	self.reuseIdentifier = @"DefaultCell";
    
    self.editingStyle = UITableViewCellEditingStyleNone;
    self.editable = NO;
    self.moveable = NO;
    
	return self;
}

- (NSString *) description {
    NSMutableString *str = [NSMutableString stringWithString:@"<XHTableViewCell"];
    
    [str appendFormat:@" reuseIdentifier='%@'", self.reuseIdentifier];
    [str appendFormat:@" tableViewCellSubclass='%@'", self.tableViewCellSubclass];
    [str appendFormat:@" cellHeight='%f'", self.cellHeight];
    
    [str appendString:@">"];
    
    return [NSString stringWithString:str];
}

@end
