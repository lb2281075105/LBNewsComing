//
//  LBNCNewsTableView.h
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBNCNewsTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@end
