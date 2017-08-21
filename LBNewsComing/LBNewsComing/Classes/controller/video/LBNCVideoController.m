//
//  LBNCVideoController.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCVideoController.h"
#import "LBNCVideoTableView.h"
#import "LBNCVideoViewModel.h"
@interface LBNCVideoController ()
// video视图
@property (nonatomic, strong) LBNCVideoTableView *videoTableView;
// video视图模型
@property (nonatomic, strong) LBNCVideoViewModel *videoViewModel;

@end

@implementation LBNCVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频";
    [self.videoTableView.mj_header beginRefreshing];
//    [self videoTableView];
}
-(LBNCVideoTableView *)videoTableView{

    if (_videoTableView == nil) {
        _videoTableView = [[LBNCVideoTableView alloc]init];
        [self.view addSubview:_videoTableView];
        _videoTableView.tableFooterView = [UIView new];
        [_videoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _videoTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.videoViewModel refreshDataCompletionHandler:^(NSError *error) {
                if (!error) {
                    _videoTableView.dataArray = self.videoViewModel.dataMArr;
                }
                [_videoTableView.mj_header endRefreshing];
            }];
        }];
        _videoTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self.videoViewModel getMoreDataCompletionHandler:^(NSError *error) {
                if (!error) {
                    _videoTableView.dataArray = self.videoViewModel.dataMArr;
                }
                [_videoTableView.mj_footer endRefreshing];
            }];
        }];
    }
    return _videoTableView;
}
- (LBNCVideoViewModel *)videoViewModel{
    if (_videoViewModel == nil) {
        _videoViewModel = [[LBNCVideoViewModel alloc]init];
    }
    return _videoViewModel;
}
@end
