//
//  QZCalendarDateViewController.m
//  Timi
//
//  Created by rongbang on 2023/9/20.
//

#import "QZCalendarDateViewController.h"
#import "QZDaysMenView.h"
@interface QZCalendarDateViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) QZDaysMenView *dayView;

@end

@implementation QZCalendarDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmiss)];
    [self.view addGestureRecognizer:tap];
    tap.delegate = self;
    [self setupUI];
}

- (void)setupUI {
    [self.view addSubview:self.dayView];
    [_dayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(8 * 40 + SAFEBOTTOMHEIGHT);
    }];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    CGPoint point = [touch locationInView:self.view];
    if (point.y > self.view.height - 8 * 40 - SAFEBOTTOMHEIGHT) {
        return NO;
    } else {
        return YES;
    }
}

- (void)dissmiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (QZDaysMenView *)dayView {
    if (!_dayView) {
        _dayView = [QZDaysMenView new];
        __weak __typeof(self)weakSelf = self;
        _dayView.selectDateBlock = ^(NSString * _Nonnull year, NSString * _Nonnull month, NSString * _Nonnull day) {
            if (weakSelf.selectDateBlock) {
                weakSelf.selectDateBlock(year, month, day);
            }
            [weakSelf dissmiss];
        };
    }
    return _dayView;
}

@end
