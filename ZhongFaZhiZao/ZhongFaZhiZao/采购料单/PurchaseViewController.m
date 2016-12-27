//
//  PurchaseViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/7.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "PurchaseViewController.h"
#import "ABWebViewViewController.h"
#import "WKWebViewViewController.h"

@interface PurchaseViewController ()

@end

@implementation PurchaseViewController

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:NO];
    
    self.tabBarController.tabBar.hidden=YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"采购料单"];
    navView.viewController = self;
    [self.view addSubview:navView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/cart/list" title:@"采购料单"];
    [self.navigationController pushViewController:vc animated:YES];
    
//    [self htmlJump:@"http://wap.cecb2b.com/cart/list" withTitle:@""];

}

#pragma mark - h5Url
- (void)htmlJump:(NSString *)htmlUrl withTitle:(NSString *)title{
    
    ABWebViewViewController *webViewController = [[ABWebViewViewController alloc]initWithUrlStr:htmlUrl title:title];
    
    [self.navigationController pushViewController:webViewController animated:YES];
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
