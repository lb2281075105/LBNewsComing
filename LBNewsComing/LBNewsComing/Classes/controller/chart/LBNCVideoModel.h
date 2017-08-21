//
//  LBNCVideoModel.h
//  LBNewsComing
//
//  Created by liubo on 2017/8/21.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCBaseModel.h"

@class VideoVideosidlistModel,VideoVideolistModel;
@interface  LBNCVideoModel: LBNCBaseModel

@property (nonatomic, copy) NSString *videoHomeSid;
@property (nonatomic, strong) NSArray<VideoVideosidlistModel *> *videoSidList;
@property (nonatomic, strong) NSArray<VideoVideolistModel *> *videoList;

@end
@interface VideoVideosidlistModel : NSObject

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imgsrc;

@end

@interface VideoVideolistModel : NSObject

@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *replyid;
@property (nonatomic, copy) NSURL *mp4_url;
@property (nonatomic, assign) NSInteger playCount;
@property (nonatomic, copy) NSString *replyBoard;
@property (nonatomic, copy) NSString *vid;
@property (nonatomic, assign) NSInteger length;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *m3u8Hd_url;
@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, copy) NSURL *cover;
@property (nonatomic, copy) NSString *videosource;
@property (nonatomic, copy) NSString *mp4Hd_url;
@property (nonatomic, assign) NSInteger playersize;
@property (nonatomic, assign) NSInteger replyCount;
@property (nonatomic, copy) NSString *m3u8_url;

@end
