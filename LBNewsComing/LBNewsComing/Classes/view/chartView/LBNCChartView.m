//
//  LBNCChartView.m
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCChartView.h"
#import "LBNCChartCell.h"
#import "LBNCDuanziCell.h"
#import "LBNCChartViewModel.h"
#import "LBNCChartDetailController.h"
#import "LBNCDuanziViewModel.h"
#import "LBNCDuanziDetailController.h"
@interface LBNCChartView()
// 段子
@property (nonatomic, strong) UITableView *duanziTableView;
// 图文
@property (nonatomic, strong) UITableView *chartTableView;
@property (nonatomic, strong) LBNCChartViewModel *chartViewModel;
@property (nonatomic, strong) LBNCDuanziViewModel *duanziViewModel;

@end

@implementation LBNCChartView
// 构造函数
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 加载表视图
        [self setUpTableView];
        [_duanziTableView.mj_header beginRefreshing];
    }
    return self;
}
-(NSMutableArray *)dataArray{

    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}
-(NSMutableArray *)dataDuanziArray{
    if (_dataDuanziArray == nil) {
        _dataDuanziArray = [[NSMutableArray alloc]init];
    }
    return _dataDuanziArray;
}
// 懒加载
-(LBNCChartViewModel *)chartViewModel{

    if (_chartViewModel == nil) {
        _chartViewModel = [[LBNCChartViewModel alloc]init];
    }
    return _chartViewModel;
}
-(LBNCDuanziViewModel *)duanziViewModel{
    
    if (_duanziViewModel == nil) {
        _duanziViewModel = [[LBNCDuanziViewModel alloc]init];
    }
    return _duanziViewModel;
}

-(void)setIndex:(NSInteger)index{
    _index = index;
    [self setUpTableView];
    if (_index == 0) {
        [_duanziTableView.mj_header beginRefreshing];
    }else if(_index == 1){
        [_chartTableView.mj_header beginRefreshing];
    }
}
- (void)setUpTableView{

    if (_index == 0) {

            _duanziTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
            _duanziTableView.tableFooterView = [UIView new];
                _duanziTableView.delegate = self;
                _duanziTableView.dataSource = self;
                [self addSubview:_duanziTableView];
            [_duanziTableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
            _duanziTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                [self.duanziViewModel refreshDataCompletionHandler:^(NSError *error) {
                    if (!error) {
                        self.dataDuanziArray = self.duanziViewModel.dataMArr;
                        [_duanziTableView reloadData];
                    }
                    [_duanziTableView.mj_header endRefreshing];
                }];
                
            }];
            _duanziTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                [self.duanziViewModel getMoreDataCompletionHandler:^(NSError *error) {
                    if (!error) {
                        [_duanziTableView reloadData];
                    }
                    [_duanziTableView.mj_footer endRefreshing];
                }];
            }];

    }else if (_index == 1){
            _chartTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
            _chartTableView.tableFooterView = [UIView new];
            [self addSubview:_chartTableView];
            [_chartTableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
                make.bottom.mas_equalTo(-115);
            }];
            _chartTableView.delegate = self;
            _chartTableView.dataSource = self;
            _chartTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.chartViewModel refreshDataCompletionHandler:^(NSError *error) {
                if (!error) {
                    self.dataArray = self.chartViewModel.dataMArr;
                    [_chartTableView reloadData];
                }
                [_chartTableView.mj_header endRefreshing];
            }];

        }];
        _chartTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self.chartViewModel getMoreDataCompletionHandler:^(NSError *error) {
                if (!error) {
                    [_chartTableView reloadData];
                }
                [_chartTableView.mj_footer endRefreshing];
            }];
        }];
    }

}
// mark -- 估计cell高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _chartTableView) {
        return self.dataArray.count;
    }
    return _dataDuanziArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _chartTableView) {
        LBNCChartCell *cell = [LBNCChartCell cellWithTableView:(UITableView *)tableView];
        cell.chartModel = self.dataArray[indexPath.row];
        return cell;
    }
    LBNCDuanziCell *cell = [LBNCDuanziCell cellWithTableView:(UITableView *)tableView];
    cell.duanziModel = self.dataDuanziArray[indexPath.row];
    [cell.zanBtn bk_addEventHandler:^(id sender) {
        [cell.zanBtn setTitle:[NSString stringWithFormat:@"%ld",(cell.duanziModel.zan + 1)] forState:UIControlStateNormal];
        [self showSuccessWithMsg:@"点赞成功"];
    } forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_index == 0) {
        // 段子详情页
        LBNCDuanziDetailController *duanziDetailC = [[LBNCDuanziDetailController alloc] initWithContent:[self.dataDuanziArray[indexPath.row] text]];
        duanziDetailC.hidesBottomBarWhenPushed = YES;
        [self.viewController.navigationController pushViewController:duanziDetailC animated:YES];
    }else{
        // 图文详情页
        LBNCChartDetailController *chartDetailC = [[LBNCChartDetailController alloc] initWithChartModel:self.dataArray[indexPath.row]];
        chartDetailC.hidesBottomBarWhenPushed = YES;
        [self.viewController.navigationController pushViewController:chartDetailC animated:YES];
    }
}
@end
