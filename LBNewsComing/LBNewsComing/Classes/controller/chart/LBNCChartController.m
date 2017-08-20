//
//  LBNCChartController.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCChartController.h"
#import "LBNCChartView.h"
@interface LBNCChartController ()
// 分段控制视图
@property (strong, nonatomic) UISegmentedControl *sc;
@property (nonatomic, strong) LBNCChartView *chartView;
@end

@implementation LBNCChartController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加分段控住视图
    [self addSC];
    [self chartView];
}
// 懒加载
-(LBNCChartView *)chartView{

    if (_chartView == nil) {
        _chartView = [[LBNCChartView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen cz_screenWidth], [UIScreen cz_screenHeight])];
        [self.view addSubview:_chartView];
    }
    return _chartView;
}

- (void)addSC{

    if (_sc == nil) {
        NSArray *arr = [NSArray arrayWithObjects:@"段子",@"图片", nil];
        _sc = [[UISegmentedControl alloc] initWithItems:arr];
        _sc.frame = CGRectMake(0, 0, 150, 30);
        _sc.selectedSegmentIndex = 0;
        _sc.tintColor = [UIColor whiteColor];
        [_sc bk_addEventHandler:^(id sender) {
            self.chartView.index = _sc.selectedSegmentIndex;
        } forControlEvents:UIControlEventValueChanged];
        [self.navigationItem setTitleView:_sc];
    }
}
@end
