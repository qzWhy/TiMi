//
//  TMBillModel.h
//  Timi
//
//  Created by rongbang on 2023/9/7.
//账单model

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TMBillModel : NSObject

@property (nonatomic, assign) BOOL showDay;
/**日期**/
@property (nonatomic, copy) NSString *date;
/**分类 及可代表图标也可代表名称**/
@property (nonatomic, copy) NSString *type;
/**话费金额**/
@property (nonatomic, copy) NSString *pirce;

@end

NS_ASSUME_NONNULL_END
