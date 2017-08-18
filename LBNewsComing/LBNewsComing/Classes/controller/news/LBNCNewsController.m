//
//  LBNCNewsController.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCNewsController.h"
#import "LBNCListController.h"
@interface LBNCNewsController ()

@end

@implementation LBNCNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (instancetype)init
{
    self = [super initWithViewControllerClasses:[self childControllerClasses] andTheirTitles:[self titleNames]];
    if (self) {
        
    }
    return self;
}
- (NSArray *)titleNames{
    return @[@"最新",@"新闻",@"评测",@"导购",@"用车",@"技术",@"文化",@"改装",@"游记",];
}
- (NSArray *)childControllerClasses {
    NSMutableArray *mArr = [NSMutableArray new];
    for (int i = 0; i < [self titleNames].count; i++) {
        [mArr addObject:[LBNCListController class]];
    }
    return [mArr copy];
}

- (NSArray *)vcKeys {
    NSMutableArray *mArr = [NSMutableArray new];
    for (int i = 0; i < [self titleNames].count; i++) {
        [mArr addObject:@"infoType"];
    }
    return [mArr copy];
}

- (NSArray *)vcValues {
    NSMutableArray *mArr = [NSMutableArray new];
    for (int i = 0; i < [self titleNames].count; i++) {
        [mArr addObject:@(i)];
    }
    return [mArr copy];
}
@end
