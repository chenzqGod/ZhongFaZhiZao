//
//  PromoteViewController.m
//  NeiSha
//
//  Created by paperclouds on 16/8/10.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "PromoteViewController.h"
#import "PromoteView.h"
#import "RegisterViewController.h"
#import "VfLoginViewController.h"

@interface PromoteViewController ()

@end

@implementation PromoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    PromoteView *promoteView = [[PromoteView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:promoteView];
    
    [promoteView.closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    [promoteView.registerBtn addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    
    [promoteView.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
}

// 关闭
- (void)close{
    
}

// 注册
- (void)registerAction{
    RegisterViewController *regist = [[RegisterViewController alloc]init];
    // 隐藏tabbar
//    [(NeiShaTabbar *)self.tabBarController hideImageView];
    [self.navigationController pushViewController:regist animated:YES];
}

- (void)login{
    VfLoginViewController *login = [[VfLoginViewController alloc]init];
    // 隐藏tabbar
//    [(NeiShaTabbar *)self.tabBarController hideImageView];
    [self.navigationController pushViewController:login animated:YES];
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
