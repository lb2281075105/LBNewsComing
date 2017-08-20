//
//  LBNCChartNetManager.m
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCChartNetManager.h"
#import "LBNCChartModel.h"
@implementation LBNCChartNetManager
+ (id)getPicWithSetID:(NSInteger)setID completionHandler:(void (^)(id, NSError *))completionHandler {
    NSString *path = [NSString stringWithFormat:@"http://c.3g.163.com/photo/api/morelist/0096/4GJ60096/%ld.json", setID];
    return [self get:path params:nil completionHandler:^(id responseObj, NSError *error) {
        // LBNCLog(@"%@",responseObj);
        completionHandler([LBNCChartModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}


@end
