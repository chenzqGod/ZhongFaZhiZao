//
//  ZFZZViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/9.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "ZFZZViewController.h"
#import "WKWebViewViewController.h"
#import <WebKit/WebKit.h>
#import <AlipaySDK/AlipaySDK.h>

@interface ZFZZViewController ()<WKNavigationDelegate,WKUIDelegate>{

    WKWebView *_webView;
}

@property (nonatomic,copy)NSString *urlStr;
@property (nonatomic,assign)BOOL isLoading;
@property (nonatomic,strong)WKUserContentController *userContentroller;

@end

@implementation ZFZZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    
    self.navigationController.navigationBarHidden = YES;

//    self.extendedLayoutIncludesOpaqueBars = YES;

    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor clearColor];
    
    
//    [self createWkWebView];
    
    _isLoading = NO;
    

    
//    umeng统计测试设备
//    Class cls = NSClassFromString(@"UMANUtil");
//    SEL deviceIDSelector = @selector(openUDIDString);
//    NSString *deviceID = nil;
//    if(cls && [cls respondsToSelector:deviceIDSelector]){
//        deviceID = [cls performSelector:deviceIDSelector];
//    }
//    
//    
//    
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:@{@"oid" : deviceID}
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error:nil];
//    
//    NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    

    
    [self htmlJump:@"http://wap.cecb2b.com" withTitle:@""];
    
}

#pragma mark - wkWebView

- (void)createWkWebView {
    
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]init];
    self.userContentroller = [[WKUserContentController alloc]init];
    

//    创建webView,大小从20开始
    _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 20, screenWidth, screenHeight-20)];
    
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
//    创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://wap.cecb2b.com"]];
    
//    加载网页
    [_webView loadRequest:request];
    
    
    [self.view addSubview:_webView];
}


- (WKWebView *)wkwebView{

    if (_webView == nil) {
        
        WKWebView *wkwebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 20, screenWidth, screenHeight-20)];
        
        wkwebView.navigationDelegate = self;
        
        wkwebView.UIDelegate = self;
        
        _webView = wkwebView;
    }
    
    return _webView;
}

#pragma mark - WKNavigationDelegate

//页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation { // 类似UIWebView的 -webViewDidStartLoad:
    NSLog(@"didStartProvisionalNavigation");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    _isLoading = YES;
}

//内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"didCommitNavigation");
}

//页面加载完成时调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation { // 类似 UIWebView 的 －webViewDidFinishLoad:
    NSLog(@"didFinishNavigation");
//    [self resetControl];
//    if (webView.title.length > 0) {
//        self.title = webView.title;
//    }
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

    
}

//页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    // 类似 UIWebView 的- webView:didFailLoadWithError:
    
    NSLog(@"didFailProvisionalNavigation");
    
}

// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    
    decisionHandler(WKNavigationResponsePolicyAllow);
}

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    // 类似 UIWebView 的 -webView: shouldStartLoadWithRequest: navigationType:
    
    NSLog(@"4.%@",navigationAction.request);
    
    
//    NSString *url = [navigationAction.request.URL.absoluteString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    
    decisionHandler(WKNavigationActionPolicyAllow);
    
}

// 接收到服务器跳转请求之后调用
//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler {
//    
//    completionHandler(NSURLSessionAuthChallengeUseCredential);
//}

- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{

    
    return nil;
    
    
}

#pragma mark - searchBar代理方法
/// 点击搜索按钮
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    // 创建url
    NSURL *url = nil;
    NSString *urlStr = searchBar.text;
    
    // 如果file://则为打开bundle本地文件，http则为网站，否则只是一般搜索关键字
    if([urlStr hasPrefix:@"file://"] || !_isLoading ){
        NSRange range = [urlStr rangeOfString:@"file://"];
        NSString *fileName = [urlStr substringFromIndex:range.length];
        url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        // 如果是模拟器加载电脑上的文件，则用下面的代码
        //        url = [NSURL fileURLWithPath:fileName];
    }else if(urlStr.length>0){
        if ([urlStr hasPrefix:@"http://"]) {
            url=[NSURL URLWithString:urlStr];
        } else {
            urlStr=[NSString stringWithFormat:@"http://www.baidu.com/s?wd=%@",urlStr];
        }
        urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        url=[NSURL URLWithString:urlStr];
        
    }
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    // 加载请求页面
    [_webView loadRequest:request];
}






#pragma mark - UIDelegate

//创建一个新的webView
//- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
//
//    return _webView;
//}


- (void)webView:(UIWebView *)sender runJavaScriptAlertPaneWithMessage:(NSString *)message initiatedByFrame:(CGRect *)frame{
    
    UIAlertView* dialogue = [[UIAlertView alloc]initWithTitle:nil message:message delegate:self cancelButtonTitle:NSLocalizedString(@"ok", @"Ok") otherButtonTitles:NSLocalizedString(@"Cancel", @"cancel"), nil];
    
    [dialogue show];
    
    
    

    
    
    
    NSString *parameter = @"orderID";
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    [[NSNetworking sharedManager]get:[NSString stringWithFormat:@"%@%@",/*HOST_URL,COMMUNITY_HOT_SEARCH*/@"",@""] parameters:parameter success:^(id response) {
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        
//        [[AlipaySDK defaultService] payOrder:response fromScheme:response callback:^(NSDictionary *resultDic) {
//            NSLog(@"reslut = %@",resultDic);
//        }];
//        
//        
//        
//        
//    } failure:^(NSString *error) {
//        
//    }];
    
    
}



//#pragma mark - h5Url
- (void)htmlJump:(NSString *)htmlUrl withTitle:(NSString *)title{
    
    WKWebViewViewController *webViewController = [[WKWebViewViewController alloc]initWithUrlStr:htmlUrl title:title];
    
    [self.navigationController pushViewController:webViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
