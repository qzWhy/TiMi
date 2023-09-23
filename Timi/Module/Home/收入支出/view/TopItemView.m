//
//  TopItemView.m
//  Timi
//
//  Created by rongbang on 2023/9/18.
//

#import "TopItemView.h"

@interface TopItemView ()

@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *priceLabel;

@end

@implementation TopItemView

- (void)setModel:(ItemModel *)model {
    _model = model;
    self.iconImgView.image = [UIImage imageNamed:model.imgStr];
    self.nameLabel.text = model.title;
}

- (void)setStr:(NSString *)str {
    _str = str;
    CGFloat floatstr = [str floatValue];
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %.2f",floatstr];
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
    //B0B355
    self.backgroundColor = [UIColor colorWithHexString:@"E3A543"];
    [self addSubview:self.iconImgView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.priceLabel];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(30);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(_iconImgView.mas_right).offset(5);
        make.height.mas_equalTo(20);
    }];
    [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.height.width.mas_equalTo(38);
        make.left.mas_equalTo(20);
    }];
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.image = [UIImage imageNamed:@"type_big_1"];
    }
    return _iconImgView;
}
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"一般";
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = Font14;
    }
    return _nameLabel;
}
- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.text = @"¥ 0.00";
        _priceLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:25];
        _priceLabel.textAlignment = NSTextAlignmentRight;
        _priceLabel.textColor = [UIColor whiteColor];
    }
    return _priceLabel;
}
@end
