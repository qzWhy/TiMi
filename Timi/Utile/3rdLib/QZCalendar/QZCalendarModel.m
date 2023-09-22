//
//  QZCalendarModel.m
//  Timi
//
//  Created by rongbang on 2023/9/20.
//

#import "QZCalendarModel.h"
#import "QZCalendarHelper.h"
@interface QZCalendarModel ()

@end

@implementation QZCalendarModel
/**
 共需要42个数据 需显示本月所有日期 + 上月最后一周最后几天 + 下个月补齐剩余数据
 本月数据可选择，同时如果日期是现在的时间则需判断当前时间之前的本月数据可选，之后的不可选
 */
+ (NSArray<QZCalendarModel *> *)achieveCalendarModelWithData:(NSDate *)date
{
    QZCalendarHelper *calendarHelper = [QZCalendarHelper sharedCalendarHelper];
    
    if (!date) {
        date = [NSDate date];
    }
    
    NSMutableArray *modelArray = [NSMutableArray array];
    NSInteger year = [calendarHelper getYearWithDate:date];
    NSInteger month = [calendarHelper getMonthWithDate:date];
    NSInteger day = [calendarHelper getDayWithDate:date];
    NSInteger dates = [calendarHelper getMonthDaysWithDate:date];
//    NSInteger weekDay = [calendarHelper getWeekDayWithDate:date];
    //年-月 当月的第一天
    NSString *ymStr = [NSString stringWithFormat:@"%@-01",[QZCalendarHelper getDateFormatWithDate:date]];
    NSDate *fff = [QZCalendarHelper strToDateWithStr:ymStr];
    //当月的第一天为周几
    NSInteger weekDay = [QZCalendarHelper getWeekDayWithDate: fff];
    weekDay = weekDay == 1 ? 7 : weekDay-1;//手动切换 weekDay代表周几
    
    NSDate *previousDate = [QZCalendarHelper previousMonthDateWithDate:date];
    NSInteger previousDates = [calendarHelper getMonthDaysWithDate:previousDate];
    
    
    
    NSMutableArray *currenModelArray = [NSMutableArray array];
    NSMutableArray *lastArray = [NSMutableArray array];
    NSMutableArray *nextArray = [NSMutableArray array];
    
    for (int i = 0; i < dates; i++) {
        QZCalendarModel *model = [QZCalendarModel new];
        model.day = [NSString stringWithFormat:@"%d",i+1];
        if (year == calendarHelper.selectYear && month == calendarHelper.selectMonth) {
            if (day == i + 1) {
                model.isSelected = YES;
            }
        }
        if (year == calendarHelper.year && month == calendarHelper.month) {
            if (calendarHelper.day < i+1) {
                model.isOver = YES;
            }
            
            if (i + 1 == calendarHelper.day) {
                model.isToday = YES;
            }
        }
        if (year > calendarHelper.year ||(year == calendarHelper.year && month > calendarHelper.month)) {
            model.isDateMonth = NO;
        } else {        
            model.isDateMonth = YES;
        }
        
        [currenModelArray addObject:model];
    }
    //周四是第五天
    NSInteger start = previousDates - weekDay + 1;
    if (weekDay == 7) {
    } else {
        for (int i = 0; i < weekDay; i++) {
            QZCalendarModel *model = [QZCalendarModel new];
            model.day = [NSString stringWithFormat:@"%ld",start + i];
            [lastArray addObject:model];
        }
    }
    NSInteger count = 42 - weekDay - dates;
    for (int i = 0; i < count; i++) {
        QZCalendarModel *model = [QZCalendarModel new];
        model.day = [NSString stringWithFormat:@"%d", i + 1];
        [nextArray addObject:model];
    }
    [modelArray addObjectsFromArray:lastArray];
    [modelArray addObjectsFromArray:currenModelArray];
    [modelArray addObjectsFromArray:nextArray];
    
    return modelArray;
}


@end
