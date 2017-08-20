//
//  LBNCChartViewModel.m
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCChartViewModel.h"
#import "LBNCChartNetManager.h"
#import "LBNCChartModel.h"
@implementation LBNCChartViewModel
- (void)getDataFromNetCompletionHandler:(completionHandler)completionHandler {
    self.dataTask = [LBNCChartNetManager getPicWithSetID:self.setID completionHandler:^(id model, NSError *error) {
        if (self.setID == 82259) {
            [self.dataMArr removeAllObjects];
        }
        [self.dataMArr addObjectsFromArray:model];
        completionHandler(error);
    }];
}
- (void)refreshDataCompletionHandler:(completionHandler)completionHandler {
    self.setID = 82259;
    [self getDataFromNetCompletionHandler:completionHandler];
}
-(void)getMoreDataCompletionHandler:(completionHandler)completionHandler {
    LBNCChartModel *model = self.dataMArr.lastObject;
    self.setID = model.setid.integerValue;
    [self getDataFromNetCompletionHandler:completionHandler];
}
@end
