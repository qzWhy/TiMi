//
//  QZDaysMenView.m
//  Timi
//
//  Created by rongbang on 2023/9/20.
//

#import "QZDaysMenView.h"
#import "QZCalendarCollectionViewCell.h"
#import "QZCalendarHelper.h"
#define QZSCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define QZSCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define MARGIN 20
#define ITEMWIDTH (QZSCREENWIDTH - MARGIN*2) / 7
#define ITEMHEIGHT 40
@interface QZDaysMenView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) QZCalendarHelper *calendarHelper;
@property (nonatomic, strong) NSArray *weeks;
@end

@implementation QZDaysMenView

- (NSArray *)weeks {
    if (!_weeks) {
        _weeks = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    }
    return _weeks;
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
    self.backgroundColor = [UIColor whiteColor];
    self.calendarHelper = [QZCalendarHelper sharedCalendarHelper];
    [self setWeekView];
    [self addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ITEMHEIGHT);
        make.left.right.bottom.mas_equalTo(0);
    }];
}
- (void)setWeekView {
    for (int i = 0; i < self.weeks.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN + ITEMWIDTH * i, 0, ITEMWIDTH, ITEMHEIGHT)];
        label.text = self.weeks[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor colorWithHexString:@"909090"];
        label.font = [UIFont systemFontOfSize:12];
        [self addSubview:label];
    }
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        CGFloat itemWidth = ITEMWIDTH;
        CGFloat itemHeight = ITEMHEIGHT;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, MARGIN, 0, MARGIN);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.itemSize = CGSizeMake(itemWidth, itemHeight);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_collectionView registerClass:[QZCalendarCollectionViewCell class] forCellWithReuseIdentifier:@"QZCalendarCollectionViewCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 42;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QZCalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QZCalendarCollectionViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[QZCalendarCollectionViewCell alloc] init];
    }
    NSInteger tags = indexPath.row;
    if (tags < self.calendarHelper.weekDay + 1) {
        NSInteger title = self.calendarHelper.lastMonthDays - self.calendarHelper.weekDay;
        cell.title = [NSString stringWithFormat:@"%ld",title + indexPath.row];
        cell.isCurrentMonth = NO;
    } else if (tags >= self.calendarHelper.weekDay && tags <= self.calendarHelper.weekDay + self.calendarHelper.days){
        NSInteger tag2 = tags - self.calendarHelper.weekDay;
        cell.title = [NSString stringWithFormat:@"%ld", tag2];
        if (tags == self.calendarHelper.day) {
            cell.isTody = YES;
        }
        
        cell.isTody = tag2 == self.calendarHelper.day;
        cell.isCurrentMonth = YES;
    } else {
        NSInteger tag2 = tags - self.calendarHelper.weekDay - self.calendarHelper.days;
        cell.title = [NSString stringWithFormat:@"%ld", tag2];
        cell.isCurrentMonth = NO;
    }
    return cell;
}

@end
