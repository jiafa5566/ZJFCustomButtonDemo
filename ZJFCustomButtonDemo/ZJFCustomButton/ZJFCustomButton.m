//
//  ZJFCustomButton.m
//  GGSPlantform
//
//  Created by 简而言之 on 2017/5/3.
//  Copyright © 2017年 zhangmin. All rights reserved.
//

#import "ZJFCustomButton.h"
#import "ZJFCustomCollectionViewCell.h"
@interface ZJFCustomButton()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
/** 按钮类型 */
@property (nonatomic, assign) ZJFCustomButtonType buttonType;
/** 显示Item */
@property (nonatomic, assign) NSMutableArray *listDataArray;
@end

@implementation ZJFCustomButton

- (instancetype)initWithFrame:(CGRect)frame type:(ZJFCustomButtonType)buttonType dataSource:(NSMutableArray *)dataArray
{
    self = [super initWithFrame:frame];
    if (self) {
        _buttonType = buttonType;
        _listDataArray = dataArray;
        [self setupSubViewsLayout];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:CGRectZero type:ZJFCustomButtonTypeBottomTitle dataSource:nil];
}

/** 添加子视图 */
- (void)setupSubViewsLayout
{
    [self addSubview:self.collectionView];
    __weak typeof(self) weakSelf = self;
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark ----- UICollectionViewDelegate
- (NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.listDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZJFCustomCollectionViewCell *cell = [ZJFCustomCollectionViewCell cellWithCollectionView:collectionView indexPath:indexPath];
    [cell setDataWithArray:self.listDataArray[indexPath.row] type:_buttonType];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.didSelectBlock) {
        self.didSelectBlock(indexPath.row);
    }
}


#pragma mark ----- Getter
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/(self.listDataArray.count * 1.0), 80);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        // 注册cell
        static NSString *identifier = @"ZJFCustomCollectionViewCell";
        [_collectionView registerClass:[ZJFCustomCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    }
    return _collectionView;
}

- (NSMutableArray *)listDataArray
{
    if (_listDataArray == nil) {
        _listDataArray = [NSMutableArray array];
    }
    return _listDataArray;
}

@end
