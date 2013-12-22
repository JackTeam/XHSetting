//
//  XHTableViewCell.m
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
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
