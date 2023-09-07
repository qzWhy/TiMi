//
//  QZTimeLineCell.m
//  Timi
//
//  Created by rongbang on 2023/9/6.
//

#import "QZTimeLineCell.h"

@interface QZTimeLineCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIImageView *dotImgView;
@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *totalLabel;

@end

@implementation QZTimeLineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:line];
    [self.contentView addSubview:self.dotImgView];
    [self.contentView addSubview:self.dayLabel];
    [self.contentView addSubview:self.totalLabel];
    [self.contentView addSubview:self.imgView];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.width.height.mas_equalTo(30);
        make.centerX.equalTo(self.contentView);
    }];
    [_totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_dayLabel);
        make.left.equalTo(_dotImgView.mas_right).offset(10);
        make.height.mas_equalTo(15);
    }];
    [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_dotImgView);
        make.right.equalTo(_dotImgView.mas_left).offset(-10);
        make.height.mas_equalTo(15);
    }];
    [_dotImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.width.height.mas_equalTo(10);
        make.centerY.equalTo(self.contentView).offset(-10);
    }];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(80);
        make.centerX.equalTo(self.contentView);
        make.width.mas_equalTo(0.5);
        make.bottom.mas_equalTo(0);
    }];
}

- (UIImageView *)dotImgView {
    if (!_dotImgView) {
        _dotImgView = [UIImageView new];
        _dotImgView.image = [UIImage imageNamed:@"verify_code_button_highlighted"];
    }
    return _dotImgView;
}
- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.image = [UIImage imageNamed:@"type_big_13"];
    }
    return _imgView;
}
- (UILabel *)dayLabel {
    if (!_dayLabel) {
        _dayLabel = [UILabel new];
        _dayLabel.text = @"5月";
        _dayLabel.textColor = UIColor.lightGrayColor;
        _dayLabel.font = ALIFont10;
    }
    return _dayLabel;
}
- (UILabel *)totalLabel {
    if (!_totalLabel) {
        _totalLabel = [UILabel new];
        _totalLabel.text = @"212";
        _totalLabel.textColor = UIColor.lightGrayColor;
        _totalLabel.font = ALIFont10;
    }
    return _totalLabel;
}
@end
