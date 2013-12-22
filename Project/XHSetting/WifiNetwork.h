//
//  WifiNetwork.h
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WifiNetwork : NSObject

@property (nonatomic, strong) NSString *networkName;
@property (nonatomic) NSUInteger signalStrength; //From 0-3
@property (nonatomic) BOOL secure;

@end
