//
//  LBNCNewsCell.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCNewsCell.h"
#import <UIImageView+WebCache.h>
@implementation LBNCNewsCell{
    
     LBNCImageView *_iconIV;
     UILabel *_titleLabel;
     UILabel *_dateLabel;
     UILabel *_commentNumLabel;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    LBNCNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LBNCNewsCell"];
    if (cell == nil) {
        cell = [[LBNCNewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LBNCNewsCell"];
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
// 对此简单布局使用懒加载也可以,再在setModel中进行赋值
//- (LBNCImageView *)iconIV {
//    if(_iconIV == nil) {
//        _iconIV = [[LBNCImageView alloc] init];
//        [self.contentView addSubview:_iconIV];
//        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.left.mas_equalTo(10);
//            make.size.mas_equalTo(CGSizeMake(80, 60));
//            make.centerY.mas_equalTo(0);
//        }];
//    }
//    return _iconIV;
//}
- (void)autoLayout{
    // 图片
    _iconIV = [[LBNCImageView alloc] init];
    [self.contentView addSubview:_iconIV];
    [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(80, 60));
        make.centerY.mas_equalTo(0);
    }];
    // 标题
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = kTitleFont;
    _titleLabel.numberOfLines = 0;
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.topMargin.mas_equalTo(_iconIV);
    }];
    // 日期
    _dateLabel = [[UILabel alloc] init];
    _dateLabel.font = kSubtitleFont;
    _dateLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_dateLabel];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(_titleLabel);
        make.width.mas_equalTo(80);
        make.bottomMargin.mas_equalTo(_iconIV);
    }];
    // 评论
    _commentNumLabel = [[UILabel alloc] init];
    _commentNumLabel.font = kSubtitleFont;
    _commentNumLabel.textColor = [UIColor lightGrayColor];
    _commentNumLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_commentNumLabel];
    [_commentNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_dateLabel);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(80);
    }];
}
-(void)setNewsListModel:(HomeResultNewslistModel *)newsListModel{
    _newsListModel = newsListModel;
    if (newsListModel.mediatype == 6) {
        _iconIV.imageView.image = [UIImage imageNamed:@"car"];
    }else{
        [_iconIV.imageView sd_setImageWithURL:[NSURL URLWithString:newsListModel.smallpic] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    }
    if (newsListModel.mediatype == 3) {
        _commentNumLabel.text = [NSString stringWithFormat:@"%ld播放",newsListModel.replycount];
    }else{
        _commentNumLabel.text = [NSString stringWithFormat:@"%ld评论",newsListModel.replycount];
    }
    _titleLabel.text = newsListModel.title;
    _dateLabel.text = newsListModel.time;
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
