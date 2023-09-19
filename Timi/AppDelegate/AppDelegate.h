//
//  AppDelegate.h
//  Timi
//
//  Created by rongbang on 2023/9/5.
//

#import <UIKit/UIKit.h>
#import "ContainerViewController.h"
#import "BaseNavigationController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) ContainerViewController *baseVC;
@property (nonatomic, strong) BaseNavigationController *baseNav;
@end

