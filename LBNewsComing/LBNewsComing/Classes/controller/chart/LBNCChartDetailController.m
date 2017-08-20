//
//  LBNCChartDetailController.m
//  LBNewsComing
//
//  Created by liubo on 2017/8/20.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCChartDetailController.h"

@interface LBNCChartDetailController ()<MWPhotoBrowserDelegate>
@property (nonatomic, strong) NSMutableArray *photos;
@end

@implementation LBNCChartDetailController
- (instancetype)initWithChartModel:(LBNCChartModel *)chartModel{
    
    if (self = [super init]) {
        self.chartModel = chartModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [BarItem addBackItemToVC:self];
    
//    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
//    //设置当前要显示的图片
//    [browser setCurrentPhotoIndex:0];
//    //push到MWPhotoBrowser
//    [self.navigationController pushViewController:browser animated:YES];
    // mark -- MWPhotoBrowser 使用
    MWPhotoBrowser *pb = [[MWPhotoBrowser alloc] initWithDelegate:self];
    NSMutableArray *naviVCs = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    [naviVCs removeLastObject];
    [naviVCs addObject:pb];
    self.navigationController.viewControllers = naviVCs;
}
// 代理
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.chartModel.pics.count;
}

//返回图片模型
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    
    //创建图片模型
    MWPhoto *photo = [MWPhoto photoWithURL:[NSURL URLWithString:self.chartModel.pics[index]]];
    
    return photo;
    
}

@end
