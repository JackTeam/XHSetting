//
//  NotificationsViewController.m
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
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
