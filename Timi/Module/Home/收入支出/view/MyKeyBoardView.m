//
//  MyKeyBoardView.m
//  Timi
//
//  Created by rongbang on 2023/9/18.
//

#import "MyKeyBoardView.h"

typedef NS_ENUM(NSUInteger, QZKeyBoardOpreateKey) {
    QZKeyBoardOpreateKeyNone = 0,
    QZKeyBoardOpreateKeyPlus,
    QZKeyBoardOpreateKeyMinus,
    QZKeyBoardOpreateKeyEqualPlus,//连加
    QZKeyBoardOpreateKeyEqualMinus,//连减
};

@interface MyKeyBoardView ()

@property (nonatomic, strong) NSMutableArray *numbers;
/**正常字符串**/
@property (nonatomic, copy) NSString *contentStr;
/**待处理的字符串**/
@property (nonatomic, copy) NSString *dealStr;
/**结果**/
@property (nonatomic, assign) CGFloat resultNum;
/**返回的字符串**/
@property (nonatomic, copy) NSString *backStr;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) QZKeyBoardOpreateKey opreationKey;
/**操作键 + 或 -**/
@property (nonatomic, copy) NSString *opreateKeyStr;

@end

@implementation MyKeyBoardView

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableArray *)numbers {
    if (!_numbers) {
        _numbers = @[@"1",@"2",@"3",@"+",@"4",@"5",@"6",@"-",@"7",@"8",@"9",@"OK",@"清零",@"0",@"."].mutableCopy;
    }
    return _numbers;
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
    CGFloat width = (UNScreenWidth - 2)/4;
    CGFloat height = width / 2;
    self.contentStr = @"";
    self.dealStr = @"";
    self.resultNum = 0;
    for (int i = 0; i < self.numbers.count; i++) {
        CGFloat row = i % 4;
        CGFloat line = i / 4;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(row *width, height *line, width, height)];
        label.userInteractionEnabled = YES;
        [label addTapGestureRecognizerWithBlock:^(UIGestureRecognizer *gestureRecognizer) {
            [self myNumberHadBeClick:self.numbers[i]];
        }];
        label.text = self.numbers[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor colorWithHexString:@"888888"];
        //        label.font = ALIFont25;
        label.font = NeueFont20;
        if (i == 11) {
            label.height = 2 * height;
            label.font = NeueFont18;
        }
        if (i == 12) {
            label.font = ALIFont16;
        }
        label.layer.borderWidth = 1;
        label.layer.borderColor = UIColor.whiteColor.CGColor;
        label.backgroundColor = [UIColor colorWithHexString:@"EBEBEB"];
        [self addSubview:label];
        [self.dataArray addObject:label];
    }
}

