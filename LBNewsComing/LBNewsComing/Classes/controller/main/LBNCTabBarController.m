//
//  LBNCTabBarController.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCTabBarController.h"
#import "LBNCNavController.h"
#import "LBNCChartController.h"
#import "LBNCMineController.h"
#import "LBNCNewsController.h"
#import "LBNCVideoController.h"

@interface LBNCTabBarController ()

@end

@implementation LBNCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllers];
}

- (void)addChildViewControllers{
    ///新闻
    [self addChildViewController:[[LBNCNewsController alloc]init] withNormalImage:@"news" withSelectImage:@"newsblue" withTitle:@"新闻来了"];
    ///图文
    [self addChildViewController:[[LBNCChartController alloc]init] withNormalImage:@"live" withSelectImage:@"liveblue" withTitle:@"图文"];
    ///我的
    [self addChildViewController:[[LBNCMineController alloc]init] withNormalImage:@"my" withSelectImage:@"myblue" withTitle:@"视频"];
    ///视频
    [self addChildViewController:[[LBNCVideoController alloc]init] withNormalImage:@"market" withSelectImage:@"marketblue" withTitle:@"我的"];
}
///添加子控制器
- (void)addChildViewController:(UIViewController *)childController withNormalImage:(NSString *)normalImage withSelectImage:(NSString *)selectImage withTitle:(NSString *)title{
    
    childController.tabBarItem.image = [UIImage imageNamed:normalImage];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    childController.title = title;
    
    LBNCNavController *nav = [[LBNCNavController alloc]initWithRootViewController:childController];
    [self addChildViewController:nav];
}




@end
