//
//  TiaoKuanViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/1/19.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "TiaoKuanViewController.h"
#import "WKWebViewViewController.h"
@interface TiaoKuanViewController ()<UIWebViewDelegate>{

    UIWebView *_webView;
}

@end

@implementation TiaoKuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NavigationControllerView *nav = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"金融平台服务条款与隐私政策"];
    nav.viewController = self;
    [self.view addSubview:nav];
    
    self.view.backgroundColor = BACK_COLOR;
    
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64)];
    
    NSString *str = @"http://www.cecb2b.com/zt/register/FinanceAgree.html";
//    NSURL *url = [NSURL URLWithString:str];
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    _webView.delegate = self;
//    [_webView loadRequest:request];
    
//
    
    
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
