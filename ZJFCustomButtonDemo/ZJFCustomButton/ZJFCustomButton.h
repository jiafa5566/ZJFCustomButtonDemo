//
//  ZJFCustomButton.h
//  GGSPlantform
//
//  Created by 简而言之 on 2017/5/3.
//  Copyright © 2017年 zhangmin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ZJFCustomButtonType) {
    ZJFCustomButtonTypeLeftTitle = 0, // 左边title 右边 imageView;
    ZJFCustomButtonTypeRightTitle,
    ZJFCustomButtonTypeTopTitle,
    ZJFCustomButtonTypeBottomTitle // 默认
};

@interface ZJFCustomButton : UIView
/**
 <#Description#>

 @param frame <#frame description#>
 @param buttonType <#buttonType description#>
 @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame type:(ZJFCustomButtonType )buttonType dataSource:(NSMutableArray *)dataArray;


/**
 item点击回调
 */
@property (nonatomic, copy) void (^didSelectBlock) (NSInteger indexPath_row);
@end
