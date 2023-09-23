//
//  AccountBookVC.m
//  Timi
//
//  Created by rongbang on 2023/9/6.
//

#import "AccountBookVC.h"
#import "AppDelegate.h"
@interface AccountBookVC ()

@end

@implementation AccountBookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账本";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = YES;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.baseVC toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}


@end
