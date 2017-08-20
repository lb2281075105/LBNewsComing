//
//  LBNCDuanziViewModel.m
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCDuanziViewModel.h"
#import "LBNCDuanziNetManager.h"
@implementation LBNCDuanziViewModel
- (void)getDataFromNetCompletionHandler:(completionHandler)completionHandler {
    self.dataTask = [LBNCDuanziNetManager getWordWithPage:self.page completionHandler:^(id model, NSError *error) {
        if (!error) {
            if (self.page == 1) {
                [self.dataMArr removeAllObjects];
            }
            [self.dataMArr addObjectsFromArray:model];
        }
        completionHandler(error);
    }];
}

- (void)refreshDataCompletionHandler:(completionHandler)completionHandler {
    self.page = 1;
    [self getDataFromNetCompletionHandler:completionHandler];
}

- (void)getMoreDataCompletionHandler:(completionHandler)completionHandler {
    self.page += 1;
    [self getDataFromNetCompletionHandler:completionHandler];
}

@end
