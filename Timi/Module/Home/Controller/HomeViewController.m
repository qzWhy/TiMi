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
    self.titleView.title = @"日常账单";
    self.navigationItem.titleView = self.titleView;
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 5, 35, 35)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"btn_menu"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [leftView addSubview:leftBtn];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 45)];
    UIButton *rightBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 5, 35, 35)];
    [rightBtn1 setBackgroundImage:[UIImage imageNamed:@"btn_menu"] forState:UIControlStateNormal];
    [rightBtn1 addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:rightBtn1];
    
    UIButton *rightBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 5, 35, 35)];
    [rightBtn2 setBackgroundImage:[UIImage imageNamed:@"btn_menu"] forState:UIControlStateNormal];
    [rightBtn2 addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:rightBtn2];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
}
- (void)rightBtnClick {
    
}
- (void)leftBtnClick {
    NSLog(@"fefef");
}
#pragma mark - scrollview代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point = scrollView.contentOffset;
    CGFloat y = point.y;
    [self.headerView.plusImgView.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
    CGFloat scale = y / 500;
    [UIView animateWithDuration:0 animations:^{
        [self.headerView.plusImgView.layer setTransform:CATransform3DMakeRotation(-(M_PI * 2) * scale, 0, 0, 1)];
    }];
}

#pragma mark - tableview代理
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.headerView.plusImgView.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
    [self.headerView.plusImgView.layer setTransform:CATransform3DMakeRotation(0, 0, 0, 1)];
    NSLog(@"%f",M_PI);
    [UIView animateWithDuration:100 animations:^{
        [self.headerView.plusImgView.layer setTransform:CATransform3DMakeRotation(M_PI_2, 0, 0, 1)];
    }];
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
