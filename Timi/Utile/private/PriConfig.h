//
//  PriConfig.h
//  BaseProject
//
//  Created by 范庆忠 on 2019/7/28.
//  Copyright © 2019 qingzhou. All rights reserved.
//

#ifndef PriConfig_h
#define PriConfig_h


#define UNScreenWidth [UIScreen mainScreen].bounds.size.width
#define UNScreenHeight [UIScreen mainScreen].bounds.size.height

#define IS_iPhoneX  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?\
(\
CGSizeEqualToSize(CGSizeMake(375, 812),[UIScreen mainScreen].bounds.size)\
||\
CGSizeEqualToSize(CGSizeMake(812, 375),[UIScreen mainScreen].bounds.size)\
||\
CGSizeEqualToSize(CGSizeMake(414, 896),[UIScreen mainScreen].bounds.size)\
||\
CGSizeEqualToSize(CGSizeMake(896, 414),[UIScreen mainScreen].bounds.size))\
:\
NO)

#define UNNavBarHeight       (IS_iPhoneX ? 88.0f : 64.0f)

//  适配比例
#define ADAPTATIONRATIO     UNScreenWidth / 750.0f

#define UNBaseHeaderHeight  UNScreenWidth * 385.0f / 704.0f
#define UNBaseSegmentHeight 40.0f

// 颜色
#define QZColorRGBA(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]
#define QZColorRGB(r, g, b)     QZColorRGBA(r, g, b, 1.0)
#define QZColorGray(v)          QZColorRGB(v, v, v)

#define QZColorHEX(hexValue, a) QZColorRGBA(((float)((hexValue & 0xFF0000) >> 16)), ((float)((hexValue & 0xFF00) >> 8)), ((float)(hexValue & 0xFF)), a)

#define QZColorRandom           QZColorRGB(arc4random() % 255, arc4random() % 255, arc4random() % 255)

#define HEXCOLOR(hexValue,a) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0  blue:((float)(hexValue & 0xFF))/255.0 alpha:a]

#define kRefreshDuration   0.5f

#pragma mark - 版本比较
/** 版本比较*/
//等于
#define UNSYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
//大于
#define UNSYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
//大于等于
#define UNSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
//小于
#define UNSYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
//小于等于
#define UNSYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
//大于等于8.0的版本
#define UNIOS8_OR_LATER UNSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")
//大于等于10.0的版本
#define UNIOS10_OR_LATER UNSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")

#endif /* PriConfig_h */
