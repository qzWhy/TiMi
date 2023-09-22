//
//  AddItemView.m
//  Timi
//
//  Created by rongbang on 2023/9/22.
//

#import "AddItemView.h"
#import "AddItemCollectionViewCell.h"
@interface AddItemView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation AddItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 14;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AddItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddItemCollectionViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[AddItemCollectionViewCell alloc] initWithFrame:CGRectZero];
    }
    return cell;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CGFloat itemWidth = (UNScreenWidth -20 - 100)/6;
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        layout.itemSize = CGSizeMake(itemWidth, 70);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 20;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collectionView registerClass:[AddItemCollectionViewCell class] forCellWithReuseIdentifier:@"AddItemCollectionViewCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

@end
