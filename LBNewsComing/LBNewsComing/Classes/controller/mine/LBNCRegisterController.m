//
//  LBNCRegisterController.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/21.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCRegisterController.h"
#import "LBNCMineController.h"
@interface LBNCRegisterController ()

@property (strong, nonatomic) UITextField *usernameTF;
@property (strong, nonatomic) UITextField *passwdTF;
@property (strong, nonatomic) UIButton *registerBtn;

@end

@implementation LBNCRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    [BarItem addBackItemToVC:self];
    self.view.backgroundColor = kRGBColor(236, 236, 236);
    
    [self usernameTF];
    [self passwdTF];
    [self registerBtn];
}

#pragma mark - 懒加载
- (UITextField *)usernameTF {
    if(_usernameTF == nil) {
        _usernameTF = [[UITextField alloc] init];
        _usernameTF.borderStyle = UITextBorderStyleRoundedRect;
        _usernameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _usernameTF.backgroundColor = [UIColor whiteColor];
        _usernameTF.placeholder = @"    请输入您的用户名";
        [self.view addSubview:_usernameTF];
        [_usernameTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _usernameTF;
}

- (UITextField *)passwdTF {
    if(_passwdTF == nil) {
        _passwdTF = [[UITextField alloc] init];
        _passwdTF.borderStyle = UITextBorderStyleRoundedRect;
        _passwdTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwdTF.secureTextEntry = YES;
        _passwdTF.placeholder = @"    请输入您的密码";
        _passwdTF.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_passwdTF];
        [_passwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.usernameTF.mas_bottom).mas_equalTo(2);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _passwdTF;
}

- (UIButton *)registerBtn {
    if(_registerBtn == nil) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn.layer setMasksToBounds:YES];
        [_registerBtn.layer setCornerRadius:5];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setBackgroundColor:kRGBColor(27, 116, 194)];
        [self.view addSubview:_registerBtn];
        [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.passwdTF.mas_bottom).mas_equalTo(20);
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
        }];
        [_registerBtn bk_addEventHandler:^(id sender) {
            
            BmobUser *bUser = [BmobUser new];
            [bUser setUsername:self.usernameTF.text];
            [bUser setPassword:self.passwdTF.text];
            [bUser signUpInBackgroundWithBlock:^(BOOL isSuccessful, NSError *error) {
                if (isSuccessful) {
                    LBNCMineController *vc = [LBNCMineController new];
                    vc.label.text = self.usernameTF.text;
                    [self.navigationController pushViewController:vc animated:YES];
                }else {
                    if ([self.usernameTF.text isEqualToString:@""] && [self.passwdTF.text isEqualToString:@""]) {
                        [self showSuccessWithMsg:@"请输入用户名和密码"];
                    }else if ([self.passwdTF.text isEqualToString:@""]) {
                        [self showSuccessWithMsg:@"请输入密码"];
                    }else if ([self.usernameTF.text isEqualToString:@""]) {
                        [self showSuccessWithMsg:@"请输入用户名"];
                    }else {
                        [self showSuccessWithMsg:@"用户名已存在"];
                    }
                }
            }];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}
@end
