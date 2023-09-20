//
//  QZCalendarCollectionViewCell.m
//  Timi
//
//  Created by rongbang on 2023/9/20.
//

#import "QZCalendarCollectionViewCell.h"

@interface QZCalendarCollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *selectedCircle;
@end

@implementation QZCalendarCollectionViewCell

- (void)setIsCurrentMonth:(BOOL)isCurrentMonth {
    _isCurrentMonth = isCurrentMonth;
    if (isCurrentMonth) {
        self.titleLabel.textColor = [UIColor colorWithHexString:@"636363"];
    } else {
        self.titleLabel.textColor = [UIColor colorWithHexString:@"D6D6D6"];
    }
}

- (void)setIsTody:(BOOL)isTody {
    _isTody = isTody;
    self.selectedCircle.hidden = !isTody;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.selectedCircle];
    [self.contentView addSubview:self.titleLabel];
    [_selectedCircle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
        make.width.height.mas_equalTo(30);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"2";
        _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
    }
    return _titleLabel;
}
- (UIView *)selectedCircle {
    if (!_selectedCircle) {
        _selectedCircle = [UIView new];
        _selectedCircle.backgroundColor = [UIColor colorWithHexString:@"E9AA44"];
        _selectedCircle.hidden = YES;
        _selectedCircle.layer.cornerRadius = 15;
    }
    return _selectedCircle;
}
@end
