//
//  ContainerViewController.m
//  Timi
//
//  Created by rongbang on 2023/9/18.
// 外部的壳子

#import "ContainerViewController.h"
#import "UNBorderLabel.h"
@interface ContainerViewController ()
@property (nonatomic, strong) UNBorderLabel *titleView;
@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"efe";
    [self setupTitleView];
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
    [self openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (UNBorderLabel *)titleView {
    if (!_titleView) {
        _titleView = [UNBorderLabel new];
    }
    return _titleView;
}
@end
