//
//  AddItemCollectionViewCell.m
//  Timi
//
//  Created by rongbang on 2023/9/22.
//

#import "AddItemCollectionViewCell.h"

@interface AddItemCollectionViewCell ()

@property (nonatomic, strong) UIImageView *iconImgView;

@property (nonatomic, strong) UILabel *titleLabel;


@end

@implementation AddItemCollectionViewCell

- (void)setModel:(ItemModel *)model {
    _model = model;
    self.iconImgView.image = [UIImage imageNamed:model.imgStr];
    self.titleLabel.text = model.title;
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
    [self.contentView addSubview:self.iconImgView];
    [self.contentView addSubview:self.titleLabel];
    
    [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.width.height.mas_equalTo(30);
        make.centerX.equalTo(self.contentView);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconImgView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.image = [UIImage imageNamed:@"type_big_1"];
    }
    return _iconImgView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"一般";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

@end
