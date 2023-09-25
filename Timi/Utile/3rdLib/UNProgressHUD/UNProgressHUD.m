//
//  UNProgressHUD.m
//  Timi
//
//  Created by rongbang on 2023/9/25.
//

#import "UNProgressHUD.h"

#define delayTime 3

@implementation UNProgressHUD

+ (instancetype)shareInstance {
    static UNProgressHUD *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[UNProgressHUD alloc] init];
    });
    return instance;
}

+ (void)showInfo:(NSString *)info {
    UIWindow *view = [Tool lastWindow];
    [UNProgressHUD showInfo:info inView:view];
}

+ (void)showLoadingWithInfo:(NSString *)info {
    UIWindow *view = [Tool lastWindow];
    [UNProgressHUD showInfo:info inView:view mode:MBProgressHUDModeIndeterminate];
}

+ (void)showInfo:(NSString *)info inView:(UIView *)view delay:(NSInteger)delay;{
    [UNProgressHUD showInfo:info inView:view mode:MBProgressHUDModeText];
    [UNProgressHUD hideHUDWithDelay:delayTime];
}

+ (void)showInfo:(NSString *)info inView:(UIView *)view{
    [UNProgressHUD showInfo:info inView:view mode:MBProgressHUDModeText];
    [UNProgressHUD hideHUDWithDelay:delayTime];
}

+ (void)showInfo:(NSString *)info inView:(UIView *)view mode:(MBProgressHUDMode)mode {
    MBProgressHUD *hud = [UNProgressHUD shareInstance].hud;
    if (hud) {
        [hud hideAnimated:YES];
        hud = nil;
    }
    hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = mode;
    hud.userInteractionEnabled = NO;
    hud.bezelView.color = UIColor.blackColor;
    hud.bezelView.blurEffectStyle = UIBlurEffectStyleDark;
     
    hud.label.text = info;
    hud.label.textColor = [UIColor whiteColor];
    hud.margin = 10.f;
    hud.offset = CGPointMake(hud.offset.x, 150.f);
    hud.removeFromSuperViewOnHide = NO;
    [UNProgressHUD shareInstance].hud = hud;
}

+ (void)hideHUD {
    [UNProgressHUD hideHUDWithDelay:0];
}

+ (void)hideHUDWithDelay:(NSInteger)delay {

    [UNProgressHUD shareInstance].hud.userInteractionEnabled = YES;
    [[UNProgressHUD shareInstance].hud hideAnimated:YES afterDelay:delay];
}
@end
