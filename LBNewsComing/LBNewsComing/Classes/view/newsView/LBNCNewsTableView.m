//
//  LBNCNewsTableView.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCNewsTableView.h"
#import "LBNCNewsCell.h"
#import "LBNCDetailController.h"
@implementation LBNCNewsTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}
- (void)setDataArray:(NSMutableArray *)dataArray{
    
    _dataArray = dataArray;
    [self reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
// mark -- 估计cell高度 
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LBNCNewsCell *cell = [LBNCNewsCell cellWithTableView:tableView];
    cell.newsListModel = self.dataArray[indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 跳转详情页面
    LBNCDetailController *vc = [[LBNCDetailController alloc] initWithID:[self.dataArray[indexPath.row]ID]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.viewController.navigationController pushViewController:vc animated:YES];
}
@end
