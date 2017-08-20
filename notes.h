
### 笔记记实

1.
初始化项目，创建标签栏。
2.
为导航栏设置背景，为导航栏标题设置颜色、字体，为状态栏设置颜色。
View controller-based status bar appearance 在info中设置NO；在导航控制器中+(void)initialize{}方法中设置状态栏颜色。

3.
第三方框架
WMPageController(用于滑动控制器)
AFNetworking
MJRefresh
MJExtension
MBProgressHUD
SDCycleScrollView
iCarousel
MWPhotoBrowser
4.
网络封装
枚举类型
MVVM模式：
(1)viewModel里面处理的是加载网络数据,把模型数组传过去。
(2)model里面：
/** 属性为数组 对应相应的解析类 */
+ (NSDictionary *)objectClassInArray{
    return @{@"newslist" : [HomeResultNewslistModel class], @"focusimg" : [HomeResultFocusimgModel class]};
}
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}
/** 属性为字典 对应相应的解析类 */
(3)view model viewModel 每个类都需要分开写

pics = (
        http://img3.cache.netease.com/photo/0096/2015-11-17/B8LBTAFV54GI0096.jpg,
        http://img3.cache.netease.com/photo/0096/2015-11-17/B8LBTAG054GI0096.jpg,
        http://img3.cache.netease.com/photo/0096/2015-11-17/B8LBTAG154GI0096.jpg,
        );
5.
注意block delegate 一块使用
LBNCBaseViewModel
为自己设置代理，但是没有代理属性
[self.dataMArr addObjectsFromArray:model.result.newslist];
// 估计cell高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
// 状态栏的加载框
[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

// mark -- 加载失败时候，使表视图cell消失
_newsTableView.tableFooterView = [UIView new];

6.
构造函数传递参数initWithID

7.
图文模块：
[_iconIV.imageView sd_setImageWithURL:_chartModel.pics[0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
@property (nonatomic, strong) NSArray<NSURL *> *pics;
MWPhotoBrowser的使用

_sc.selectedSegmentIndex = 1;
NSMutableArray *mArr = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
[mArr removeLastObject];
WordController *vc = [WordController new];
[mArr addObject:vc];
self.navigationController.viewControllers = mArr;



