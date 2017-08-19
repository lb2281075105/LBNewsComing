//
//  LBNCNewsModel.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCNewsModel.h"

@implementation LBNCNewsModel

@end

@implementation HomeResultModel

/** 属性为数组 对应相应的解析类 */
+ (NSDictionary *)objectClassInArray{
    return @{@"newslist" : [HomeResultNewslistModel class], @"focusimg" : [HomeResultFocusimgModel class]};
}

@end

@implementation HomeResultHeadlineinfoModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}

@end

@implementation HomeResultTopnewsinfoModel

@end

@implementation HomeResultNewslistModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id", @"anewstype":@"newstype"};
}

@end

@implementation HomeResultFocusimgModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}

@end

