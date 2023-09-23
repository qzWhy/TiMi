//
//  KeyboardToolView.m
//  Timi
//
//  Created by rongbang on 2023/9/23.
//

#import "KeyboardToolView.h"

@interface KeyboardToolView ()

@property (nonatomic, strong) UIButton *cameraBtn;
@property (nonatomic, strong) UIButton *doneBtn;
@property (nonatomic, strong) UILabel *countLabel;

@end

@implementation KeyboardToolView

- (void)setCount:(NSInteger)count {
    _count = count;
    self.countLabel.text = [NSString stringWithFormat:@"%ld/100",count];
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
    self.backgroundColor = UIColor.whiteColor;
    [self addSubview:self.cameraBtn];
    [self addSubview:self.doneBtn];
    [self addSubview:self.countLabel];
    
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(20);
    }];
    [_doneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
    }];
    [_cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
        make.width.height.mas_equalTo(30);
        make.left.mas_equalTo(15);
    }];
}

- (void)btnClick:(UIButton *)btn {
    NSInteger tag = btn.tag - 100;
    if (self.toolBtnClickBolck) {
        self.toolBtnClickBolck(tag);
    }
}

- (UIButton *)cameraBtn {
    if (!_cameraBtn) {
        _cameraBtn = [UIButton new];
        [_cameraBtn setImage:[UIImage imageNamed:@"btn_camera_additem"] forState:UIControlStateNormal];
        _cameraBtn.tag = 100;
        [_cameraBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraBtn;
}

- (UIButton *)doneBtn {
    if (!_doneBtn) {
        _doneBtn = [UIButton new];
        [_doneBtn setTitle:@"完成" forState:UIControlStateNormal];
        _doneBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _doneBtn.layer.borderWidth = 1;
        _doneBtn.layer.borderColor = [UIColor colorWithHexString:@"E8E8E8"].CGColor;
        [_doneBtn setTitleColor:[UIColor colorWithHexString:@"CDB47C"] forState:UIControlStateNormal];
        _doneBtn.tag = 101;
        [_doneBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneBtn;
}

- (UILabel *)countLabel {
    if (!_countLabel) {
        _countLabel = [UILabel new];
        _countLabel.text = @"0/100";
        _countLabel.textColor = [UIColor colorWithHexString:@"#C1C1C1"];
        _countLabel.textAlignment = NSTextAlignmentCenter;
        _countLabel.font = [UIFont systemFontOfSize:12];
    }
    return _countLabel;
}

@end
