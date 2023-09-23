//
//  RemarkViewController.m
//  Timi
//
//  Created by rongbang on 2023/9/23.
//

#import "RemarkViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "AddItemView.h"
#import "KeyboardToolView.h"
@interface RemarkViewController ()<UITextViewDelegate>

@property (nonatomic, strong) KeyboardToolView *toolView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UNTextView *textView;

@end

@implementation RemarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"备注";
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupNav];
    [self setupUI];
    
}

- (void)setupUI {
    [self.view addSubview:self.timeLabel];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.toolView];
    [self addObserve];
    [self.textView becomeFirstResponder];
    [_toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(0);
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(15);
    }];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_timeLabel.mas_bottom);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(-15);
    }];
}

- (void)setupNav {
    UINavigationBar *bar = self.navigationController.navigationBar;
    //之前版本的导航栏字体颜色
    bar.tintColor = UIColor.blackColor;
    // iOS13前改变tabbar的背景颜色
    bar.barTintColor = [UIColor whiteColor];
    bar.shadowImage = [UIColor createImageWithColor:UIColor.grayColor];
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *barAppearance = [UINavigationBarAppearance new];
        [barAppearance configureWithTransparentBackground];
        barAppearance.backgroundColor = UIColor.whiteColor;
        barAppearance.shadowImage = [UIColor createImageWithColor:[UIColor lightGrayColor]];
//        scrollEdgeAppearance控制页面没有与其相交的状态
//        standardAppearance控制页面内容与其相交的状态
        bar.standardAppearance = barAppearance;
        bar.scrollEdgeAppearance = barAppearance;
    }
    bar.translucent = NO;
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 12.5, 20, 20)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"btn_item_close"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [leftView addSubview:leftBtn];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    
}

/**监听键盘的高度**/
- (void)addObserve {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHideOrShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHideOrShow:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardHideOrShow:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    
    CGRect keyboardF = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [_toolView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-keyboardF.size.height);
    }];
}

- (void)backBtnClick {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.text = @"2023年09月23日";
        _timeLabel.textColor = [UIColor colorWithHexString:@"#C1C1C1"];
        _timeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _timeLabel;
}
- (UNTextView *)textView {
    if (!_textView) {
        _textView = [UNTextView new];
        _textView.placeHolder = @"记录花销更记录生活...";
        _textView.delegate = self;
        
        _textView.font = [UIFont systemFontOfSize:20];
        _textView.placeHolderFont = [UIFont systemFontOfSize:20];
    }
    return _textView;
}
- (KeyboardToolView *)toolView {
    if (!_toolView) {
        _toolView = [KeyboardToolView new];
    }
    return _toolView;
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"%@",textView.text);
}
/**这里是textview监听点击的最后一个键是什么**/
//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
//    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
//        //在这里做你响应return键的代码
//        [self.textView resignFirstResponder];
//        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
//    }
//
//    return YES;
//}
/**可以查看类中的私有变量**/
- (NSArray *)ivarArray:(Class)cls {
    unsigned int stuIvarCount = 0;
    Ivar *ivars = class_copyIvarList(cls, &stuIvarCount);
    if (stuIvarCount == 0) {
        return nil;
    }
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:stuIvarCount];
    for (int i = 0;i<stuIvarCount;i++) {
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSLog(@"%@",ivarName);
        [arr addObject:ivarName];
    }
    free(ivars);
    return arr;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
