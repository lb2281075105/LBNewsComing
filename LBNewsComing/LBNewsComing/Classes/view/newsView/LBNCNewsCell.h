//
//  LBNCNewsCell.h
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBNCNewsModel.h"
@interface LBNCNewsCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
// 新闻列表模型
@property (nonatomic, strong)HomeResultNewslistModel *newsListModel;
@end
