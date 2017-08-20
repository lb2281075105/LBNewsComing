//
//  LBNCChartDetailController.m
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCChartDetailController.h"

@interface LBNCChartDetailController ()

@end

@implementation LBNCChartDetailController
- (instancetype)initWithChartModel:(LBNCChartModel *)chartModel{
    
    if (self = [super init]) {
        self.chartModel = chartModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [BarItem addBackItemToVC:self];
}


@end
