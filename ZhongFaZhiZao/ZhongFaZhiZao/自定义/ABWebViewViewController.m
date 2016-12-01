//
//  ABWebViewViewController.m
//  LoveTourGuide
//
//  Created by Liu Zhao on 15/11/25.
//  Copyright © 2015年 pchen. All rights reserved.
//

#import "ABWebViewViewController.h"
#import <AlipaySDK/AlipaySDK.h>
@interface ABWebViewViewController()<UIWebViewDelegate>

@property(nonatomic,strong) UIWebView *webView;
@property(nonatomic,copy) NSString *urlStr;
@property(nonatomic,copy) NSString *navigatorTitle;
@property(nonatomic,assign) BOOL isLoaing;

@end


@implementation ABWebViewViewController

- (instancetype)initWithUrlStr:(NSString *)urlStr{
    return [self initWithUrlStr:urlStr title:nil];
}

- (instancetype)initWithUrlStr:(NSString *)urlStr title:(NSString *)navigatorTitle{
    self=[super init];
    if (self) {
        _urlStr=urlStr;
        _navigatorTitle=navigatorTitle;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    
//    [[self navigationController] setNavigationBarHidden:YES animated:NO];

    
    NSLog(@"%@",_navigatorTitle);
    self.title=_navigatorTitle;
    //self.navigationController.navigationItem.title=_navigatorTitle;
    //self.navigationController.title=_navigatorTitle;
    self.navigationController.navigationBar.barTintColor=[UIColor blueColor];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
        
}


- (void)viewDidLoad {
    [super viewDidLoad];
//
//    self.extendedLayoutIncludesOpaqueBars = YES;

//    self.navigationController.navigationBar.translucent = NO;
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"123" style:UIBarButtonItemStylePlain target:nil action:nil];
//    [self.navigationController.navigationBar setBackIndicatorImage:[[UIImage imageNamed:@"ios-i导游-返回"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[[UIImage imageNamed:@"ios-i导游-返回"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    //隐藏返回文字
//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
//    //设置title字体，颜色
//    //NSFontAttributeName:[UIFont systemFontOfSize:18],
//    NSDictionary *dic=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
//    [self.navigationController.navigationBar setTitleTextAttributes:dic];
    

//    _webView=[[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, screenWidth, screenHeight-20)];
    _webView.delegate=self;
    [self.view addSubview:_webView];
    _isLoaing=NO;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self loadWebViewData];
}

- (void)loadWebViewData{
    if (!_urlStr.length||_isLoaing) {
        return;
    }
    
    if ([_urlStr hasPrefix:@"http"]) {
        NSURL *url = [NSURL URLWithString:_urlStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }else{
        NSURL *fileURL = [NSURL URLWithString:_urlStr];
//        NSURL *fileURL = _urlStr;
        if (!fileURL) {
            return;
        }
        NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
        [self.webView loadRequest:request];
    }
}


#pragma mark - ABNetErrorViewDelegate
- (void)netErrorViewRefreshAction{
    NSLog(@"netErrorViewRefreshAction:刷新数据");
    [self loadWebViewData];
}

#pragma mark - ABNoMessageViewDelegate
- (void)noMessageViewRefreshAction{
    NSLog(@"noMessageViewRefreshAction:刷新数据");
    [self loadWebViewData];
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"webViewDidStartLoad:");
    _isLoaing=YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webViewDidFinishLoad:");
}

//- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
//    
//    NSLog(@"webView: didFailLoadWithError:");
//    _isLoaing=NO;
//    
//}




@end
