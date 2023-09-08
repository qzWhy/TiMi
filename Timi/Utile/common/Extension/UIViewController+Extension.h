//
//  UIViewController+Extension.h
//  Timi
//
//  Created by rongbang on 2023/9/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Extension)

- (void)createItemWithImage:(NSString *)image title:(NSString *)title ifLeft:(BOOL)isLeft;
@end

NS_ASSUME_NONNULL_END
