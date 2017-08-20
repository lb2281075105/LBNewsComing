//
//  LBNCVideoNetManager.m
//  LBNewsComing
//
//  Created by liubo on 2017/8/21.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCVideoNetManager.h"
#import "LBNCVideoModel.h"
@implementation LBNCVideoNetManager
+ (id)getVideoWithPage:(NSInteger)page completionHandler:(void (^)(id, NSError *))completionHandler {
    NSString *path = [NSString stringWithFormat:@"http://c.m.163.com/nc/video/home/%ld-10.html", page];
    return [self get:path params:nil completionHandler:^(id responseObj, NSError *error) {
        LBNCLog(@"视频：%@",responseObj);
        completionHandler([LBNCVideoModel mj_objectWithKeyValues:responseObj], error);
    }];
}

@end
