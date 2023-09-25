//
//  UNProgressHUD.h
//  Timi
//
//  Created by rongbang on 2023/9/25.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>
NS_ASSUME_NONNULL_BEGIN

@interface UNProgressHUD : NSObject

@property (nonatomic,strong) MBProgressHUD  *hud;

@property (nonatomic, strong) UIView *hudView;

+ (instancetype)shareInstance;

+ (void)showInfo:(NSString *)info;

+ (void)showLoadingWithInfo:(NSString *)info;

+ (void)showInfo:(NSString *)info inView:(UIView *)view;

+ (void)showInfo:(NSString *)info inView:(UIView *)view delay:(NSInteger)delay;

//隐藏
+(void)hideHUD;
@end

NS_ASSUME_NONNULL_END
