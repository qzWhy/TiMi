//
//  UIWindow+QZSafeArea.m
//  Timi
//
//  Created by rongbang on 2023/9/18.
//

#import "UIWindow+QZSafeArea.h"

@implementation UIWindow (QZSafeArea)

- (UIEdgeInsets)qz_layoutInsets {
    if (@available(iOS 11.0, *)) {
        UIEdgeInsets safeAreaInsets = self.safeAreaInsets;
        if (safeAreaInsets.bottom > 0) {
            //参考文章：https://mp.weixin.qq.com/s/Ik2zBox3_w0jwfVuQUJAUw
            return safeAreaInsets;
        }
        return UIEdgeInsetsMake(20, 0, 0, 0);
    }
    return UIEdgeInsetsMake(20, 0, 0, 0);
}

- (CGFloat)qz_navigationHeight {
    CGFloat statusBarHeight = [self qz_layoutInsets].top;
    return statusBarHeight + 44;
}

- (CGFloat)qz_safeBottomHeight {
    CGFloat height = [self qz_layoutInsets].bottom;
    return height;
}

- (CGFloat)qz_safeStatusHeight {
    CGFloat statusBarHeight = [self qz_layoutInsets].top;
    return statusBarHeight;
}

@end
