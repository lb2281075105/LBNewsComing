//
//  LBNCNewsNetManager.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCNewsNetManager.h"

@implementation LBNCNewsNetManager
+ (id)getNewsListType:(LBNCNewsListType)type lastTime:(NSString *)lastTime page:(NSInteger)page completionHandler:(void (^)(id, NSError *))completionHandler {
    NSString *path = nil;
    switch (type) {
        case LBNCNewsListTypeZuiXin: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt0-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case LBNCNewsListTypeXinWen: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt1-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case LBNCNewsListTypePingCe: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt3-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case LBNCNewsListTypeDaoGou: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt60-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case LBNCNewsListTypeYongChe: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt82-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case LBNCNewsListTypeJiShu: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt102-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case LBNCNewsListTypeWenHua: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt97-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case LBNCNewsListTypeGaiZhuang: {
            path = [NSString stringWithFormat: @"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt107-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case LBNCNewsListTypeYouJi: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt100-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        default: {
            break;
        }
    }
    
    return [self get:path params:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([LBNCBaseModel mj_objectWithKeyValues:responseObj], error);
    }];
}

@end
