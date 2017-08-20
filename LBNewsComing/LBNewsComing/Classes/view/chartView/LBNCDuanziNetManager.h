//
//  LBNCDuanziNetManager.h
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCBaseNetManager.h"

@interface LBNCDuanziNetManager : LBNCBaseNetManager
+ (id)getWordWithPage:(NSInteger)page kCompletionHandler;
@end
