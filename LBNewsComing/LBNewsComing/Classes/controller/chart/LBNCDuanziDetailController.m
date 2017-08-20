//
//  LBNCDuanziDetailController.m
//  LBNewsComing
//
//  Created by liubo on 2017/8/21.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCDuanziDetailController.h"

@interface LBNCDuanziDetailController ()<AVSpeechSynthesizerDelegate>

@property (strong, nonatomic) UITextView *contentTV;
@property (strong, nonatomic) AVSpeechSynthesizer *speech;
@property (strong, nonatomic) UIBarButtonItem *readItem;
#pragma mark -
@property (strong, nonatomic) UIButton *shareBtn;

@end

@implementation LBNCDuanziDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
// 构造函数
- (instancetype)initWithContent:(NSString *)content {
    if (self = [super init]) {
        self.content = content;
        [BarItem addBackItemToVC:self];
        self.title = @"详情";
        self.view.backgroundColor = [UIColor whiteColor];
        self.contentTV.text = self.content;
        self.navigationItem.rightBarButtonItem = self.readItem;
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
        //[self shareBtn];
    }
    return self;
}
- (UIBarButtonItem *)readItem {
    if(_readItem == nil) {
        _readItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"读笑话" style:UIBarButtonItemStyleDone handler:^(id sender) {
            if (self.speech.speaking) {
                [self.speech stopSpeakingAtBoundary:AVSpeechBoundaryWord];
                return;
            }
            // 读文字
            AVSpeechUtterance *utt = [AVSpeechUtterance speechUtteranceWithString:self.content];
            utt.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
            [self.speech speakUtterance:utt];
        }];
    }
    
    return _readItem;
}

- (UITextView *)contentTV {
    if(_contentTV == nil) {
        _contentTV = [[UITextView alloc] init];
        _contentTV.editable = NO;
        _contentTV.font = kSubtitleFont;
        [self.view addSubview:_contentTV];
        [_contentTV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(kWindowH/4);
            make.bottom.mas_equalTo(-kWindowH/2);
        }];
    }
    return _contentTV;
}
- (AVSpeechSynthesizer *)speech {
    if(_speech == nil) {
        _speech = [[AVSpeechSynthesizer alloc] init];
        _speech.delegate = self;
    }
    return _speech;
}
// 页面消失停止播放声音
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.speech stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}
// 代理方法
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {
    self.readItem.title = @"暂停";
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    self.readItem.title = @"读笑话";
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance {
    self.readItem.title = @"读笑话";
}

@end
