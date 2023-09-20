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
@property (nonatomic, assign) BOOL isToday;
/**不可使用**/
@property (nonatomic, assign) BOOL unable;

@end

NS_ASSUME_NONNULL_END
