//
//  UNTextView.h
//  Timi
//
//  Created by rongbang on 2023/9/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UNTextView : UITextView

@property (nonatomic, copy) NSString *placeHolder;
@property (nonatomic, strong) UIFont *placeHolderFont;
@property (nonatomic, strong) UIColor *placeHolderColor;

@end

NS_ASSUME_NONNULL_END
