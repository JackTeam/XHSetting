//
//  XHSetting.h
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHTableViewBlocks.h"
#import "XHTableViewCell.h"
#import "XHTableViewSection.h"

@interface XHSetting : UITableViewController

@property (nonatomic, strong) NSArray *staticContentSections;
@property (nonatomic, strong) NSString *headerText;
@property (nonatomic, strong) NSString *footerText;
- (void)addLoginButtonWithFooterViewCallBackBlock:(XHTableViewFooterLoginButtonBlock)b;

- (void)addSection:(XHTableViewControllerAddSectionBlock)b;

- (void)insertSection:(XHTableViewControllerAddSectionBlock)b
			   atIndex:(NSUInteger)sectionIndex;

- (void)insertSection:(XHTableViewControllerAddSectionBlock)b
			   atIndex:(NSUInteger)sectionIndex
			  animated:(BOOL)animated;

- (void)insertSection:(XHTableViewControllerAddSectionBlock)b
               atIndex:(NSUInteger)sectionIndex animated:(BOOL)animated
            updateView:(BOOL)updateView;

- (void)removeAllSections;

- (void)removeSectionAtIndex:(NSUInteger)sectionIndex;
- (void)removeSectionAtIndex:(NSUInteger)sectionIndex animated:(BOOL)animated;

- (void)reloadSectionAtIndex:(NSUInteger)sectionIndex;
- (void)reloadSectionAtIndex:(NSUInteger)sectionIndex animated:(BOOL)animated;

- (XHTableViewSection *)sectionAtIndex:(NSUInteger)sectionIndex;

- (void)insertCell:(XHTableViewCellBlock)configurationBlock
		atIndexPath:(NSIndexPath *)indexPath
		   animated:(BOOL)animated;

- (void)insertCell:(XHTableViewCellBlock)configurationBlock
	   whenSelected:(XHTableViewCellWhenSelectedBlock)whenSelectedBlock
		atIndexPath:(NSIndexPath *)indexPath
		   animated:(BOOL)animated;

@end
