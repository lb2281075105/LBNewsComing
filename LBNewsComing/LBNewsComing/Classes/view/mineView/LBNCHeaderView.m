//
//  LBNCHeaderView.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/21.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCHeaderView.h"
#import "LBNCSettingController.h"
#import "LBNCLoginRegisterController.h"
@implementation LBNCHeaderView{

    UIView *_headerView;
    UILabel *_label;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)addView{
    // 头部视图背景
    _headerView = [[UIView alloc] init];
    UIImageView *imgView = [UIImageView new];
//    imgView.image = [UIImage imageNamed :@"tableViewBackgroundImage"];
    imgView.backgroundColor = [UIColor orangeColor];
    [_headerView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    // 添加右上角设置按钮
    UIButton *setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [setBtn setBackgroundImage:[UIImage imageNamed:@"me_setting"]forState:UIControlStateNormal];
    [_headerView addSubview:setBtn];
    [setBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(25);
        make.right.mas_equalTo(-15);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
    // 为按钮添加监听事件
    [setBtn bk_addEventHandler:^(id sender) {
        LBNCSettingController *vc = [LBNCSettingController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.viewController.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    // 登录、注册按钮
    UIButton *myBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [myBtn setBackgroundImage:[UIImage imageNamed:@"login_portrait_ph"] forState:UIControlStateNormal];
    [_headerView addSubview:myBtn];
    [myBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(65, 65));
    }];
    [myBtn bk_addEventHandler:^(id sender) {
        if ([_label.text isEqualToString:@"注册/登陆"]) {
                LBNCLoginRegisterController *vc = [LBNCLoginRegisterController new];
                [self.viewController.navigationController pushViewController:vc animated:YES];
        }
    } forControlEvents:UIControlEventTouchUpInside];
    
    _label = [UILabel new];
    _label.text = @"注册/登陆";
    _label.font = kSubtitleFont;
    _label.textColor = [UIColor whiteColor];
    _label.textAlignment = NSTextAlignmentCenter;
    [_headerView addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(myBtn);
        make.width.mas_equalTo(65);
        make.top.mas_equalTo(myBtn.mas_bottom).mas_equalTo(5);
    }];
    
    [self addSubview:_headerView];
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(kWindowH/3);
    }];
}

@end
