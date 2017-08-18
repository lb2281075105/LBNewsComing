//
//  LBNCListController.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCListController.h"
#import "LBNCNewsViewModel.h"
@interface LBNCListController ()
@property (strong, nonatomic) LBNCNewsViewModel *newsViewModel;
@end

@implementation LBNCListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}
-(LBNCNewsViewModel *)newsViewModel{
    if (_newsViewModel == nil) {
        _newsViewModel = [[LBNCNewsViewModel alloc]initWithType:self.infoType.integerValue];
    }
    return _newsViewModel;
}

@end
