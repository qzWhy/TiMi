//
//  IncomeViewController.m
//  Timi
//
//  Created by rongbang on 2023/9/18.
//

#import "IncomeViewController.h"
#import "TopItemView.h"
#import "MyKeyBoardView.h"
#import "QZCalendarDateViewController.h"
#import "ToolBarView.h"
@interface IncomeViewController ()
@property (nonatomic, strong) TopItemView *topView;
@property (nonatomic, strong) MyKeyBoardView *btmView;
@property (nonatomic, strong) ToolBarView *toolBarView;
@property (nonatomic, strong) NSDate *date;
@end

@implementation IncomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.btmView];
    [self.view addSubview:self.toolBarView];
    self.date = [NSDate date];
    [_toolBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_btmView.mas_top);
        make.height.mas_equalTo(UNScreenWidth * 0.125);
        make.left.right.mas_equalTo(0);
    }];
    [_btmView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(UNScreenWidth * 0.5 + SAFEBOTTOMHEIGHT);
    }];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
}

- (ToolBarView *)toolBarView {
    if (!_toolBarView) {
        _toolBarView = [ToolBarView new];
        weakself(self);
        _toolBarView.btnClickBlock = ^(NSInteger tag) {
            if (tag == 1) {
                QZCalendarDateViewController *vc = [QZCalendarDateViewController new];
                vc.date = weakSelf.date;
                vc.selectDateBlock = ^(NSString * _Nonnull year, NSString * _Nonnull month, NSString * _Nonnull day, NSDate *date) {
                    weakSelf.toolBarView.yearStr = year;
                    weakSelf.toolBarView.dayStr = [NSString stringWithFormat:@"%@%@",month,day];
                    weakSelf.date = date;
                };
                vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
                [weakSelf presentViewController:vc animated:NO completion:nil];
            }
        };
    }
    return _toolBarView;
}

- (TopItemView *)topView {
    if (!_topView) {
        _topView = [TopItemView new];
    }
    return _topView;
}

- (MyKeyBoardView *)btmView {
    if (!_btmView) {
        _btmView = [MyKeyBoardView new];
        weakself(self);
        _btmView.numberClickBackBlock = ^(NSString * _Nonnull str, BOOL isOK) {
            if (isOK) {
                [weakSelf dismissViewControllerAnimated:YES completion:nil];
            }
            weakSelf.topView.str = str;
        };
    }
    return _btmView;
}
@end
