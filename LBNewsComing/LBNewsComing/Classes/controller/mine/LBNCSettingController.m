//
//  LBNCSettingController.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/21.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCSettingController.h"

@interface LBNCSettingController (){

    UILabel *_label;
    NSString *_str;
}
@property (nonatomic, strong) UIButton *clearButton;
@property (strong, nonatomic) UIButton *exitBtn;

@end

@implementation LBNCSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [BarItem addBackItemToVC:self];
    self.title = @"设置";
    // 清除缓存
    [self clearButton];
    // 退出按钮
    [self exitBtn];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 不隐藏导航栏
    self.navigationController.navigationBar.hidden = NO;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        // 缓存路径
        NSString *cachepath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
         _str = [NSString stringWithFormat:@"%.2fM", [self folderSizeAtPath:cachepath]];
    }
    return self;
}
- (UIButton *)clearButton{
    
    if (_clearButton == nil) {
        _clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _clearButton.backgroundColor = [UIColor orangeColor];
        [_clearButton bk_addEventHandler:^(id sender) {
            // 是否清除缓存
            [self cleanCaches];
        } forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_clearButton];
        [_clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@0);
            make.top.equalTo(@200);
            make.height.equalTo(@50);
            make.width.equalTo(@60);
        }];
        // 清理缓存
        UILabel *clearLabel = [[UILabel alloc]init];
        clearLabel.text = @"清除缓存";
        [self.view addSubview:clearLabel];
        [clearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_clearButton.mas_left).offset(15);
            make.centerY.equalTo(_clearButton.mas_centerY);
            make.height.width.equalTo(@70);
        }];
        _label = [[UILabel alloc]init];
        _label.text = _str;
        [self.view addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(clearLabel.mas_centerY);
            make.right.equalTo(_clearButton.mas_right).offset(-15);
        }];
    }
    return _clearButton;
}
- (UIButton *)exitBtn {
    if(_exitBtn == nil) {
        _exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_exitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [_exitBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _exitBtn.titleLabel.font = kTitleFont;
        [self.view addSubview:_exitBtn];
        [_exitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_clearButton.mas_bottom).mas_equalTo(10);
            make.centerX.mas_equalTo(0);
        }];
        // 返回到上一级
        [_exitBtn bk_addEventHandler:^(id sender) {
            [self.navigationController popViewControllerAnimated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _exitBtn;
}

// 清理缓存
- (void)cleanCaches {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"清理缓存" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        return;
    }];
    UIAlertAction *ensureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
            NSFileManager *manager = [NSFileManager defaultManager];
            NSArray *files = [manager subpathsAtPath:cachePath];
            for (NSString *p in files) {
                NSError *error = nil;
                NSString *path = [cachePath stringByAppendingPathComponent:p];
                if ([manager fileExistsAtPath:path]) {
                    [manager removeItemAtPath:path error:&error];
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                _label.text = @"0.00M";
            });
        });
        
        [self showSuccessWithMsg:@"清理成功"];
    }];
    [ac addAction:cancelAction];
    [ac addAction:ensureAction];
    [self presentViewController:ac animated:YES completion:nil];
}

- (long long)fileSizeAtPath:(NSString*)filePath {
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

// 遍历文件夹获得文件夹大小，返回多少M
- (float )folderSizeAtPath:(NSString*)folderPath {
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}

@end
