//
//  LBNCVideoCell.h
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBNCVideoModel.h"
#import "LBNCImageView.h"
#import "LBNCVideoModel.h"
@interface LBNCVideoCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
// 新闻列表模型
@property (nonatomic, strong)VideoVideolistModel *videoListModel;
@property (strong, nonatomic) LBNCImageView *iconIV;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *subtitleLabel;
@property (strong, nonatomic) UILabel *timeLabel;

@end
