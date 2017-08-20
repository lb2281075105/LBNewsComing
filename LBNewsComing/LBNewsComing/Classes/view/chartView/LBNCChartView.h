//
//  LBNCChartView.h
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBNCChartView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end
