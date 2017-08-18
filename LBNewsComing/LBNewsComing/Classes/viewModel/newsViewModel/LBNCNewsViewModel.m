//
//  LBNCNewsViewModel.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCNewsViewModel.h"

@implementation LBNCNewsViewModel
- (instancetype)initWithType:(LBNCNewsListType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSAssert1(NO, @"%s 必须使用initWithType方法初始化", __func__);
    }
    return self;
}

- (void)getDataFromNetCompletionHandler:(completionHandler)completionHandler{
    self.dataTask = [LBNCNewsNetManager getNewsListType:self.type lastTime:self.updateTime page:self.page completionHandler:^(HomeModel *model, NSError *error) {
        if (!error){
            if (self.page == 1) {
                [self.dataMArr removeAllObjects];
                NSMutableArray *mArr = [NSMutableArray new];
                for (HomeResultFocusimgModel *obj in model.result.focusimg) {
                    [mArr addObject:obj.imgurl];
                }
                self.headImgURLs = [mArr copy];
            }
            [self.dataMArr addObjectsFromArray:model.result.newslist];
        }
        completionHandler(error);
    }];
}
- (void)refreshDataCompletionHandler:(completionHandler)completionHandler {
    self.page = 1;
    self.updateTime = @"0";
    [self getDataFromNetCompletionHandler:completionHandler];
}
- (void)getMoreDataCompletionHandler:(completionHandler)completionHandler {
    self.page += 1;
    HomeResultNewslistModel * model = self.dataMArr.lastObject;
    self.updateTime = model.lasttime;
    [self getDataFromNetCompletionHandler:completionHandler];
}

- (BOOL)hasHeadImg {
    return self.headImgURLs.count != 0;
}

@end
