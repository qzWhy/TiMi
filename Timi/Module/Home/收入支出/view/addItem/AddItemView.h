//
//  AddItemView.h
//  Timi
//
//  Created by rongbang on 2023/9/22.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddItemView : UIView

/**传值的话就不需要再查询字典  **/
@property (nonatomic, copy) void(^selectItemBlock)(ItemModel *model,BOOL isLast);

@end

NS_ASSUME_NONNULL_END
