//
//  LBNCNavController.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCNavController.h"

@interface LBNCNavController ()

@end

@implementation LBNCNavController
+(void)initialize{
    // 导航背景
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"backgroundImage"] forBarMetrics:UIBarMetricsDefault];
    // 导航栏title字体大小
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    // 状态栏颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
