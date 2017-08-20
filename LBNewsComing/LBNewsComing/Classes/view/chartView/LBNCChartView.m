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
@interface LBNCChartView()
// 段子
@property (nonatomic, strong) UITableView *duanziTableView;
// 图文
@property (nonatomic, strong) UITableView *chartTableView;
@property (nonatomic, strong) LBNCChartViewModel *chartViewModel;

@end

@implementation LBNCChartView
// 构造函数
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 加载表视图
        [self setUpTableView];
        [_chartTableView.mj_header beginRefreshing];
    }
    return self;
}
-(NSMutableArray *)dataArray{

    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}
// 懒加载
-(LBNCChartViewModel *)chartViewModel{

    if (_chartViewModel == nil) {
        _chartViewModel = [[LBNCChartViewModel alloc]init];
    }
    return _chartViewModel;
}
-(void)setIndex:(NSInteger)index{
    _index = index;
    [self setUpTableView];
    if (_index == 0) {
        
    }else if(_index == 1){
        [_chartTableView.mj_header beginRefreshing];
    }
}
- (void)setUpTableView{

    if (_index == 0) {
        if (_duanziTableView == nil) {
            _duanziTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
            _duanziTableView.delegate = self;
            _duanziTableView.dataSource = self;
            [self addSubview:_duanziTableView];
//            self.chartViewModel 
        }else{
            [self insertSubview:_duanziTableView aboveSubview:_chartTableView];
        }
        
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
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _chartTableView) {
        LBNCChartCell *cell = [LBNCChartCell cellWithTableView:(UITableView *)tableView];
        cell.chartModel = self.dataArray[indexPath.row];
        return cell;
    }
    LBNCDuanziCell *cell = [LBNCDuanziCell cellWithTableView:(UITableView *)tableView];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LBNCChartDetailController *chartDetailC = [[LBNCChartDetailController alloc] initWithChartModel:self.dataArray[indexPath.row]];
    [self.viewController.navigationController pushViewController:chartDetailC animated:YES];
}
@end
