//
//  AddItemViewController.m
//  Timi
//
//  Created by rongbang on 2023/9/13.
//

#import "AddItemViewController.h"
#import "HHTransition.h"
#import "IncomeViewController.h"
#import "ExpenditureViewController.h"
#import "JXCategoryTitleView.h"
#import "JXCategoryView.h"
#import "JXCategoryListContainerView.h"

@interface AddItemViewController ()<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView *category;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSMutableArray *vcs;
@property (nonatomic, strong) UIButton *closeBtn;

@end

@implementation AddItemViewController
- (NSMutableArray *)vcs {
    if (!_vcs) {
        _vcs = @[[IncomeViewController new],[ExpenditureViewController new]].mutableCopy;
    }
    return _vcs;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收支";
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupUI];
}

- (void)setupUI {
    self.titles = @[@"收入",@"支出"];
    [self.view addSubview:self.category];
    [self.view addSubview:self.closeBtn];
    [self.view addSubview:self.listContainerView];
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_category);
        make.width.height.mas_equalTo(20);
        make.left.mas_equalTo(30);
    }];
    [_category mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(STATUSHEIGHT);
        make.left.mas_equalTo(UNScreenWidth * 0.3);
        make.right.mas_equalTo(-UNScreenWidth * 0.3);
        make.height.mas_equalTo(40);
    }];
    [_listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_category.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
}

- (void)clostBtnClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton new];
        [_closeBtn setImage:[UIImage imageNamed:@"btn_item_close"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(clostBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

- (JXCategoryTitleView *)category {
    if (!_category) {
        _category = [JXCategoryTitleView new];
        _category.titles = self.titles;
        _category.delegate = self;
        _category.listContainer = self.listContainerView;
    }
    return _category;
}

- (JXCategoryListContainerView *)listContainerView {
    if (!_listContainerView) {
        _listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    }
    return _listContainerView;
}

#pragma mark - JXCategoryViewDelegate

// 点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    // 侧滑手势处理
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}
#pragma mark - JXCategoryListContainerViewDelegate

// 返回列表的数量
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}

// 返回各个列表菜单下的实例，该实例需要遵守并实现 <JXCategoryListContentViewDelegate> 协议
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    ListViewController *list = self.vcs[index];
    return list;
}


@end
