//
//  LBNCDuanziCell.m
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCDuanziCell.h"

@implementation LBNCDuanziCell
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    LBNCDuanziCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LBNCDuanziCell"];
    if (cell == nil) {
        cell = [[LBNCDuanziCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LBNCDuanziCell"];
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
-(void)setDuanziModel:(LBNCDuanziModel *)duanziModel{
    _duanziModel = duanziModel;
    _contentLabel.text = duanziModel.text;
    _dateLabel.text = duanziModel.created_at;
    [_zanBtn setTitle:[NSString stringWithFormat:@"%ld",(_duanziModel.zan)] forState:UIControlStateNormal];
}
- (void)layOutSubviews{
    // 内容
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.font = kTitleFont;
    _contentLabel.numberOfLines = 0;
    [self.contentView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        
    }];
    // 赞
    _zanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_zanBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    _zanBtn.titleLabel.font = kSubtitleFont;
    [_zanBtn setImage:[UIImage imageNamed:@"zan"] forState:UIControlStateNormal];
    _zanBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    [self.contentView addSubview:_zanBtn];
    [_zanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(_contentLabel.mas_bottom).mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(60, 30));
        make.bottom.mas_equalTo(-5);
    }];
    
    // 日期
    _dateLabel = [[UILabel alloc] init];
    _dateLabel.font = kSubtitleFont;
    _dateLabel.textColor = [UIColor lightGrayColor];
    _dateLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_dateLabel];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_zanBtn);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(130);
    }];

}
@end
