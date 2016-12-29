//
//  MineViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/7.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "MineViewController.h"
#import "WKWebViewViewController.h"
#import "PwLoginViewController.h"

@interface MineViewController ()<WKNavigationDelegate,WKUIDelegate,UIWebViewDelegate>

@property (nonatomic,strong) WKWebView *webView;
@property(nonatomic,assign) BOOL isLoaing;

@end

@implementation MineViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
    [self.navigationController setNavigationBarHidden:YES];
    
     [self.tabBarController.tabBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-49)];
    
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;

    [self.view addSubview:self.webView];
    
    [self.webView setMultipleTouchEnabled:YES];
    
    [self.webView.scrollView setAlwaysBounceVertical:YES];
    
    [self.webView setAllowsBackForwardNavigationGestures:true];

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _isLoaing=NO;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:USER_CENTER]];
    
    [request addValue:@"ios" forHTTPHeaderField:@"app"];

//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:USER_CENTER]]];
    
    [self.webView loadRequest:request];
}


#pragma mark - navdelegate
//页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation { // 类似UIWebView的 -webViewDidStartLoad:
    NSLog(@"didStartProvisionalNavigation");
    //    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSLog(@"webview URL:%@",webView.URL);
//    NSString *url = webView.URL.absoluteString;
    
//    if([url containsString:LoginURL]) {
//        
//        PwLoginViewController *vc = [[PwLoginViewController alloc]init];
//        
//        [self.navigationController pushViewController:vc animated:YES];
//    }
    _isLoaing = YES;
    
    //    NSString *path=[YKBDateHelper convertNull:[webView.URL absoluteString]];
    //    NSString * newPath = [path lowercaseString];
    //    if ([newPath hasPrefix:@"sms:"] || [newPath hasPrefix:@"tel:"]) {
    //        UIApplication * app = [UIApplication sharedApplication];
    //        if ([app canOpenURL:[NSURL URLWithString:newPath]]) {
    //            [app openURL:[NSURL URLWithString:newPath]];
    //        }
    //        return;
    //    }
    
    
}

//内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"didCommitNavigation");
    
    //    [NSThread sleepForTimeInterval:1.0];
}

//页面加载完成时调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation { // 类似 UIWebView 的 －webViewDidFinishLoad:
    NSLog(@"didFinishNavigation");
    
    
    
    
    //    [self resetControl];
    //    if (webView.title.length > 0) {
    //        self.title = webView.title;
    //    }
    
    //    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
//    _imageView.frame = CGRectZero;
}

//-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
//    NSLog(@"webviewurl：%@",webView.);
//    return YES;
//}


// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    NSString *url = webView.URL.absoluteString;
    if([url containsString:LoginURL]) {
        
        decisionHandler(WKNavigationResponsePolicyCancel);
        
        PwLoginViewController *vc = [[PwLoginViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }

    decisionHandler(WKNavigationResponsePolicyAllow);
}

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    // 类似 UIWebView 的 -webView: shouldStartLoadWithRequest: navigationType:
    
    NSLog(@"4.%@",navigationAction.request);
    
    
    //    NSString *url = [navigationAction.request.URL.absoluteString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    // 解决WKWebView替换UIWebView无法拨打电话
    NSURL *URL = navigationAction.request.URL;
    NSString *scheme = [URL scheme];
    if ([scheme isEqualToString:@"tel"]) {
        NSString *resourceSpecifier = [URL resourceSpecifier];
        NSString *callPhone = [NSString stringWithFormat:@"telprompt://%@", resourceSpecifier];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone]];
    }
    
    
    
    decisionHandler(WKNavigationActionPolicyAllow);
    
}



#pragma mark - WKUIdelegate
//捕获弹窗
//- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
//    
//    
//    UIAlertView* dialogue = [[UIAlertView alloc]initWithTitle:nil message:message delegate:self cancelButtonTitle:NSLocalizedString(@"ok", @"Ok") otherButtonTitles:NSLocalizedString(@"Cancel", @"cancel"), nil];
//    
//    [dialogue show];
//    if ([message hasPrefix:@"alipay"]) {
//        
//        NSLog(@"跳转");
//    }
//    
//    completionHandler();
//    
//}

//- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {    LILog(@"runJavaScriptAlertPanelWithMessage");    [LIUseFunc alertWithMessage:message];    completionHandler();}

//- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler {    LILog(@"runJavaScriptConfirmPanelWithMessage");    completionHandler(NO);}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler{
    
}




- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//    
//    if ([keyPath isEqualToString:@"title"])
//    {
//        NSLog(@"webviewtitle :%@",self.webView.title);
//        if (object == self.webView) {
//            navView.title = self.webView.title;
//        }
//        else {
//            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//        }
//    }else if ([keyPath isEqual: @"estimatedProgress"] && object == _webView) {
//        [self.progressView setAlpha:1.0f];
//        [self.progressView setProgress:_webView.estimatedProgress animated:YES];
//        if(_webView.estimatedProgress >= 1.0f)
//        {
//            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
//                [self.progressView setAlpha:0.0f];
//            } completion:^(BOOL finished) {
//                [self.progressView setProgress:0.0f animated:NO];
//            }];
//        }
//    }
//    else {
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }
    
    
}

//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
//    if (navigationType==UIWebViewNavigationTypeBackForward) {
//        self.webView.canGoBack?[self.webView goBack]:[self.navigationController popViewControllerAnimated:YES];
//    }
//    return YES;
//}

- (void)dealloc {
//    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
    
    // if you have set either WKWebView delegate also set these to nil here
    [_webView setNavigationDelegate:nil];
    [_webView setUIDelegate:nil];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
