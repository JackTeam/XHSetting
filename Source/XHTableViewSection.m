//
//  XHTableViewSection.m
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "XHTableViewSection.h"
#import "XHTableViewCell.h"

@implementation XHTableViewSection
- (void) addCell:(XHTableViewCellBlock)configurationBlock {
	[self addCell:configurationBlock whenSelected:nil];
}

- (void) addCell:(XHTableViewCellBlock)configurationBlock whenSelected:(XHTableViewCellWhenSelectedBlock)whenSelectedBlock {
	if(!self.staticContentCells) self.staticContentCells = [NSArray array];
    
	XHTableViewCell *staticContentCell = [[XHTableViewCell alloc] init];
    
	staticContentCell.configureBlock = configurationBlock;
	staticContentCell.whenSelectedBlock = whenSelectedBlock;
    
	configurationBlock(staticContentCell, nil, nil);
    
	self.staticContentCells = [self.staticContentCells arrayByAddingObject:staticContentCell];
    
    [self _updateCellIndexPaths];
}

- (void) insertCell:(XHTableViewCellBlock)configurationBlock
	   whenSelected:(XHTableViewCellWhenSelectedBlock)whenSelectedBlock
		atIndexPath:(NSIndexPath *)indexPath
		   animated:(BOOL)animated {
    [self insertCell:configurationBlock whenSelected:whenSelectedBlock atIndexPath:indexPath animated:animated updateView:YES];
}

- (void) insertCell:(XHTableViewCellBlock)configurationBlock
       whenSelected:(XHTableViewCellWhenSelectedBlock)whenSelectedBlock
        atIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated updateView:(BOOL)updateView {
    
	if(!self.staticContentCells) self.staticContentCells = [NSArray array];
    
	NSMutableArray *mutableCells = [self.staticContentCells mutableCopy];
	
	XHTableViewCell *staticContentCell = [[XHTableViewCell alloc] init];
    
	staticContentCell.configureBlock = configurationBlock;
	staticContentCell.whenSelectedBlock = whenSelectedBlock;
    staticContentCell.indexPath = indexPath;
    
	configurationBlock(staticContentCell, nil, indexPath);
    
	[mutableCells insertObject:staticContentCell atIndex:indexPath.row];
    
	self.staticContentCells = [NSArray arrayWithArray:mutableCells];
    
    [self _updateCellIndexPaths];
    
    if (updateView) {
        if(animated) {
            [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        } else {
            [self.tableView reloadData];
        }
    }
}

- (void) addCell:(XHTableViewCellBlock)configurationBlock
        animated:(BOOL)animated {
    
	if(!self.staticContentCells) self.staticContentCells = [NSArray array];
    
	NSMutableArray *mutableCells = [self.staticContentCells mutableCopy];
    
	XHTableViewCell *staticContentCell = [[XHTableViewCell alloc] init];
    
	staticContentCell.configureBlock = configurationBlock;
    staticContentCell.indexPath = [NSIndexPath indexPathForRow:[self.staticContentCells count] inSection:self.sectionIndex];
    
	configurationBlock(staticContentCell, nil, staticContentCell.indexPath);
    
	[mutableCells addObject:staticContentCell];
    
	self.staticContentCells = [NSArray arrayWithArray:mutableCells];
    
	if(animated) {
		[self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:staticContentCell.indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
	} else {
		[self.tableView reloadData];
	}
}

- (void) reloadCellAtIndex:(NSUInteger)rowIndex {
    [self reloadCellAtIndex:rowIndex animated:YES];
}

- (void) reloadCellAtIndex:(NSUInteger)rowIndex animated:(BOOL)animated {
    [self _updateCellIndexPaths];
    
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:rowIndex inSection:self.sectionIndex]]
                          withRowAnimation:animated ? UITableViewRowAnimationAutomatic : UITableViewRowAnimationNone];
}

- (void) removeCellAtIndex:(NSUInteger)rowIndex {
	[self removeCellAtIndex:rowIndex animated:YES];
}
- (void) removeCellAtIndex:(NSUInteger)rowIndex animated:(BOOL)animated {
	NSMutableArray *cells = [self.staticContentCells mutableCopy];
	
	[cells removeObjectAtIndex:rowIndex];
	
	self.staticContentCells = [NSArray arrayWithArray:cells];
    
	if(animated) {
		[self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:rowIndex inSection:self.sectionIndex]]
                              withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [self.tableView performSelector:@selector(reloadData) withObject:nil afterDelay:0.4];
	} else {
		[self.tableView reloadData];
	}
}

- (void) removeAllCells {
	if(self.staticContentCells) {
		self.staticContentCells = nil;
		self.staticContentCells = [NSArray array];
	}
}

- (NSString *) description {
    NSMutableString *str = [NSMutableString stringWithString:@"<XHTableViewSection"];
    
    [str appendFormat:@" sectionIndex='%d'", self.sectionIndex];
    if(self.headerTitle) [str appendFormat:@" headerTitle='%@'", self.headerTitle];
    if(self.footerTitle) [str appendFormat:@" footerTitle='%@'", self.footerTitle];
    
    for(XHTableViewCell *cell in self.staticContentCells) {
        [str appendFormat:@"\n      %@", [cell description]];
    }
    
    [str appendString:@"\n>"];
    
    return [NSString stringWithString:str];
}

- (void) _updateCellIndexPaths {
    NSInteger updatedRowIndex = 0;
    for(XHTableViewCell *cell in self.staticContentCells) {
        cell.indexPath = [NSIndexPath indexPathForRow:updatedRowIndex inSection:self.sectionIndex];
        updatedRowIndex++;
    }
}


@end
