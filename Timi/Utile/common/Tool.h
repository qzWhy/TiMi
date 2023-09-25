//
//  Tool.h
//  Timi
//
//  Created by rongbang on 2023/9/7.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Tool : NSObject
/**判断字符串是否为空**/
+ (BOOL)isBlankString:(NSString *)aStr;
/**获取最上方的window**/
+ (UIWindow *)lastWindow;

@end

NS_ASSUME_NONNULL_END
