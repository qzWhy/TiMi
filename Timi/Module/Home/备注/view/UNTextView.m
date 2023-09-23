//
//  UNTextView.m
//  Timi
//
//  Created by rongbang on 2023/9/23.
//

#import "UNTextView.h"

@interface UNTextView ()

@property (nonatomic, strong) UILabel *placeHolderLabel;

@end

@implementation UNTextView

- (void)setPlaceHolderFont:(UIFont *)placeHolderFont {
    _placeHolderFont = placeHolderFont;
    self.placeHolderLabel.font = placeHolderFont;
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor {
    _placeHolderColor = placeHolderColor;
    self.placeHolderLabel.textColor = placeHolderColor;
}

- (void)setPlaceHolder:(NSString *)placeHolder {
    _placeHolder = placeHolder;
    self.placeHolderLabel.text = placeHolder;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.placeHolderLabel];
    [self setValue:self.placeHolderLabel forKey:@"_placeholderLabel"];
}

- (UILabel *)placeHolderLabel {
    if (!_placeHolderLabel) {
        _placeHolderLabel = [[UILabel alloc] init];
        _placeHolderLabel.text = @"请输入内容";
        _placeHolderLabel.numberOfLines = 0;
        _placeHolderLabel.textColor = [UIColor lightGrayColor];
        [_placeHolderLabel sizeToFit];
    }
    return _placeHolderLabel;
}
@end
