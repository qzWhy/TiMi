//
//  QZCalendarDateViewController.h
//  Timi
//
//  Created by rongbang on 2023/9/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QZCalendarDateViewController : UIViewController

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, copy) void(^selectDateBlock)(NSString *year, NSString *month, NSString *day, NSDate *date);

@end

NS_ASSUME_NONNULL_END
