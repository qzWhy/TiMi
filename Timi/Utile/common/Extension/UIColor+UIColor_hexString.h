//
//  UIColor+UIColor_hexString.h
//  BabyHealthy
//
//  Created by crown on 15-1-13.
//  Copyright (c) 2015年 Hepburn Alex. All rights reserved.
//


#import<UIKit/UIKit.h>

@interface UIColor (UIColor_hexString)

+ (UIColor *) colorWithHexString: (NSString *)color;

+ (UIColor *)colorWithRGB:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+ (UIImage*)createImageWithColor:(UIColor*)color;
@end
