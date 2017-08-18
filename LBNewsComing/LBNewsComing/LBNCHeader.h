//
//  LBNCHeader.h
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

///宏定义

///判断是不是开发、调试状态，如果是开发、调试状态，就让LBNCLog替换NSLog
#ifdef DEBUG
///LBNCLog是不限制参数的，中间用三个英文句号表示
#define LBNCLog(...) NSLog(__VA_ARGS__)
///如果是发布状态LBNCLog就直接为空
#elif
#define LBNCLog(...)
#endif
