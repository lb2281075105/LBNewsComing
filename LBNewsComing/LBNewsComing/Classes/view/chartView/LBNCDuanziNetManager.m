//
//  LBNCDuanziNetManager.m
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCDuanziNetManager.h"
#import "LBNCDuanziModel.h"
@implementation LBNCDuanziNetManager
+ (id)getWordWithPage:(NSInteger)page completionHandler:(void (^)(id, NSError *))completionHandler {
    NSString *path = [NSString stringWithFormat:@"http://joke.luckyamy.com/api/?cat=dz&p=%ld&ap=ymds&ver=1.6", page];
    return [self get:path params:nil completionHandler:^(id responseObj, NSError *error) {
        // LBNCLog(@"%@",responseObj);
        completionHandler([LBNCDuanziModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

@end
