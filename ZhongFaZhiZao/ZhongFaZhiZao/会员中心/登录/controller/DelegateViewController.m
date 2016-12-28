//
//  DelegateViewController.m
//  NeiSha
//
//  Created by paperclouds on 16/8/12.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "DelegateViewController.h"
#import "DelegateView.h"

@interface DelegateViewController ()<UIWebViewDelegate>

@end

@implementation DelegateViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NavigationControllerView *nav = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"用户协议"];
    nav.viewController = self;
    
    [self.view addSubview:nav];
    
    DelegateView *delegateView = [[DelegateView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:delegateView];
//    delegateView.navView.viewController = self;
    
    [delegateView.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    delegateView.webview.delegate = self;
    
}

#pragma mark - h5页面webView请求

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];

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
