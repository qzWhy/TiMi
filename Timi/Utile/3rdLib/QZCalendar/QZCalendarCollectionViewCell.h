//
//  QZCalendarCollectionViewCell.h
//  Timi
//
//  Created by rongbang on 2023/9/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QZCalendarCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL isCurrentMonth;
@property (nonatomic, assign) BOOL isTody;
@end

NS_ASSUME_NONNULL_END
