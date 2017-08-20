//
//  LBNCVideoNetManager.h
//  LBNewsComing
//
//  Created by liubo on 2017/8/21.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCBaseNetManager.h"

@interface LBNCVideoNetManager : LBNCBaseNetManager
+ (id)getVideoWithPage:(NSInteger)page kCompletionHandler;

@end
