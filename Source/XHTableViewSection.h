//
//  XHTableViewSection.h
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XHTableViewBlocks.h"

@interface XHTableViewSection : NSObject

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray *staticContentCells;
@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *footerTitle;

@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) UIView *headerView;

@property (nonatomic) NSInteger sectionIndex;

- (void)addCell:(XHTableViewCellBlock)configurationBlock;

- (void)addCell:(XHTableViewCellBlock)configurationBlock
   whenSelected:(XHTableViewCellWhenSelectedBlock)whenSelectedBlock;

- (void)addCell:(XHTableViewCellBlock)configurationBlock
       animated:(BOOL)animated;

- (void)insertCell:(XHTableViewCellBlock)configurationBlock
      whenSelected:(XHTableViewCellWhenSelectedBlock)whenSelectedBlock
       atIndexPath:(NSIndexPath *)indexPath
          animated:(BOOL)animated;

- (void)insertCell:(XHTableViewCellBlock)configurationBlock
      whenSelected:(XHTableViewCellWhenSelectedBlock)whenSelectedBlock
       atIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated updateView:(BOOL)updateView;

- (void)reloadCellAtIndex:(NSUInteger)rowIndex;
- (void)reloadCellAtIndex:(NSUInteger)rowIndex animated:(BOOL)animated;

- (void)removeAllCells;
- (void)removeCellAtIndex:(NSUInteger)rowIndex;
- (void)removeCellAtIndex:(NSUInteger)rowIndex animated:(BOOL)animated;

@end
