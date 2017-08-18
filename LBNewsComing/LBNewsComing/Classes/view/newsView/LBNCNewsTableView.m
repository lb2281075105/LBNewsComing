//
//  LBNCNewsTableView.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCNewsTableView.h"
#import "LBNCNewsCell.h"
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
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LBNCNewsCell *cell = [LBNCNewsCell cellWithTableView:tableView];
    
    return cell;
    
}

@end
