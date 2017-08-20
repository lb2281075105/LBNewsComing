//
//  LBNCVideoModel.m
//  LBNewsComing
//
//  Created by liubo on 2017/8/21.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCVideoModel.h"

@implementation LBNCVideoModel

/** 属性为数组 对应相应的解析类 */
+ (NSDictionary *)objectClassInArray{
    return @{@"videoSidList" : [VideoVideosidlistModel class], @"videoList" : [VideoVideolistModel class]};
}

@end

@implementation VideoVideosidlistModel

@end

@implementation VideoVideolistModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"desc":@"description"};
}

@end

