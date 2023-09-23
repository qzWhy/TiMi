//
//  KeyboardToolView.h
//  Timi
//
//  Created by rongbang on 2023/9/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KeyboardToolView : UIView

@property (nonatomic, copy) void(^toolBtnClickBolck)(NSInteger tag);
@property (nonatomic, assign) NSInteger count;

@end

NS_ASSUME_NONNULL_END