- (void)myNumberHadBeClick:(NSString *)str {
    NSLog(@"%@",str);
    
    
    if ([str isEqualToString:@"+"]) {
        if ([self.contentStr isEqualToString:@""] && self.resultNum > 0) {
            self.opreationKey = QZKeyBoardOpreateKeyEqualPlus;
        } else {
            self.opreationKey = QZKeyBoardOpreateKeyPlus;
        }
        [self setEqualBtn];
        return;
    }
    if ([str isEqualToString:@"-"]) {
        if ([self.contentStr isEqualToString:@""] && self.resultNum > 0 ) {
            self.opreationKey = QZKeyBoardOpreateKeyEqualMinus;
        } else {
            self.opreationKey = QZKeyBoardOpreateKeyMinus;
        }
        [self setEqualBtn];
        return;
    }
    if ([str isEqualToString:@"="]) {
        CGFloat floatnum = 0;
        if ([self.contentStr isEqualToString:@""] && self.resultNum > 0) {
            NSString *floatstr = [NSString stringWithFormat:@"%.2f",self.resultNum];
            floatnum = [self opreateDataWithStr1:floatstr andStr2:self.dealStr];
        } else {
            floatnum = [self opreateDataWithStr1:self.contentStr andStr2:self.dealStr];
        }
        self.backStr = [NSString stringWithFormat:@"%.2f",floatnum];
        self.resultNum = floatnum;
        self.dealStr = @"";
        self.contentStr = @"";
        self.opreationKey = QZKeyBoardOpreateKeyNone;
        [self setOKBtn];
        if (self.numberClickBackBlock) {
            self.numberClickBackBlock(self.backStr, NO);
        }
        return;
    }
    if ([str isEqualToString:@"OK"]) {
        if (self.numberClickBackBlock) {
            self.numberClickBackBlock(self.backStr, YES);
        }
        return;
    }
    if ([str isEqualToString:@"清零"]) {
        [self clearData];
        if (self.numberClickBackBlock) {
            self.numberClickBackBlock(self.backStr, NO);
        }
        return;
    }
    switch (self.opreationKey) {
        case QZKeyBoardOpreateKeyNone:
        {
            if ([self unableInputWithStr:self.contentStr]) {
                
            } else {
                self.contentStr = [NSString stringWithFormat:@"%@%@",self.contentStr,str];
            }
            self.backStr = self.contentStr;
        }
            break;
        case QZKeyBoardOpreateKeyPlus:
        {
            if ([self unableInputWithStr:self.dealStr]) {
            } else {
                self.dealStr = [NSString stringWithFormat:@"%@%@",self.dealStr,str];
            }
            self.backStr = self.dealStr;
        }
            break;
        case QZKeyBoardOpreateKeyMinus:
        {
            if ([self unableInputWithStr:self.dealStr]) {
            } else {
                self.dealStr = [NSString stringWithFormat:@"%@%@",self.dealStr,str];
            }
            self.backStr = self.dealStr;
        }
            break;
        case QZKeyBoardOpreateKeyEqualPlus:
        {
            if ([self unableInputWithStr:self.dealStr]) {
            } else {
                self.dealStr = [NSString stringWithFormat:@"%@%@",self.dealStr,str];
            }
            self.backStr = self.dealStr;
        }
            break;
        case QZKeyBoardOpreateKeyEqualMinus:
        {
            if ([self unableInputWithStr:self.dealStr]) {
            } else {
                self.dealStr = [NSString stringWithFormat:@"%@%@",self.dealStr,str];
            }
            self.backStr = self.dealStr;
        }
            break;
        default:
            break;
    }
    if (self.numberClickBackBlock) {
        self.numberClickBackBlock(self.backStr, NO);
    }
}
/**判断小数点超过两位后不能再输入**/
- (BOOL)unableInputWithStr:(NSString *)str {
    NSArray *arr = [str componentsSeparatedByString:@"."];
    if (arr.count > 1) {
        NSString *string1 = arr[1];
        if (string1.length >= 2) {
            NSLog(@"ffffff%@",string1);
            return YES;
        }
    }
    return NO;
}

- (void)setEqualBtn {
    if ([self.numbers[11] isEqualToString:@"="]) {
        self.dealStr = @"";
        return;
    }
    UILabel *label = self.dataArray[11];
    label.text = @"=";
    self.numbers[11] = @"=";
}

- (void)setOKBtn {
    UILabel *label = self.dataArray[11];
    label.text = @"OK";
    self.numbers[11] = @"OK";
}

//计算
- (CGFloat)opreateDataWithStr1:(NSString *)str1 andStr2:(NSString *)str2 {
    CGFloat float1 = [str1 floatValue];
    CGFloat float2 = [str2 floatValue];
    CGFloat float3 = 0;
    switch (self.opreationKey) {
        case QZKeyBoardOpreateKeyPlus:
        {
            float3 = float1 + float2;
        }
            break;
        case QZKeyBoardOpreateKeyMinus:
        {
            float3 = float1 - float2;
        }
            break;
        case QZKeyBoardOpreateKeyEqualPlus:
        {
            float3 = float1 + float2;
        }
            break;
        case QZKeyBoardOpreateKeyEqualMinus:
        {
            float3 = float1 - float2;
        }
            break;
        default:
            break;
    }
    return float3;
}

//清零
- (void)clearData {
    self.contentStr = @"";
    self.dealStr = @"";
    self.backStr = @"";
    self.resultNum = 0;
    self.opreationKey = QZKeyBoardOpreateKeyNone;
    if (![self.numbers[11] isEqualToString:@"OK"]){
        [self setOKBtn];
    }
}

@end
