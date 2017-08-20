//
//  LBNCChartCell.m
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCChartCell.h"
#import "LBNCChartModel.h"
#import <UIImageView+WebCache.h>
@implementation LBNCChartCell{

    LBNCImageView *_iconIV;
    UILabel *_titleLabel;
    UILabel *_browseNum;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{

    LBNCChartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LBNCChartCell"];
    if (cell == nil) {
        cell = [[LBNCChartCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LBNCChartCell"];
    }
    return cell;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(void)setChartModel:(LBNCChartModel *)chartModel{
    _chartModel = chartModel;
    [_iconIV.imageView sd_setImageWithURL:_chartModel.pics[0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    _titleLabel.text = _chartModel.setname;
    _browseNum.text = [NSString stringWithFormat:@"%@浏览",_chartModel.replynum];
}
-(void)layoutSubviews{
    [super layoutSubviews];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layOutSubviews];
    }
    return self;
}
- (void)layOutSubviews{
    // 图片
    _iconIV = [[LBNCImageView alloc] init];
    [self.contentView addSubview:_iconIV];
    [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(2);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(200);
    }];
    // 标题
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = kTitleFont;
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(kWindowW/3*2);
        make.top.mas_equalTo(_iconIV.mas_bottom).mas_equalTo(15);
        make.bottom.mas_equalTo(-10);
    }];
    // 浏览数
    _browseNum = [[UILabel alloc] init];
    _browseNum.textColor = [UIColor lightGrayColor];
    _browseNum.textAlignment = NSTextAlignmentRight;
    _browseNum.font = kSubtitleFont;
    [self.contentView addSubview:_browseNum];
    [_browseNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_titleLabel);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(65);
    }];
}
@end
