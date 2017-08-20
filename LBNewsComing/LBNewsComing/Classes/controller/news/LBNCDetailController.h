//
//  LBNCDetailController.h
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBNCDetailController : UIViewController
// 构造函数：初始化的时候把ID传进来
- (instancetype)initWithID:(NSInteger)ID;
@property (nonatomic) NSInteger ID;

@end
