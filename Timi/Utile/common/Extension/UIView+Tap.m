//
//  UIView+Tap.m
//  KKTest
//
//  Created by RY on 17/7/5.
//  Copyright © 2017年 OuDa. All rights reserved.
//

#import "UIView+Tap.h"
#import <objc/runtime.h>

#pragma mark - 声明
@interface UIView ()
@property (nonatomic, strong) tapGestureRecognizerBlock tapBlock;
@end

#pragma mark - 实现
@implementation UIView (Tap)

static const char * TAP_BLOCK_KEY = "JKR_TAP_BLOCK_KEY";

- (void)addTapGestureRecognizerWithBlock:(void (^)(UIGestureRecognizer *))block {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    self.tapBlock = block;
    [self addGestureRecognizer:tapGestureRecognizer];
}

- (void)handleTapGesture:(UIGestureRecognizer *)gestureRecognizer {
    self.tapBlock(gestureRecognizer);
}

- (tapGestureRecognizerBlock)tapBlock {
    return objc_getAssociatedObject(self, TAP_BLOCK_KEY);
}

- (void)setTapBlock:(tapGestureRecognizerBlock)tapBlock {
    objc_setAssociatedObject(self, TAP_BLOCK_KEY, tapBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
