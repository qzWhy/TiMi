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

- (void)configNavigationBar {
    UIColor *titleColor = [UIColor colorWithHexString: @"000E18"];
    UINavigationBar *bar = self.navigationBar;
    UIColor *navigationColor = [UIColor clearColor];
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *barAppearance = [UINavigationBarAppearance new];
        [barAppearance configureWithTransparentBackground];
        barAppearance.backgroundImage = [UIColor createImageWithColor:navigationColor];
        barAppearance.shadowImage = [UIColor createImageWithColor:navigationColor];
        barAppearance.shadowColor = UIColor.clearColor;
        barAppearance.backgroundColor = navigationColor;
        barAppearance.largeTitleTextAttributes = @{NSForegroundColorAttributeName: [UIColor labelColor]};
        barAppearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor labelColor],NSFontAttributeName:[UIFont systemFontOfSize:18 weight:UIFontWeightMedium]};
        bar.tintColor = titleColor;
        // UINavigationBarAppearance 会覆盖原有的导航栏设置，这里需要重新设置返回按钮隐藏
        barAppearance.backButtonAppearance.normal.titlePositionAdjustment = UIOffsetMake(-1000, 0);
        bar.standardAppearance = barAppearance;
        bar.scrollEdgeAppearance = barAppearance;
        bar.compactAppearance = barAppearance;
        
    } else {
        // Fallback on earlier versions
        bar.tintColor = UIColor.whiteColor;
        bar.barTintColor = [UIColor colorWithHexString:@"F3595A"];
        bar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:18 weight:UIFontWeightMedium]};
    }
    /**这个是避免内容被导航栏遮盖**/
    bar.translucent = NO;
    
}


@end
