//
//  ZJFCustomCollectionViewCell.m
//  GGSPlantform
//
//  Created by 简而言之 on 2017/5/3.
//  Copyright © 2017年 zhangmin. All rights reserved.
//

#import "ZJFCustomCollectionViewCell.h"
@interface ZJFCustomCollectionViewCell()
/** imageView */
@property (nonatomic, strong) UIImageView *imageView;
/** title */
@property (nonatomic, strong) UILabel *titlelabel;
@end
@implementation ZJFCustomCollectionViewCell

+ (ZJFCustomCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ZJFCustomCollectionViewCell";
    ZJFCustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ZJFCustomCollectionViewCell alloc] init];
    }
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self cellWithSubViewLayout];
    }
    return self;
}

- (void)cellWithSubViewLayout
{
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titlelabel];
}

#pragma mark ----- privationMethod
- (void)setDataWithArray:(NSDictionary *)dataDictory type:(NSInteger )type
{
    __weak typeof(self) weakSlef = self;
    switch (type) {
        case 0:
        {
            [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(weakSlef.contentView.mas_centerY);
                make.right.equalTo(weakSlef.contentView.mas_right);
                make.width.equalTo(@(CGRectGetWidth(weakSlef.contentView.frame) * 0.6));
                make.height.equalTo(weakSlef.imageView.mas_width);
            }];
            [_titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(weakSlef.imageView.mas_centerY);
                make.right.equalTo(weakSlef.imageView.mas_left);
                make.left.equalTo(weakSlef.contentView.mas_left);
            }];
        }
            break;
        case 1:
        {
            [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(weakSlef.contentView.mas_centerY);
                make.left.equalTo(weakSlef.contentView.mas_left);
                make.width.equalTo(@(CGRectGetWidth(weakSlef.contentView.frame) * 0.6));
                make.height.equalTo(weakSlef.imageView.mas_width);
            }];
            [_titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(weakSlef.imageView.mas_centerY);
                make.right.equalTo(weakSlef.contentView.mas_right);
                make.left.equalTo(weakSlef.imageView.mas_right);
            }];
        }
            break;
        case 2:
        {
            [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(weakSlef.contentView.mas_centerX);
                make.bottom.equalTo(weakSlef.contentView.mas_bottom);
                make.height.equalTo(@(CGRectGetHeight(weakSlef.contentView.frame) - 25));
                make.width.equalTo(weakSlef.imageView.mas_height);
            }];
            [_titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.equalTo(weakSlef.contentView);
            }];
        }
            break;
        case 3:
        {
            [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(weakSlef.contentView);
                make.centerX.equalTo(weakSlef.contentView.mas_centerX);
                make.height.equalTo(@(CGRectGetHeight(weakSlef.frame) - 25));
                make.width.equalTo(weakSlef.imageView.mas_height);
            }];
            [_titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(weakSlef.contentView);
            }];
        }
            break;
            break;
    }
    _imageView.image = [UIImage imageNamed:dataDictory[@"image"]];
    _titlelabel.text = dataDictory[@"title"];
}
#pragma mark ----- Getter
- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)titlelabel
{
    if (_titlelabel == nil) {
        _titlelabel = [[UILabel alloc] init];
        _titlelabel.textAlignment = NSTextAlignmentCenter
        ;
    }
    return _titlelabel;
}

@end
