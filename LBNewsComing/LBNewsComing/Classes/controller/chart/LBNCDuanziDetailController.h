//
//  LBNCDuanziDetailController.h
//  LBNewsComing
//
//  Created by liubo on 2017/8/21.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBNCDuanziDetailController : UIViewController
// 初始化的时候把内容传进来
// 构造函数
- (instancetype)initWithContent:(NSString *)content;
@property (strong, nonatomic) NSString *content;

@end
