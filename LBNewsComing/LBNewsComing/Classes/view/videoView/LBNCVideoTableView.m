//
//  LBNCVideoTableView.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCVideoTableView.h"
#import "LBNCVideoCell.h"
#import "LBNCVideoDetailController.h"
#import "LBNCVideoModel.h"
@implementation LBNCVideoTableView

-(void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray = dataArray;
    [self reloadData];
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}
// mark -- 估计cell高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LBNCVideoCell *cell = [LBNCVideoCell cellWithTableView:tableView];
    cell.videoListModel = self.dataArray[indexPath.row];
    return cell;
}
// 点击视频页cell进入视频播放界面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 创建会话
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    // 音视频播放器
    AVPlayerViewController *vc = [AVPlayerViewController new];
    VideoVideolistModel *videoModel = self.dataArray[indexPath.row];
    AVPlayer *player = [AVPlayer playerWithURL:[videoModel mp4_url]];
    vc.player = player;
    [self.viewController presentViewController:vc animated:YES completion:nil];
    [vc.player play];
}
@end
