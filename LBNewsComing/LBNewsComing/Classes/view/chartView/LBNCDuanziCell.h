//
//  LBNCDuanziCell.h
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBNCDuanziModel.h"
@interface LBNCDuanziCell : UITableViewCell{
    
    UILabel *_contentLabel;
    UIButton *_zanBtn;
    UILabel *_dateLabel;
}
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *zanBtn;;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong)LBNCDuanziModel *duanziModel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
