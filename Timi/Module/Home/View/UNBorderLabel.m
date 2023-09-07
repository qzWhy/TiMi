//
//  UNBorderLabel.m
//  Timi
//
//  Created by rongbang on 2023/9/6.
//

#import "UNBorderLabel.h"

@interface UNBorderLabel ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation UNBorderLabel

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
    self.backgroundColor = UIColor.greenColor;
    self.layer.cornerRadius = 15;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
//    [self addSubview:self.imgView];
    [self addSubview:self.titleLabel];
    
//    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(0);
//    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(20);
        make.bottom.mas_equalTo(-5);
    }];
}

//- (UIImageView *)imgView {
//    if (!_imgView) {
//        _imgView = [UIImageView new];
//        _imgView.image = [UIImage imageNamed:@"jycx-bak_n"];
//        _imgView.contentMode = UIViewContentModeScaleAspectFill;
//    }
//    return _imgView;
//}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"";
        _titleLabel.textColor = [UIColor colorWithHexString:@"#222222"];
        _titleLabel.font = Font14;
    }
    return _titleLabel;
}
@end
