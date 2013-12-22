//
//  RootViewController.m
//  XHSetting
//
//  Created by 曾 宪华 on 13-12-22.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "RootViewController.h"
#import "BaseSettingViewController.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *setting;

@end

@implementation RootViewController

#pragma mark - Propertys

- (NSArray *)setting {
    if (!_setting) {
        _setting = [[NSArray alloc] init];
    }
    return _setting;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark - Left cycle init

- (void)_loadLoginViewControllers {
    dispatch_async(dispatch_queue_create("Load LoginViewControllers", NULL), ^{
        NSMutableArray *setting = [[NSMutableArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"plist"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.setting = setting;
            [self.tableView reloadData];
        });
    });
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self _loadLoginViewControllers];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = NSLocalizedString(@"设置组件", @"");
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  UITableView dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.setting.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *className = [self.setting[indexPath.row] valueForKey:XHKControllerTitleKey];
    cell.textLabel.text = className;
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", className]];
    
    return cell;
}

#pragma mark - UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *settingDictionary = self.setting[indexPath.row];
    
    BaseSettingViewController *baseSettingViewController = [[BaseSettingViewController alloc] init];
    baseSettingViewController.settingDictionary = settingDictionary;
    baseSettingViewController.title = [settingDictionary valueForKey:XHKControllerTitleKey];
    
    [self.navigationController pushViewController:baseSettingViewController animated:YES];
}

@end
