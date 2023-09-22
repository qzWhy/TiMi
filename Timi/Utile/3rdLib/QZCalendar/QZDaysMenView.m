//
//  QZDaysMenView.m
//  Timi
//
//  Created by rongbang on 2023/9/20.
//

#import "QZDaysMenView.h"
#import "QZCalendarCollectionViewCell.h"
#import "QZCalendarHelper.h"
#import "QZCalendarModel.h"
#import "LeftAndRightButtonView.h"
#define QZSCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define QZSCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define MARGIN 20
#define ITEMWIDTH (QZSCREENWIDTH - MARGIN*2) / 7
#define ITEMHEIGHT 40
@interface QZDaysMenView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) QZCalendarHelper *calendarHelper;
@property (nonatomic, strong) NSArray *weeks;
@property (nonatomic, strong) NSMutableArray *dateArray;
@property (nonatomic, strong) LeftAndRightButtonView *yearView;
@property (nonatomic, strong) LeftAndRightButtonView *monthView;

@end

@implementation QZDaysMenView

- (LeftAndRightButtonView *)yearView {
    if (!_yearView) {
        _yearView = [[LeftAndRightButtonView alloc] initWithFrame:CGRectMake(0, 0, QZSCREENWIDTH * 0.5, 40)];
        __weak __typeof(self)weakSelf = self;
        _yearView.btnClickBlock = ^(NSInteger tag) {
            if (tag == 0) {//0是左侧
                weakSelf.date = [QZCalendarHelper previousYearDateWithDate:weakSelf.date];
                [weakSelf getDataSource];
            } else {
                weakSelf.date = [QZCalendarHelper nextYearDateWithDate:weakSelf.date];
                [weakSelf getDataSource];
            }
        };
    }
    return _yearView;
}

- (LeftAndRightButtonView *)monthView {
    if (!_monthView) {
        _monthView = [[LeftAndRightButtonView alloc] initWithFrame:CGRectMake(QZSCREENWIDTH *0.5, 0, QZSCREENWIDTH *0.5, 40)];
        __weak __typeof(self)weakSelf = self;
        _monthView.btnClickBlock = ^(NSInteger tag) {
            if (tag == 0) {//0是左侧
                weakSelf.date = [QZCalendarHelper previousMonthDateWithDate:weakSelf.date];
                [weakSelf getDataSource];
            } else {
                weakSelf.date = [QZCalendarHelper nextMonthDateWithDate:weakSelf.date];
                [weakSelf getDataSource];
            }
        };
    }
    return _monthView;
}

- (NSMutableArray *)dateArray {
    if (!_dateArray) {
        _dateArray = [NSMutableArray array];
    }
    return _dateArray;
}

- (NSArray *)weeks {
    if (!_weeks) {
        _weeks = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
    }
    return _weeks;
}

- (void)setDate:(NSDate *)date {
    _date = date;
    [self getDataSource];
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
    [self addSubview:self.yearView];
    [self addSubview:self.monthView];
    [self setWeekView];
    [self addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ITEMHEIGHT * 2);
        make.left.right.bottom.mas_equalTo(0);
    }];
}

- (void)getDataSource {
    [self.dateArray removeAllObjects];
    NSArray *arr = [QZCalendarModel achieveCalendarModelWithData:self.date];
    self.yearView.title = [NSString stringWithFormat:@"%ld年",[QZCalendarHelper getYearWithDate:self.date]] ;
    self.monthView.title = [NSString stringWithFormat:@"%ld月",[QZCalendarHelper getMonthWithDate:self.date]] ;
    [self.dateArray addObjectsFromArray:arr];
    [self.collectionView reloadData];
}


- (void)setWeekView {
    for (int i = 0; i < self.weeks.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN + ITEMWIDTH * i, 40, ITEMWIDTH, ITEMHEIGHT)];
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
    return self.dateArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QZCalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QZCalendarCollectionViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[QZCalendarCollectionViewCell alloc] init];
    }
    QZCalendarModel *model = self.dateArray[indexPath.row];
    cell.model = model;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    QZCalendarModel *model = self.dateArray[indexPath.row];
    if (model.isDateMonth) {
        if (self.selectDateBlock) {
            
            NSString *ymStr = [QZCalendarHelper getDateFormatWithDate:self.date];
            NSString *dayStr = @"0";
            if ([model.day integerValue] < 10) {
                dayStr = [NSString stringWithFormat:@"0%@",model.day];
            } else {
                dayStr = model.day;
            }
            NSString *dateFormart = [NSString stringWithFormat:@"%@-%@",ymStr,dayStr];
            NSDate *date1 = [self strToDateWithStr:dateFormart];
            self.calendarHelper.selectDay = [QZCalendarHelper getDayWithDate:date1];
            self.calendarHelper.selectYear = [QZCalendarHelper getYearWithDate:date1];
            self.calendarHelper.selectMonth = [QZCalendarHelper getMonthWithDate:date1];
            self.selectDateBlock(self.yearView.title, self.monthView.title,  [NSString stringWithFormat:@"%@日",model.day],date1);
        }
    }
}

- (NSDate *)strToDateWithStr:(NSString *)str {
    
    NSDateFormatter *formatterTime = [NSDateFormatter new];
    
    formatterTime.dateFormat = @"yyyy-MM-dd";
    
    formatterTime.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    
    NSDate *dateTime = [formatterTime dateFromString:str];
    return dateTime;
}
@end
