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
#import "AddItemView.h"
#import "RemarkViewController.h"

@interface IncomeViewController ()
/**上方显示条**/
@property (nonatomic, strong) TopItemView *topView;
/**下方键盘**/
@property (nonatomic, strong) MyKeyBoardView *btmView;
/**工具条**/
@property (nonatomic, strong) ToolBarView *toolBarView;
/**选择类型**/
@property (nonatomic, strong) AddItemView *middleView;
@property (nonatomic, strong) NSDate *date;
@end

@implementation IncomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.btmView];
    [self.view addSubview:self.toolBarView];
    [self.view addSubview:self.middleView];

    self.date = [NSDate date];

    [_middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_bottom);
        make.bottom.equalTo(_toolBarView.mas_top);
        make.left.right.mas_equalTo(0);
    }];
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
- (void)toolBarViewSideBtnClickWithTag:(NSInteger)tag {
    if (tag == 1) {
        QZCalendarDateViewController *vc = [QZCalendarDateViewController new];
        vc.date = self.date;
        
        vc.selectDateBlock = ^(NSString * _Nonnull year, NSString * _Nonnull month, NSString * _Nonnull day, NSDate *date) {
            self.toolBarView.yearStr = year;
            self.toolBarView.dayStr = [NSString stringWithFormat:@"%@%@",month,day];
            self.date = date;
        };
        vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
        [self presentViewController:vc animated:NO completion:nil];
    } else {
        RemarkViewController *vc = [RemarkViewController new];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
            
        [self hh_presentViewController:nav presentStyle:HHPresentStyleSlipFromBottom completion:nil];
    }
}

- (void)chooseItemType:(ItemModel *)model isLast:(BOOL)isLast {
    if (isLast) {//进入编辑页
        
    } else {
        self.topView.model = model;
    }
}

- (ToolBarView *)toolBarView {
    if (!_toolBarView) {
        _toolBarView = [ToolBarView new];
        weakself(self);
        _toolBarView.btnClickBlock = ^(NSInteger tag) {
            [weakSelf toolBarViewSideBtnClickWithTag:tag];
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
- (AddItemView *)middleView {
    if (!_middleView) {
        _middleView = [AddItemView new];
        weakself(self);
        _middleView.selectItemBlock = ^(ItemModel * _Nonnull model, BOOL isLast) {
            [weakSelf chooseItemType:model isLast:isLast];
        };
    }
    return _middleView;
}
@end
