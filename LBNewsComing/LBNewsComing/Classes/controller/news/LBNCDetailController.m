//
//  LBNCDetailController.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCDetailController.h"

@interface LBNCDetailController ()

@end

@implementation LBNCDetailController
-(instancetype)initWithID:(NSInteger)ID{
    self = [super init];
    if (self) {
        self.ID = ID;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新闻详情";
}

@end
