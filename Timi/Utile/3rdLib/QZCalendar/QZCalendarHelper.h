//
//  QZCalendarHelper.h
//  Timi
//
//  Created by rongbang on 2023/9/20.
//  只算当日

/**
 1.获取当前的日期 年月日 星期几 第几周
 2.当前月一共多少天
 3.当前月第一天是周几 最后一天是周几
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QZCalendarHelper : NSObject

+ (instancetype)sharedCalendarHelper;

/**年月日**/
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger day;
/**周一是1 周日是0**/
@property (nonatomic, assign) NSInteger weekDay;
/** 当月的天数 */
@property (nonatomic, assign) NSInteger days;
/**上个月总天数**/
@property (nonatomic, assign) NSInteger lastMonthDays;
/**当前年月**/
@property (nonatomic, strong) NSDateFormatter *formatter;

/**获取date的下个月日期*/
- (NSDate *)nextMonthDateWithDate:(NSDate *)date;
/** 获取date的上个月日期*/
- (NSDate *)previousMonthDateWithDate:(NSDate *)date;
/**年**/
- (NSInteger)getYearWithDate:(NSDate *)date;
/**月**/
- (NSInteger)getMonthWithDate:(NSDate *)date;
/**日**/
- (NSInteger)getDayWithDate:(NSDate *)date;
/**本月第一天为周几 周一：1 周日为：0**/
- (NSInteger)getWeekDayWithDate:(NSDate *)date;
/**获取该日期的月份的总天数**/
- (NSInteger)getMonthDaysWithDate:(NSDate *)date;


/**月**/
+ (NSInteger)getMonthWithDate:(NSDate *)date;
/**年**/
+ (NSInteger)getYearWithDate:(NSDate *)date;
/**获取该日期的月份的总天数**/
+ (NSInteger)getMonthDaysWithDate:(NSDate *)date;
/**获取date的下个月日期*/
+ (NSDate *)nextMonthDateWithDate:(NSDate *)date;
/** 获取date的上个月日期*/
+ (NSDate *)previousMonthDateWithDate:(NSDate *)date;
/** 获取date的上年日期*/
+ (NSDate *)previousYearDateWithDate:(NSDate *)date;
/**获取date的下一年日期*/
+ (NSDate *)nextYearDateWithDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
