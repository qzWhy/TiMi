//
//  AddItemView.m
//  Timi
//
//  Created by rongbang on 2023/9/22.
//

#import "AddItemView.h"
#import "ItemModel.h"
#import "AddItemCollectionViewCell.h"
@interface AddItemView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation AddItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self getDataSource];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (void)getDataSource {
    NSArray *data = [ItemModel getItemDataSource];
    self.dataArray = [data subarrayWithRange:NSMakeRange(0, 20)].mutableCopy;
    ItemModel *model = [ItemModel new];
    model.imgStr = @"type_add";
    model.title = @"编辑";
    [self.dataArray addObject:model];
    [self.collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AddItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddItemCollectionViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[AddItemCollectionViewCell alloc] initWithFrame:CGRectZero];
    }
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ItemModel *model = self.dataArray[indexPath.row];
    if (self.selectItemBlock) {
        self.selectItemBlock(model,indexPath.row == self.dataArray.count - 1);
    }
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

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
