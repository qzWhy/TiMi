//
//  ToolBarView.m
//  Timi
//
//  Created by rongbang on 2023/9/19.
//

#import "ToolBarView.h"

@interface ToolBarView ()

@property (nonatomic, strong) UILabel *yearLabel;
@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UIButton *editBtn;

@end

@implementation ToolBarView

- (void)setYearStr:(NSString *)yearStr {
    _yearStr = yearStr;
    self.yearLabel.text = yearStr;
    self.yearLabel.textColor = [UIColor colorWithHexString:@"E9AA44"];
}

- (void)setDayStr:(NSString *)dayStr {
    _dayStr = dayStr;
    self.dayLabel.text = dayStr;
    self.dayLabel.textColor = [UIColor colorWithHexString:@"E9AA44"];
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
    self.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [self addSubview:self.yearLabel];
    [self addSubview:self.dayLabel];
    [self addSubview:self.editBtn];
    
    [_editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(UNScreenWidth / 4);
        make.bottom.mas_equalTo(0);
    }];
    [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_yearLabel.mas_bottom);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(UNScreenWidth / 4);
        make.height.mas_equalTo(20);
    }];
    [_yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(UNScreenWidth / 4);
        make.height.mas_equalTo(10);
    }];
}

- (void)btnClickWithTag:(NSInteger)tag {
    if (self.btnClickBlock) {
        self.btnClickBlock(tag);
    }
}
- (void)btnClick {
    [self btnClickWithTag:2];
}

- (UILabel *)yearLabel {
    if (!_yearLabel) {
        _yearLabel = [UILabel new];
        _yearLabel.text = @"2023";
        _yearLabel.textColor = [UIColor colorWithHexString:@"#888888"];
        _yearLabel.textAlignment = NSTextAlignmentCenter;
        _yearLabel.font = NeueFont10;
        _yearLabel.userInteractionEnabled = YES;
        weakself(self);
        [_yearLabel addTapGestureRecognizerWithBlock:^(UIGestureRecognizer *gestureRecognizer) {
            [weakSelf btnClickWithTag:1];
        }];
    }
    return _yearLabel;
}
- (UILabel *)dayLabel {
    if (!_dayLabel) {
        _dayLabel = [UILabel new];
        _dayLabel.text = @"今天";
        _dayLabel.textColor = [UIColor colorWithHexString:@"#888888"];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.userInteractionEnabled = YES;
        weakself(self);
        [_dayLabel addTapGestureRecognizerWithBlock:^(UIGestureRecognizer *gestureRecognizer) {
            [weakSelf btnClickWithTag:1];
        }];
        _dayLabel.font = NeueFont12;
    }
    return _dayLabel;
}
- (UIButton *)editBtn {
    if (!_editBtn) {
        _editBtn = [UIButton new];
        [_editBtn setImage:[UIImage imageNamed:@"addItem_remark"] forState:UIControlStateNormal];
        [_editBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editBtn;
}
@end
