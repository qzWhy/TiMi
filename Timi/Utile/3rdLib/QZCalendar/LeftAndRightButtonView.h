//
//  LeftAndRightButtonView.h
//  Timi
//
//  Created by rongbang on 2023/9/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LeftAndRightButtonView : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) void(^btnClickBlock)(NSInteger tag);

@end

NS_ASSUME_NONNULL_END
