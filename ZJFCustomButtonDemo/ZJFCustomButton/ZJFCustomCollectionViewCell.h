//
//  ZJFCustomCollectionViewCell.h
//  GGSPlantform
//
//  Created by 简而言之 on 2017/5/3.
//  Copyright © 2017年 zhangmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJFCustomCollectionViewCell : UICollectionViewCell

+ (ZJFCustomCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

/** 设置数据 */
- (void)setDataWithArray:(NSDictionary *)dataDictory type:(NSInteger )type;
@end
