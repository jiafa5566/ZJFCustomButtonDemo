//
//  ViewController.m
//  ZJFCustomButtonDemo
//
//  Created by 简而言之 on 2017/5/3.
//  Copyright © 2017年 jiafa.apple. All rights reserved.
//

#import "ViewController.h"
#import "ZJFCustomButton.h"

@interface ViewController ()
@property (nonatomic, strong) ZJFCustomButton *topButtonView;
@property (nonatomic, strong) NSMutableArray<NSDictionary *> *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupSubViewsLayout];
    [self p_setupDidSelectedBlock];
}

- (void)setupSubViewsLayout
{
    [self.view addSubview:self.topButtonView];
    __weak typeof(self) weakSelf = self;
    [_topButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(60);
        make.left.and.right.equalTo(weakSelf.view);
        make.height.equalTo(@(80));
    }];
}

#pragma mark ----- PrivationMethod
- (void)p_setupDidSelectedBlock
{
    _topButtonView.didSelectBlock = ^(NSInteger indexPath_row) {
        switch (indexPath_row) {
            case 0:
            { // 第一个按钮
                NSLog(@"第一个按钮");
            }
                break;
            case 1:
            { // 第二个按钮
                NSLog(@"第二个按钮");
            }
                break;
            case 2:
            { // 第三个按钮
                NSLog(@"第三个按钮");
            }
            default:
                break;
        }
    };
}

#pragma mark ----- Getter
- (ZJFCustomButton *)topButtonView
{
    if (_topButtonView == nil) {
        _topButtonView = [[ZJFCustomButton alloc] initWithFrame:CGRectZero type:(ZJFCustomButtonTypeTopTitle) dataSource:self.dataArray];
    }
    return _topButtonView;
}

- (NSMutableArray<NSDictionary *> *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        NSDictionary *dic1 = @{@"image":@"ggs_wechat_share",@"title":@"左边"};
        NSDictionary *dic2 = @{@"image":@"ggs_wechat_friend",@"title":@"中间"};
        NSDictionary *dic3 = @{@"image":@"ggs_weibo_share",@"title":@"右边"};
        _dataArray = [NSMutableArray arrayWithArray:@[dic1,dic2,dic3]];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
