//
//  BaseTabBarController.m
//  Timi
//
//  Created by rongbang on 2023/9/5.
//

#import "BaseTabBarController.h"
#import "HomeViewController.h"
#import "ShopViewController.h"
#import "MineViewController.h"
#import "BaseNavigationController.h"
#import <MMDrawerController/MMDrawerController.h>
#import "AccountBookVC.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addViewController];
}

- (void)addViewController {
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    AccountBookVC *vc = [AccountBookVC new];
    BaseNavigationController *accNav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    HomeViewController *home = [HomeViewController new];
    BaseNavigationController *HomeNav = [[BaseNavigationController alloc] initWithRootViewController:home];
    MMDrawerController *drawerController = [[MMDrawerController alloc] initWithCenterViewController:HomeNav leftDrawerViewController:accNav];
    /** 设置打开/关闭抽屉的手势 */
    drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    drawerController.showsShadow = NO;
    /** 设置左边抽屉显示的多少 */
    drawerController.maximumLeftDrawerWidth = UNScreenWidth;
    drawerController.title = @"首页";
    [drawerController.tabBarItem setImage:[[UIImage imageNamed:@"jizhang-unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [drawerController.tabBarItem setSelectedImage:[[UIImage imageNamed:@"jizhang"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    ShopViewController *shop = [ShopViewController new];
    shop.title = @"首页";
    [shop.tabBarItem setImage:[[UIImage imageNamed:@"gouwuche_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [shop.tabBarItem setSelectedImage:[[UIImage imageNamed:@"gouwuche"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    BaseNavigationController *shopNavig = [[BaseNavigationController alloc] initWithRootViewController:shop];
    
    
    MineViewController *mine = [MineViewController new];
    mine.title = @"我的";
    [mine.tabBarItem setImage:[[UIImage imageNamed:@"wode_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [mine.tabBarItem setSelectedImage:[[UIImage imageNamed:@"wode"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    BaseNavigationController *mineNavig = [[BaseNavigationController alloc] initWithRootViewController:mine];
    
    self.viewControllers = @[drawerController,shopNavig,mineNavig];
}

@end
