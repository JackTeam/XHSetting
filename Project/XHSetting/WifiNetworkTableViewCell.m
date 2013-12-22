//
//  WifiNetworkTableViewCell.m
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "WifiNetworkTableViewCell.h"

@implementation WifiNetworkTableViewCell

- (id) init {
	self = [super init];
	if(!self) return nil;
    
	self.connectingActivityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
	self.selectedCheckmarkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"UIPreferencesBlueCheck.png"]];
	self.selectedCheckmarkImageView.frame = CGRectMake(0.0, 0.0, 14.0, 14.0);
    
	[self.contentView addSubview:self.connectingActivityIndicatorView];
	[self.contentView addSubview:self.selectedCheckmarkImageView];
    
	return self;
}

- (void) layoutSubviews {
	[super layoutSubviews];
    
	self.connectingActivityIndicatorView.frame = CGRectMake(5.0, 10.0, 15.0, 15.0);
	self.selectedCheckmarkImageView.frame = CGRectMake(200.0, 10.0, 14.0, 14.0);
    
	[self.contentView bringSubviewToFront:self.selectedCheckmarkImageView];
}

@end
