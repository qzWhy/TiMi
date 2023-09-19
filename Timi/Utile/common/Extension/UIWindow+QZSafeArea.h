//
//  UIWindow+QZSageArea.h
//  Timi
//
//  Created by rongbang on 2023/9/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (QZSafeArea)
- (UIEdgeInsets)qz_layoutInsets;

- (CGFloat)qz_navigationHeight;

- (CGFloat)qz_safeBottomHeight;

- (CGFloat)qz_safeStatusHeight;
@end

NS_ASSUME_NONNULL_END
