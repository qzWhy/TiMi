//
//  QZHomeHeaderView.m
//  Timi
//
//  Created by rongbang on 2023/9/6.
//

#import "QZHomeHeaderView.h"
#import "UIView+Exention.h"
@interface QZHomeHeaderView ()
@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIView *plusView;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *leftSubLabel;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) UILabel *rightSubLabel;
@end

@implementation QZHomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    self.backgroundColor = UIColor.whiteColor;
    [self addSubview:self.bgImageView];
    [self addSubview:self.coverView];
    [self addSubview:self.plusView];
    [self.plusView addSubview:self.plusImgView];
    [self addSubview:self.line];
    [self addSubview:self.leftLabel];
    [self addSubview:self.leftSubLabel];
    [self addSubview:self.rightLabel];
    [self addSubview:self.rightSubLabel];
    [self drawCircle];
    
    [_rightSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rightLabel.mas_bottom).offset(5);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(15);
    }];
    [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(15);
        make.top.equalTo(_bgImageView.mas_bottom).offset(10);
    }];
    [_leftSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_leftLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(15);
    }];
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(15);
        make.top.equalTo(_bgImageView.mas_bottom).offset(10);
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.equalTo(self);
        make.height.mas_equalTo(10);
        make.width.mas_equalTo(0.5);
    }];
    [_plusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_bgImageView.mas_bottom).offset(-50);
        make.bottom.equalTo(_line.mas_top);
        make.width.height.mas_equalTo(100);
        make.centerX.equalTo(self);
    }];
    [_plusImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(_plusView);
        make.width.height.mas_equalTo(96);
    }];
    [_coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(175);
    }];
    [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(175);
    }];
}

- (void)drawCircle {
    [UIView drawCircleWithView:self.plusView corner:100];
}

- (void)rotate {
    [self.plusImgView.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
    [self.plusImgView.layer setTransform:CATransform3DMakeRotation(0, 0, 0, 1)];
    [UIView animateWithDuration:0.5 animations:^{
        [self.plusImgView.layer setTransform:CATransform3DMakeRotation(M_PI_2, 0, 0, 1)];
    } completion:^(BOOL finished) {
        if (self.addBtnClickBlock) {
            self.addBtnClickBlock();
        }
    }];
}

#pragma mark - 懒加载
- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [UIImageView new];
        _bgImageView.image = [UIImage imageNamed:@"background8"];
    }
    return _bgImageView;
}
- (UIImageView *)plusImgView {
    if (!_plusImgView) {
        _plusImgView = [UIImageView new];
        _plusImgView.image = [UIImage imageNamed:@"type_add"];
        _plusImgView.userInteractionEnabled = YES;
    }
    return _plusImgView;
}
- (UIView *)plusView {
    if (!_plusView) {
        _plusView = [UIView new];
        _plusView.backgroundColor = UIColor.whiteColor;
        __weak typeof(self)weakSelf = self;
        [_plusView addTapGestureRecognizerWithBlock:^(UIGestureRecognizer *gestureRecognizer) {
            [weakSelf rotate];
        }];
    }
    return _plusView;
}

- (UIView *)line {
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = UIColor.lightGrayColor;
    }
    return _line;
}
- (UILabel *)leftLabel {
    if (!_leftLabel) {
        _leftLabel = [UILabel new];
        _leftLabel.text = @"当月收入";
        _leftLabel.font = ALIFont10;
        _leftLabel.textColor = UIColor.lightGrayColor;
    }
    return _leftLabel;
}
- (UILabel *)leftSubLabel {
    if (!_leftSubLabel) {
        _leftSubLabel = [UILabel new];
        _leftSubLabel.text = @"0.00";
        _leftSubLabel.textColor = UIColor.lightGrayColor;
        _leftSubLabel.font = Font14;
    }
    return _leftSubLabel;
}
- (UILabel *)rightLabel {
    if (!_rightLabel) {
        _rightLabel = [UILabel new];
        _rightLabel.text = @"当月支出";
        _rightLabel.font = ALIFont10;
        _rightLabel.textColor = UIColor.lightGrayColor;
    }
    return _rightLabel;
}
- (UILabel *)rightSubLabel {
    if (!_rightSubLabel) {
        _rightSubLabel = [UILabel new];
        _rightSubLabel.text = @"0.00";
        _rightSubLabel.textColor = UIColor.lightGrayColor;
        _rightSubLabel.font = Font14;
    }
    return _rightSubLabel;
}
- (UIView *)coverView {
    if (!_coverView) {
        _coverView = [UIView new];
        _coverView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    }
    return _coverView;
}

@end
