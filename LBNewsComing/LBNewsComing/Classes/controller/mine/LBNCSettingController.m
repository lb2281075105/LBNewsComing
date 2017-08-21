//
//  LBNCSettingController.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/21.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCSettingController.h"

@interface LBNCSettingController ()

@end

@implementation LBNCSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [BarItem addBackItemToVC:self];
    self.title = @"设置";
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 不隐藏导航栏
    self.navigationController.navigationBar.hidden = NO;
}

@end
