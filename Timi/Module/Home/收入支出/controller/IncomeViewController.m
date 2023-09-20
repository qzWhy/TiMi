//
//  IncomeViewController.m
//  Timi
//
//  Created by rongbang on 2023/9/18.
//

#import "IncomeViewController.h"
#import "TopItemView.h"
#import "MyKeyBoardView.h"
@interface IncomeViewController ()
@property (nonatomic, strong) TopItemView *topView;
@property (nonatomic, strong) MyKeyBoardView *btmView;
@end

@implementation IncomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.btmView];
    [_btmView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(UNScreenWidth * 0.625 + SAFEBOTTOMHEIGHT);
    }];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
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
        _btmView.btnClickBlock = ^(NSInteger tag) {
            NSLog(@"---->%ld",tag);
        };
    }
    return _btmView;
}
@end
