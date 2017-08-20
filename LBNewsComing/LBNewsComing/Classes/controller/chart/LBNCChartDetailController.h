//
//  LBNCChartDetailController.h
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBNCChartModel.h"
@interface LBNCChartDetailController : UIViewController
- (instancetype)initWithChartModel:(LBNCChartModel *)chartModel;
@property (strong, nonatomic) LBNCChartModel *chartModel;

@end
