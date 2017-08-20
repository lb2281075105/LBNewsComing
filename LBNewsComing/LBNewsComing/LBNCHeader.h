//
//  LBNCHeader.h
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

///宏定义

///判断是不是开发、调试状态，如果是开发、调试状态，就让LBNCLog替换NSLog
#ifdef DEBUG
///LBNCLog是不限制参数的，中间用三个英文句号表示
#define LBNCLog(...) NSLog(__VA_ARGS__)
///如果是发布状态LBNCLog就直接为空
#define kHeight [UIScreen cz_screenHeight] / 750.0
//标题字体
#define kTitleFont      [UIFont systemFontOfSize:15]
//子标题字体
#define kSubtitleFont      [UIFont systemFontOfSize:13]
//通过RGB设置颜色
#define kRGBColor(R,G,B)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
//应用程序的屏幕高度
#define kWindowH        [UIScreen mainScreen].bounds.size.height
//应用程序的屏幕宽度
#define kWindowW        [UIScreen mainScreen].bounds.size.width

//通过Storyboard ID 在对应Storyboard中获取场景对象  （\：换行）
#define kVCFromSb(storyboardId, storyboardName)     [[UIStoryboard storyboardWithName:storyboardName bundle:nil] \
instantiateViewControllerWithIdentifier:storyboardId]

//移除iOS7之后，cell默认左侧的分割线边距   Preserve:保存
#define kRemoveCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero; \
cell.preservesSuperviewLayoutMargins = NO; \
}

//Docment文件夹目录
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

#elif
#define LBNCLog(...)
#endif
