//
//  LBNCMineController.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCMineController.h"
#import "LBNCHeaderView.h"
#import "LBNCSettingController.h"
@interface LBNCMineController ()
@property (strong, nonatomic) LBNCHeaderView *headView;
@property (nonatomic, strong) UIButton *setButton;
@end

@implementation LBNCMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRGBColor(244, 244, 244);
}
- (instancetype)init {
    if (self = [super init]) {
        // 创建头部视图
        [self headView];
        [self setButton];
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 隐藏导航栏
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}

-(LBNCHeaderView *)headView{
    if (_headView == nil) {
        _headView = [[LBNCHeaderView alloc]init];
        [self.view addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
    }
    return _headView;
}

- (UIButton *)setButton{

    if (_setButton == nil) {
        _setButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _setButton.backgroundColor = [UIColor orangeColor];
        [_setButton bk_addEventHandler:^(id sender) {
            // 跳转设置控制器
            LBNCSettingController *vc = [LBNCSettingController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_setButton];
        [_setButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@0);
            make.top.equalTo(@240);
            make.height.equalTo(@50);
        }];
        // 添加图片
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:@"me_setting"];
        [self.view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_setButton.mas_left).offset(15);
            make.centerY.equalTo(_setButton.mas_centerY);
            make.height.width.equalTo(@30);
        }];
        UILabel *label = [[UILabel alloc]init];
        label.text = @"设置";
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).offset(10);
            make.centerY.equalTo(imageView.mas_centerY);
            make.right.equalTo(_setButton.mas_right).offset(-15);
        }];
    }
    return _setButton;
}

@end
