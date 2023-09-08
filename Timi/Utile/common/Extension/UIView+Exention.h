//
//  UIView+Exention.h
//  Timi
//
//  Created by rongbang on 2023/9/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Exention)

@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;

@property (nonatomic,assign) CGFloat top;
@property (nonatomic,assign) CGFloat left;
@property (nonatomic,assign) CGFloat right;
@property (nonatomic,assign) CGFloat bottom;

@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGSize  size;
@property (nonatomic,assign) CGPoint origin;

@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;

+(void)drawCircleWithView:(UIView *)view corner:(CGFloat)corner;

@end

NS_ASSUME_NONNULL_END
