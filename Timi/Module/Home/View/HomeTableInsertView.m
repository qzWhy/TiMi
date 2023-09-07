//
//  HomeTableInsertView.m
//  Timi
//
//  Created by rongbang on 2023/9/6.
//

#import "HomeTableInsertView.h"

@implementation HomeTableInsertView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UIView *line = [UIView new];
    line.backgroundColor = UIColor.lightGrayColor;
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(0.5);
        make.centerX.equalTo(self);
    }];
}

@end
