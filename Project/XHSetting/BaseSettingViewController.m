//
//  BaseSettingViewController.m
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "BaseSettingViewController.h"
#import "WifiViewController.h"
#import "NotificationsViewController.h"

#import "XHBadgeLabel.h"

@interface BaseSettingViewController ()

@end

@implementation BaseSettingViewController

- (NSDictionary *)settingDictionary {
    if (!_settingDictionary) {
        _settingDictionary = [[NSDictionary alloc] init];
    }
    return _settingDictionary;
}

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    __unsafe_unretained __block BaseSettingViewController *safeSelf = self;
    
    for (NSString *key in self.settingDictionary) {
        if ([key isEqualToString:XHKSectionsKey]) {
            NSArray *sections = [self.settingDictionary valueForKey:key];
            for (NSDictionary *sectionDictionary in sections) {
                [self addSection:^(XHTableViewSection *section, NSUInteger sectionIndex) {
                    for (NSString *sectionKey in sectionDictionary) {
                        if ([sectionKey isEqualToString:XHKSectionHeaderTitleKey]) {
                            NSString *sectionHeaderTitle = [sectionDictionary valueForKey:XHKSectionHeaderTitleKey];
                            if (sectionHeaderTitle) {
                                section.headerTitle = sectionHeaderTitle;
                            }
                        } else if ([sectionKey isEqualToString:XHKSectionFooterTitleKey]) {
                            NSString *sectionFooterTitle = [sectionDictionary valueForKey:XHKSectionFooterTitleKey];
                            if (sectionFooterTitle) {
                                section.footerTitle = sectionFooterTitle;
                            }
                        } else if ([sectionKey isEqualToString:XHKRowsKey]) {
                            NSArray *rows = [sectionDictionary valueForKey:XHKRowsKey];
                            if (rows.count) {
                                for (NSDictionary *rowDictionary in rows) {
                                    NSString *text = [rowDictionary valueForKey:XHKTextKey];
                                    if (text) {
                                        [section addCell:^(XHTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
                                            NSString *subTitle = [rowDictionary valueForKey:XHKSubTitleKey];
                                            if (subTitle) {
                                                staticContentCell.cellStyle = UITableViewCellStyleValue1;
                                                cell.detailTextLabel.text = subTitle;
                                                staticContentCell.reuseIdentifier = @"SubDetailTextCell";
                                            } else {
                                                staticContentCell.cellStyle = UITableViewCellStyleDefault;
                                                staticContentCell.reuseIdentifier = @"DetailTextCell";
                                            }
                                            
                                            
                                            cell.textLabel.text = text;
                                            
                                            NSString *userAvatarImageName = [rowDictionary valueForKey:XHKUserAvatarImageNameKey];
                                            if (userAvatarImageName) {
                                                cell.imageView.image = [UIImage imageNamed:userAvatarImageName];
                                            }
                                            
                                            for (NSString *rowKey in rowDictionary) {
                                                if ([rowKey isEqualToString:XHKAccessoryViewTextKey]) {
                                                    NSString *accessoryViewText = [rowDictionary valueForKey:rowKey];
                                                    if (accessoryViewText) {
                                                        XHBadgeLabel *badgeLabel = [[XHBadgeLabel alloc] initWithFrame:CGRectZero];
                                                        badgeLabel.text = accessoryViewText;
                                                        cell.accessoryView = badgeLabel;
                                                    }
                                                }
                                            }
                                            
                                            BOOL isSwitch = [[rowDictionary valueForKey:XHKSwitchKey] boolValue];
                                            if (isSwitch) {
                                                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                                                
                                                UISwitch *customSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
                                                cell.accessoryView = customSwitch;
                                            }
                                            
                                        } whenSelected:^(NSIndexPath *indexPath) {
                                            for (NSString *rowKey in rowDictionary) {
                                                if ([rowKey isEqualToString:XHKTextKey]) {
                                                    NSString *text = [rowDictionary valueForKey:rowKey];
                                                    if ([text isEqualToString:XHKWifiKey]) {
                                                        [safeSelf.navigationController pushViewController:[[WifiViewController alloc] init] animated:YES];
                                                    } else if ([text isEqualToString:XHKNotificationsKey]) {
                                                        [safeSelf.navigationController pushViewController:[[NotificationsViewController alloc] init] animated:YES];
                                                    }
                                                }
                                            }
                                        }];
                                    }
                                }
                            }
                        }
                    }
                }];
            }
        } else if ([key isEqualToString:XHKLoginButtonDisplayKey]) {
            BOOL disPlayLoginButton = [[self.settingDictionary valueForKey:key] boolValue];
            if (disPlayLoginButton) {
                [self addLoginButtonWithFooterViewCallBackBlock:^(BOOL selected) {
                    NSLog(@"selected : %d", selected);
                }];
            }
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
