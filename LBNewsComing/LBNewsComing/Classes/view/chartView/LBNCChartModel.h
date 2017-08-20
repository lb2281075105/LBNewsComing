//
//  LBNCChartModel.h
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCBaseModel.h"

@interface LBNCChartModel : LBNCBaseModel

@property (nonatomic, copy) NSString *clientcover1;
@property (nonatomic, copy) NSString *datetime;
@property (nonatomic, copy) NSString *setname;
@property (nonatomic, copy) NSString *setid;
@property (nonatomic, copy) NSString *topicname;
@property (nonatomic, copy) NSString *pvnum;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *imgsum;
@property (nonatomic, copy) NSString *clientcover;
@property (nonatomic, copy) NSString *tcover;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *scover;
@property (nonatomic, copy) NSString *seturl;
@property (nonatomic, copy) NSString *createdate;
@property (nonatomic, strong) NSArray<NSURL *> *pics;
@property (nonatomic, copy) NSString *replynum;
@end
