//
//  NotificationsViewController.m
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "NotificationsViewController.h"

@interface NotificationsViewController ()

@end

@implementation NotificationsViewController

- (id) init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (!self) return nil;
    
    self.title = NSLocalizedString(@"Notifications", @"Notifications");
    
    return self;
}

#pragma mark - View Lifecycle

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.headerText = NSLocalizedString(@"Swipe down from the top of the screen to\nview Notification Center.", @"Swipe down from the top of the screen to\nview Notification Center.");
    
    [self addSection:^(XHTableViewSection *section, NSUInteger sectionIndex) {
        section.headerTitle = NSLocalizedString(@"Sort Apps:", @"Sort Apps":);
        
        [section addCell:^(XHTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            cell.textLabel.text = NSLocalizedString(@"Manually", @"Manually");
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } whenSelected:^(NSIndexPath *indexPath) {
            
        }];
        
        [section addCell:^(XHTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            cell.textLabel.text = NSLocalizedString(@"By Time", @"By Time");
            cell.accessoryType = UITableViewCellAccessoryNone;
        } whenSelected:^(NSIndexPath *indexPath) {
            
        }];
    }];
    
    [self addSection:^(XHTableViewSection *section, NSUInteger sectionIndex) {
        section.headerTitle = NSLocalizedString(@"In Notification Center", @"In Notification Center");
        
        [section addCell:^(XHTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            cell.textLabel.text = NSLocalizedString(@"Weather Widget", @"Weather Widget");
            
            staticContentCell.moveable = YES;
        }];
    }];
    
    [self addSection:^(XHTableViewSection *section, NSUInteger sectionIndex) {
        section.headerTitle = NSLocalizedString(@"Not In Notification Center", @"Not In Notification Center");
    }];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void) viewDidUnload {
    [super viewDidUnload];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
