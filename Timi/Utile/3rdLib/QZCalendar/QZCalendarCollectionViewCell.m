//
//  QZCalendarCollectionViewCell.m
//  Timi
//
//  Created by rongbang on 2023/9/20.
//

#import "QZCalendarCollectionViewCell.h"

#define QZCalendarTextColor [UIColor colorWithHexString:@"333333"]
#define QZCalendarUNTextColor [UIColor colorWithHexString:@"D2D2D2"]

@interface QZCalendarCollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *selectedCircle;
@end

@implementation QZCalendarCollectionViewCell

- (void)setModel:(QZCalendarModel *)model {
    _model = model;
    self.titleLabel.text = model.day;
    if (model.isToday) {
        self.titleLabel.textColor = [UIColor colorWithHexString:@"E9AA44"];
    } else {
        
        if (model.isDateMonth) {
            if (model.isOver) {
                self.titleLabel.textColor = QZCalendarUNTextColor;
            } else {
                self.titleLabel.textColor = QZCalendarTextColor;
            }
        } else {
            self.titleLabel.textColor = QZCalendarUNTextColor;
        }
    }
    if (model.isSelected) {
        self.titleLabel.textColor = [UIColor whiteColor];
        self.selectedCircle.hidden = NO;
    } else {    
        self.selectedCircle.hidden = YES;
    }
}
- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    if (isSelected) {
        self.titleLabel.textColor = [UIColor whiteColor];
        self.selectedCircle.hidden = NO;
    } else {
        self.selectedCircle.hidden = YES;
    }

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
        _titleLabel.textColor = [UIColor colorWithHexString:@"#636363"];
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
