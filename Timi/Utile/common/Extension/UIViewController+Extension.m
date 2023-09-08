//
//  UIViewController+Extension.m
//  Timi
//
//  Created by rongbang on 2023/9/8.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

- (void)createItemWithImage:(NSString *)image title:(NSString *)title ifLeft:(BOOL)isLeft {
    
    NSInteger imageW = 30;
    NSInteger imageH = 25;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, imageH)];
    if (isLeft == YES) {
        if (image) {
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageW, imageH)];
            imageV.image = [UIImage imageNamed:image];
            imageV.contentMode = UIViewContentModeScaleAspectFit;
            [view addSubview:imageV];
            view.width = imageW;
        }
        if (title) {
            CGRect frame;
            CGSize size = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
            if (image) {
                frame = CGRectMake(imageW, 0, size.width, 29);
            } else {
                frame = CGRectMake(0, 0, size.width, 29);
            }
            UILabel *name = [[UILabel alloc] initWithFrame:frame];
            name.text = title;
            name.font = [UIFont systemFontOfSize:14];
            name.textColor = [UIColor whiteColor];
            [view addSubview:name];
            view.width = CGRectGetMaxX(name.frame);
        }
    } else {
        UILabel *name;
        if (title) {
            CGSize size = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
            name = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, 29)];
            name.text = title;
            name.textColor = [UIColor whiteColor];
            name.font = [UIFont systemFontOfSize:14];
            [view addSubview:name];
            view.width = CGRectGetMaxX(name.frame);
        }
        if (image) {
            CGRect frame;
            if (name) {
                frame = CGRectMake(name.width, 0, imageW, imageH);
            } else {
                frame = CGRectMake(0, 0, imageW, imageH);
            }
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:frame];
            imageV.image = [UIImage imageNamed:image];
            imageV.contentMode = UIViewContentModeScaleAspectFit;
            [view addSubview:imageV];
            view.width = CGRectGetMaxX(imageV.frame);
        }
    }
    if (isLeft == YES) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftClick)];
        [view addGestureRecognizer:tap];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    } else {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightClick)];
        [view addGestureRecognizer:tap];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    }
}

- (void)leftClick {
    
}
- (void)rightClick {
    
}

@end
