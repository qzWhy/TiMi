//
//  QZCalendarDateViewController.m
//  Timi
//
//  Created by rongbang on 2023/9/20.
//

#import "QZCalendarDateViewController.h"
#import "QZDaysMenView.h"
@interface QZCalendarDateViewController ()

@property (nonatomic, strong) QZDaysMenView *dayView;

@end

@implementation QZCalendarDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    [self setupUI];
}

- (void)setupUI {
    [self.view addSubview:self.dayView];
    [_dayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(7 * 40 + SAFEBOTTOMHEIGHT);
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (QZDaysMenView *)dayView {
    if (!_dayView) {
        _dayView = [QZDaysMenView new];
    }
    return _dayView;
}

@end
