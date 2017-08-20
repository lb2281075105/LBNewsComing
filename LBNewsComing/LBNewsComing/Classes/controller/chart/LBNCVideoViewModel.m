//
//  LBNCVideoViewModel.m
//  LBNewsComing
//
//  Created by liubo on 2017/8/21.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCVideoViewModel.h"
#import "LBNCVideoNetManager.h"
#import "LBNCVideoModel.h"
@implementation LBNCVideoViewModel
- (void)getDataFromNetCompleteHandler:(completionHandler)completionHandler {
    self.dataTask = [LBNCVideoNetManager getVideoWithPage:self.page completionHandler:^(LBNCVideoModel *model, NSError *error) {
        if (!error) {
            if (self.page == 0) {
                [self.dataMArr removeAllObjects];
            }
            [self.dataMArr addObjectsFromArray:model.videoList];
        }
        completionHandler(error);
    }];
}
- (void)refreshDataCompletionHandler:(completionHandler)completionHandler {
    self.page = 0;
    [self getDataFromNetCompleteHandler:completionHandler];
}
- (void)getMoreDataCompletionHandler:(completionHandler)completionHandler {
    self.page += 10;
    [self getDataFromNetCompleteHandler:completionHandler];
}

@end
