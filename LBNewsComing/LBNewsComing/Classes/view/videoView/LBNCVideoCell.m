//
//  LBNCVideoCell.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCVideoCell.h"
#import <UIImageView+WebCache.h>
@implementation LBNCVideoCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    LBNCVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LBNCVideoCell"];
    if (cell == nil) {
        cell = [[LBNCVideoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LBNCVideoCell"];
    }
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 布局子控件
        [self autoLayout];
    }
    return self;
}
-(void)setVideoListModel:(VideoVideolistModel *)videoListModel{

    _videoListModel = videoListModel;
    _titleLabel.text = _videoListModel.title;
    [_iconIV.imageView sd_setImageWithURL:_videoListModel.cover placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    NSInteger length = _videoListModel.length;
    if (length >= 60) {
        _timeLabel.text = [NSString stringWithFormat:@"%02ld:%02ld", length/60, length%60];;
    }else {
        _timeLabel.text = [NSString stringWithFormat:@"00:%02ld", length];
    }
    // 添加播放标志
    LBNCImageView *playIV = [LBNCImageView new];
    playIV.imageView.image = [UIImage imageNamed:@"play"];
    [_iconIV addSubview:playIV];
    [playIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    

}
- (void)autoLayout{
    // 标题
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = kTitleFont;
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    // 图片
    _iconIV = [[LBNCImageView alloc] init];
    [self.contentView addSubview:_iconIV];
    [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(200);
    }];
    // 副标题
    _subtitleLabel = [[UILabel alloc] init];
    _subtitleLabel.font = kSubtitleFont;
    _subtitleLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_subtitleLabel];
    [_subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.width.mas_equalTo(kWindowW/4*3);
        make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(10);
    }];
    // 时间
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = kSubtitleFont;
    _timeLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(40);
        make.centerY.mas_equalTo(self.subtitleLabel);
    }];
    LBNCImageView *timeIV = [LBNCImageView new];
    timeIV.imageView.image = [UIImage imageNamed:@"time"];
    [self.contentView addSubview:timeIV];
    [timeIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.subtitleLabel);
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.right.mas_equalTo(_timeLabel.mas_left).mas_equalTo(-3);
    }];


    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
}

@end
