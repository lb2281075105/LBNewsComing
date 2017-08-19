//
//  LBNCNewsViewModel.h
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//


#import "LBNCBaseViewModel.h"
#import "LBNCNewsNetManager.h"
@interface LBNCNewsViewModel : LBNCBaseViewModel
- (instancetype)initWithType:(LBNCNewsListType)type;
@property (nonatomic) LBNCNewsListType type;
@property (strong, nonatomic) NSString *updateTime;
@property (nonatomic) NSInteger page;

// 存放头部滚动图片数组
@property (strong, nonatomic) NSArray *headImgURLs;

// 头部是否有视图 
@property (nonatomic) BOOL hasHeadImg;
@end
