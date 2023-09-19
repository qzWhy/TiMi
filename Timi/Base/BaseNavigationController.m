//
//  BaseNavigationController.m
//  Timi
//
//  Created by rongbang on 2023/9/5.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationBar];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 如果不是根控制器, 就有返回按钮
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        self.navigationBar.topItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    }
    
    if (self.viewControllers.count == 1) {
      viewController.hidesBottomBarWhenPushed = YES;
    } else {
      viewController.hidesBottomBarWhenPushed = NO;
    }
    
    [super pushViewController:viewController animated:animated];
}


/**
 这个方法一旦设置就不能更改。慎用
 */
- (void)configNavigationBar {
    /** 两个设置导航栏背景颜色的方式 一、图片渲染 二、直接设置bartintcolor */
    //一、
    UIColor *navigationColor = [UIColor clearColor];
    [self.navigationBar setBackgroundImage:[[UIColor createImageWithColor:navigationColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    ///这里最好设置背景
    self.view.backgroundColor = navigationColor;
    //二、 ///这个方法设置的颜色在图片的下方
    [self.navigationBar setBarTintColor:[UIColor clearColor]];//设置导航栏背景的颜色
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    //设置导航栏title的字体及颜色i
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor darkGrayColor],NSForegroundColorAttributeName, [UIFont systemFontOfSize:18],NSFontAttributeName , nil]];
}


@end
