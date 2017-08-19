//
//  LBNCListController.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCListController.h"
#import "LBNCNewsViewModel.h"
#import "LBNCNewsTableView.h"
@interface LBNCListController ()
@property (strong, nonatomic) LBNCNewsViewModel *newsViewModel;
@property (strong, nonatomic) LBNCNewsTableView *newsTableView;
@end

@implementation LBNCListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}
-(LBNCNewsViewModel *)newsViewModel{
    if (_newsViewModel == nil) {
        _newsViewModel = [[LBNCNewsViewModel alloc]initWithType:self.infoType.integerValue];
    }
    return _newsViewModel;
}
-(LBNCNewsTableView *)newsTableView{

    if (_newsTableView == nil) {
        _newsTableView = [[LBNCNewsTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_newsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(@0);
        }];
        // 上拉刷新
        _newsTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.newsViewModel refreshDataCompletionHandler:^(NSError *error) {
                if (!error) {
                    _newsTableView.tableHeaderView = [UIView new];
                }
            }];
        }];
        // 下拉加载更多
        
        [self.view addSubview:_newsTableView];
    }
    return _newsTableView;
}
- (UIView *)setUpTableHeaderView{

    if (!self.newsViewModel.hasHeadImg) {
        return nil;
    }

    return [UIView new];
    
    
}
@end
