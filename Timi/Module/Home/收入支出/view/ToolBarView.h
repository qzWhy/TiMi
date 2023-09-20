//
//  ToolBarView.h
//  Timi
//
//  Created by rongbang on 2023/9/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToolBarView : UIView

@property (nonatomic, copy) void(^btnClickBlock)(NSInteger tag);

@end

NS_ASSUME_NONNULL_END
