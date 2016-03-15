//
//  WifiNetwork.h
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WifiNetwork : NSObject

@property (nonatomic, strong) NSString *networkName;
@property (nonatomic) NSUInteger signalStrength; //From 0-3
@property (nonatomic) BOOL secure;

@end
