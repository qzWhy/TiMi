//
//  QZHomeHeaderView.m
//  Timi
//
//  Created by rongbang on 2023/9/6.
//

#import "QZHomeHeaderView.h"

@interface QZHomeHeaderView ()

@property (nonatomic, strong) UIImageView *bgImageView;

@end

@implementation QZHomeHeaderView

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [UIImageView new];
        _bgImageView.image = [UIImage imageNamed:@"background8"];
    }
    return _bgImageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    [self addSubview:self.bgImageView];
    
    [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(155);
        make.bottom.mas_equalTo(0);
    }];
}

@end
