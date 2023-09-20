//
//  QZCalendarHelper.m
//  Timi
//
//  Created by rongbang on 2023/9/20.
//

#import "QZCalendarHelper.h"

@interface QZCalendarHelper ()

@property (nonatomic, strong) NSCalendar *calendar;

@end
@implementation QZCalendarHelper

+ (instancetype)sharedCalendarHelper {
    static QZCalendarHelper *helper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[QZCalendarHelper alloc] init];
        NSDate *today = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        helper.calendar = calendar;
        helper.days = [helper getMonthDaysWithDate:today];
        helper.year = [helper getYearWithDate:today];
        helper.month = [helper getMonthWithDate:today];
        helper.day = [helper getDayWithDate:today];
        helper.weekDay = [helper getWeekDayWithDate:today];
        NSDate *lastDate = [helper previousMonthDateWithDate:today];
        helper.lastMonthDays = [helper getMonthDaysWithDate:lastDate];
    });
    return helper;
}
/**年**/
- (NSInteger)getYearWithDate:(NSDate *)date {
    NSDateComponents *dateComponent = [self.calendar components:NSCalendarUnitYear fromDate:date];
    return dateComponent.year;
}
/**月**/
- (NSInteger)getMonthWithDate:(NSDate *)date {
    NSDateComponents *dateComponent = [self.calendar components:NSCalendarUnitMonth fromDate:date];
    return dateComponent.month;
}
/**日**/
- (NSInteger)getDayWithDate:(NSDate *)date {
    NSDateComponents *dateComponent = [self.calendar components:NSCalendarUnitDay fromDate:date];
    return dateComponent.day;
}
/**本月第一天为周几 周一：1 周日为：0**/
- (NSInteger)getWeekDayWithDate:(NSDate *)date {
    NSDateComponents *dateComponent = [self.calendar components:NSCalendarUnitWeekday fromDate:date];
    return dateComponent.weekday;
}

/**获取该日期的月份的总天数**/
- (NSInteger)getMonthDaysWithDate:(NSDate *)date {
    NSRange daysOfMonth = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    NSUInteger numberOfDaysInMonth = daysOfMonth.length;
    return numberOfDaysInMonth;
}

/**获取date的下个月日期*/
- (NSDate *)nextMonthDateWithDate:(NSDate *)date {
    NSDateComponents *components = [[NSDateComponents alloc]init];
    components.month =1;
    NSDate *nextMonthDate = [self.calendar dateByAddingComponents:components toDate:date options:NSCalendarMatchStrictly];
    return nextMonthDate;
}

/** 获取date的上个月日期*/
- (NSDate *)previousMonthDateWithDate:(NSDate *)date {
    NSDateComponents *components = [[NSDateComponents alloc]init];
    components.month = -1;
    NSDate *previousMonthDate = [self.calendar dateByAddingComponents:components toDate:date options:NSCalendarMatchStrictly];
    return previousMonthDate;
}

@end
