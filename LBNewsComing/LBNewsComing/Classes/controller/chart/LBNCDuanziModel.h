//
//  LBNCDuanziModel.h
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBNCDuanziModel : NSObject
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *thumbnail;
@property (nonatomic, copy) NSString *height;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, copy) NSString *width;
@property (nonatomic, copy) NSString *original;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *screen_name;
@property (nonatomic, assign) NSInteger zan;
@property (nonatomic, assign) NSInteger reposts;

@end
