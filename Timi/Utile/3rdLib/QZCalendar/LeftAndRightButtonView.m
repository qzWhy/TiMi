//
//  LeftAndRightButtonView.m
//  Timi
//
//  Created by rongbang on 2023/9/21.
// 年月左右箭头切换的组合控件

#import "LeftAndRightButtonView.h"

@interface LeftAndRightButtonView ()

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation LeftAndRightButtonView

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    [self addSubview:self.titleLabel];
    [self addSubview:self.leftBtn];
    [self addSubview:self.rightBtn];
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.equalTo(_titleLabel);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
    }];
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.equalTo(_titleLabel);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.mas_equalTo(self.width*0.5);
        make.bottom.mas_equalTo(0);
    }];
}

- (void)btnClick:(UIButton *)btn {
    NSInteger tag = btn.tag;
    if (self.btnClickBlock) {
        self.btnClickBlock(tag - 100);
    }
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"2023年";
        _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
    }
    return _titleLabel;
}

- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [UIButton new];
        [_leftBtn setImage:[UIImage imageNamed:@"left_blue"] forState:UIControlStateNormal];
        _leftBtn.tag = 100;
        [_leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton new];
        [_rightBtn setImage:[UIImage imageNamed:@"right_blue"] forState:UIControlStateNormal];
        _rightBtn.tag = 101;
        [_rightBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

@end
