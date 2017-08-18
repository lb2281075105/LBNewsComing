//
//  LBNCNewsNetManager.h
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//



#import "LBNCBaseNetManager.h"
#import "LBNCNewsModel.h"
typedef NS_ENUM(NSUInteger, LBNCNewsListType) {
    LBNCNewsListTypeZuiXin,  //最新
    LBNCNewsListTypeXinWen,     //新闻
    LBNCNewsListTypePingCe,     //评测
    LBNCNewsListTypeDaoGou,     //导购
    LBNCNewsListTypeYongChe,    //用车
    LBNCNewsListTypeJiShu,      //技术
    LBNCNewsListTypeWenHua,     //文化
    LBNCNewsListTypeGaiZhuang,  //改装
    LBNCNewsListTypeYouJi,      //游记
};
@interface LBNCNewsNetManager : LBNCBaseNetManager
+ (id)getNewsListType:(LBNCNewsListType)type lastTime:(NSString *)lastTime page:(NSInteger)page kCompletionHandler;
@end
