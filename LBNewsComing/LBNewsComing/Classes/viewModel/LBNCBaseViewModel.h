//
//  LBNCBaseModel.h
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^completionHandler)(NSError *error);
// mark -- 注意block delegate
@protocol BaseViewModelDelegate <NSObject>
@optional
// 获取数据
- (void)getDataFromNetCompletionHandler:(completionHandler)completionHandler;
// 刷新
- (void)refreshDataCompletionHandler:(completionHandler)completionHandler;
// 获取更多
- (void)getMoreDataCompletionHandler:(completionHandler)completionHandler;
@end
// MARK---<BaseViewModelDelegate>
@interface LBNCBaseViewModel : NSObject<BaseViewModelDelegate>
@property (strong, nonatomic) NSMutableArray *dataMArr;
@property (strong, nonatomic) NSMutableArray *topDataMArr;

@property (strong, nonatomic) NSURLSessionDataTask *dataTask;

// 取消任务
- (void)cacelTask;
// 暂停任务
- (void)suspendTask;
// 继续任务 
- (void)resumeTask;

@end
