//
//  ItemModel.m
//  Timi
//
//  Created by rongbang on 2023/9/22.
//

#import "ItemModel.h"

@interface ItemModel ()

@end

@implementation ItemModel

+ (NSDictionary *)getIconDictionary {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"IconImgDic" ofType:@"plist"];
    NSMutableDictionary *IconDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    return IconDic;
}

+ (NSArray<ItemModel *> *)getItemDataSource {
    NSMutableArray *mArr = [NSMutableArray array];
    NSDictionary *dic = [ItemModel getIconDictionary];
    //数组是无序的
    for (int i = 0 ; i < dic.allKeys.count; i++) {
        ItemModel *model = [ItemModel new];
        if (i == 0) {
            model.imgStr = @"type_big_0";
            model.title = @"一般";
        } else {        
            model.imgStr = dic.allKeys[i];
            model.title = dic.allValues[i];
        }
        [mArr addObject:model];
    }
    return mArr;
}

@end
