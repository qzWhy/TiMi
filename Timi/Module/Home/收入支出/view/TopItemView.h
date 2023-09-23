//
//  TopItemView.h
//  Timi
//
//  Created by rongbang on 2023/9/18.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TopItemView : UIView

@property (nonatomic, strong) ItemModel *model;
@property (nonatomic, copy) NSString *str;
@end

NS_ASSUME_NONNULL_END
