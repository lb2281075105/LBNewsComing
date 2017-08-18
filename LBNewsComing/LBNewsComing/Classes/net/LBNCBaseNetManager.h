//
//  LBNCBaseNetManager.h
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kCompletionHandler completionHandler:(void(^)(id model, NSError *error))completionHandler
@interface LBNCBaseNetManager : NSObject
// 封装AFHTTPSessionManager的GET请求方法
+ (id)get:(NSString *)path params:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;
// 封装AFHTTPSessionManager的POST请求方法
+ (id)post:(NSString *)path params:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

/**
 *  有的服务器对于中文字符串不支持，需要转化字符串为带有%号形式
 *
 *  @param path  请求的路径
 *  @param params 请求的参数
 *
 *  @return 拼接出的字符串中的中文为%号形势（路径+参数）
 */
+ (NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params;
@end
