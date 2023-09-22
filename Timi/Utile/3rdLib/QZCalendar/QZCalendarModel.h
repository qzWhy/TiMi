//
//  QZCalendarModel.h
//  Timi
//
//  Created by rongbang on 2023/9/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QZCalendarModel : NSObject

@property (nonatomic, copy) NSString *day;
/**是当前月**/
@property (nonatomic, assign) BOOL isDateMonth;
/**是否超过当前日期**/
@property (nonatomic, assign) BOOL isOver;
@property (nonatomic, assign) BOOL isToday;
@property (nonatomic, assign) BOOL isSelected;
/**根据日期信息获取日期数组 会有固定42条数据 **/
+ (NSArray<QZCalendarModel *> *)achieveCalendarModelWithData:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
