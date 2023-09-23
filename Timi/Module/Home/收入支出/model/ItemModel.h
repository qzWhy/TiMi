//
//  ItemModel.h
//  Timi
//
//  Created by rongbang on 2023/9/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemModel : NSObject

@property (nonatomic, copy) NSString *imgStr;
@property (nonatomic, copy) NSString *title;

/**获取plist文件中的图片文字字典**/
+ (NSDictionary *)getIconDictionary;
/**获取itemmodel数组 **/
+ (NSArray<ItemModel *> *)getItemDataSource;

@end

NS_ASSUME_NONNULL_END
