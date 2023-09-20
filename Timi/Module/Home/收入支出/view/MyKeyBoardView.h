//
//  MyKeyBoardView.h
//  Timi
//
//  Created by rongbang on 2023/9/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyKeyBoardView : UIView
/**返回的字符串**/
@property (nonatomic, copy) void(^numberClickBackBlock)(NSString *str, BOOL isOK);
//toolbar的block
@property (nonatomic, copy) void(^btnClickBlock)(NSInteger tag);


@end

NS_ASSUME_NONNULL_END
