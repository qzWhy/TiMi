//
//  UIView+Tap.h
//  KKTest
//
//  Created by RY on 17/7/5.
//  Copyright © 2017年 OuDa. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tapGestureRecognizerBlock)(UIGestureRecognizer *gestureRecognizer);

@interface UIView (Tap)

/// 添加点击手势
- (void)addTapGestureRecognizerWithBlock:(tapGestureRecognizerBlock)block;

@end
