//
//  LBNCDetailController.m
//  LBNewsComing
//
//  Created by yunmei on 2017/8/18.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBNCDetailController.h"

@interface LBNCDetailController ()<UIWebViewDelegate>
@property (strong, nonatomic) UIWebView *webView;

@end

@implementation LBNCDetailController
-(instancetype)initWithID:(NSInteger)ID{
    self = [super init];
    if (self) {
        self.ID = ID;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新闻详情";
    [BarItem addBackItemToVC:self];
    [self webView];
}
// 懒加载
-(UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc]init];
        _webView.delegate = self;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        NSString *path = [NSString stringWithFormat:@"http://cont.app.autohome.com.cn/autov5.0.0/content/news/newscontent-n%ld-t0-rct1.json", self.ID];
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
    }
    return _webView;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    // 状态栏中的加载框
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [self showLoad];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self hideLoad];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self hideLoad];
}

@end
