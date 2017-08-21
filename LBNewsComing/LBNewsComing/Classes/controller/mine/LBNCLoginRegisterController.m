//
//  LBNCLoginRegisterController.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/21.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCLoginRegisterController.h"

@interface LBNCLoginRegisterController ()

@end

@implementation LBNCLoginRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人资料";
    [BarItem addBackItemToVC:self];
    self.view.backgroundColor = kRGBColor(236, 236, 236);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 不隐藏导航栏
    self.navigationController.navigationBar.hidden = NO;
}

@end
