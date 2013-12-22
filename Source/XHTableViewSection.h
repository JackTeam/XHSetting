//
//  XHTableViewSection.h
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
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
