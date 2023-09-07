//
//  AppDelegate.m
//  Timi
//
//  Created by rongbang on 2023/9/5.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.rootViewController = [BaseTabBarController new];
    [self.window makeKeyAndVisible];
    return YES;
}




@end
