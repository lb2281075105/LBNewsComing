//
//  LBNCNewsCell.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCNewsCell.h"

@implementation LBNCNewsCell{
    
    
    
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
- (void)autoLayout{
    
    
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
