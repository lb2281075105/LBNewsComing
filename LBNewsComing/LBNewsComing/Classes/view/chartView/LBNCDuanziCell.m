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
- (void)layOutSubviews{
    
    
    
}

@end
