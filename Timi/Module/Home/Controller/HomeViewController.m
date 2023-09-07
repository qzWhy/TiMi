//
//  HomeViewController.m
//  Timi
//
//  Created by rongbang on 2023/9/5.
//

#import "HomeViewController.h"
#import "QZHomeHeaderView.h"
#import "QZTimeLineCell.h"
#import "UNBorderLabel.h"
#import "HomeTableInsertView.h"
@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) QZHomeHeaderView *headerView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UNBorderLabel *titleView;
@property (nonatomic, strong) HomeTableInsertView *topInsertView;

@end

@implementation HomeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"efe";
    [self setupTitleView];
    self.view.backgroundColor = QZColorRandom;
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.tableView];
    [self.tableView insertSubview:self.topInsertView atIndex:0];
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(_headerView.mas_bottom);
    }];
}

- (void)setupTitleView {
    self.titleView.title = @"当日账单";
    self.navigationItem.titleView = self.titleView;
}

#pragma mark - 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QZTimeLineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QZTimeLineCell"];
    if (!cell) {
        cell = [[QZTimeLineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QZTimeLineCell"];
    }
    return cell;
}

#pragma mark - 懒加载

- (QZHomeHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [QZHomeHeaderView new];
    }
    return _headerView;
}
- (HomeTableInsertView *)topInsertView {
    if (!_topInsertView) {
        _topInsertView = [[HomeTableInsertView alloc] initWithFrame:CGRectMake(0, -100, UNScreenWidth, 100)];
    }
    return _topInsertView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
- (UNBorderLabel *)titleView {
    if (!_titleView) {
        _titleView = [UNBorderLabel new];
    }
    return _titleView;
}
@end
