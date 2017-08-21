
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
CYLTabBarController
//Cell滑动，出现多个功能按钮
TPKeyboardAvoiding
SWTableViewCell
//QQ的左侧菜单风格
#import <RESideMenu.h>
//闪光效果
#import <FBShimmeringView.h>
#import <FBShimmeringLayer.h>

//扁平化风格
#import <FlatUIKit.h>

//第三方对数据库的操作类库，是对系统Sqlite3的封装；使用SQL语句操作数据库
#import <FMDB/FMDB.h>
//改变系统的target+selector模式为 block模式,带来紧凑的代码风格，高效率的回调执行
#import <BlocksKit.h>
#import <BlocksKit+MessageUI.h>
#import <BlocksKit+UIKit.h>

pod 'FMDB', '~> 2.6.2'
pod 'CocoaLumberjack', '~> 2.3.0'
pod 'Shimmer', '~> 1.0.0'
pod 'FlatUIKit', '~> 1.6.2'
pod 'RESideMenu', '~> 4.0.7'

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

8.
AVSpeechSynthesizer语音播放声音

9.
AVKit、AVFoudation播放视频
10.

分享未做
