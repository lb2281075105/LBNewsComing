//
//  LBNCChartCell.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCChartCell.h"

@implementation LBNCChartCell{

    

}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    LBNCChartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LBNCChartCell"];
    if (cell == nil) {
        cell = [[LBNCChartCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LBNCChartCell"];
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
