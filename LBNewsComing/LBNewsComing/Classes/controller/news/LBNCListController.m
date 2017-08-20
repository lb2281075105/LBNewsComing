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
///轮播图
@property (strong, nonatomic) SDCycleScrollView *topScrollView;
@end

@implementation LBNCListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.newsTableView.mj_header beginRefreshing];
//    [self newsTableView];
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
        [self.view addSubview:_newsTableView];
        [_newsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(@0);
        }];
        // 上拉刷新
        _newsTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.newsViewModel refreshDataCompletionHandler:^(NSError *error) {
                if (!error) {
                    _newsTableView.tableHeaderView = [self setUpTableHeaderView];
                    self.newsTableView.dataArray = self.newsViewModel.dataMArr;
                }
                [_newsTableView.mj_header endRefreshing];
            }];
        }];
        // 下拉加载更多
        _newsTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self.newsViewModel getMoreDataCompletionHandler:^(NSError *error) {
                if (!error) {
                    self.newsTableView.dataArray = self.newsViewModel.dataMArr;
                }
                [_newsTableView.mj_footer endRefreshing];
            }];
        }];
        
    }
    return _newsTableView;
}
- (UIView *)setUpTableHeaderView{

    if (!self.newsViewModel.hasHeadImg) {
        return nil;
    }
    ///轮播图
    _topScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, [UIScreen cz_screenWidth], 190 * kHeight) delegate:nil placeholderImage:[UIImage imageNamed:@"http://pic49.nipic.com/file/20140927/19617624_230415502002_2.jpg"]];
    _topScrollView.backgroundColor = [UIColor orangeColor];
    _topScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _topScrollView.currentPageDotColor = [UIColor whiteColor];
    _topScrollView.imageURLStringsGroup = self.newsViewModel.headImgURLs;
    return _topScrollView;
}
@end
