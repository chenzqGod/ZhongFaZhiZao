//
//  ZFZZTabBarController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/3.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "ZFZZTabBarController.h"
#import "HomeViewController.h"
#import "AskViewController.h"
#import "PurchaseViewController.h"
#import "MineViewController.h"

@interface ZFZZTabBarController ()


@end



@implementation ZFZZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UITabBar appearance]setBarTintColor:[UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1]];
    
//    self.view.backgroundColor = [UIColor whiteColor];

    self.tabBar.selectedImageTintColor = [UIColor colorWithRed:0.9 green:0.15 blue:0.2 alpha:1];
    
//    NSDictionary *fontDic=@{NSFontAttributeName:[UIFont systemFontOfSize:12.0]};
    
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVC];
    homeVC.title = @"首页";
    [homeVC.tabBarItem setImage:[UIImage imageNamed:@"首页1"]];
    [homeVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"首页2"]];
    
    AskViewController *askVC = [[AskViewController alloc]init];
    UINavigationController *askNav = [[UINavigationController alloc]initWithRootViewController:askVC];
    askNav.title = @"咨询";
    [askNav.tabBarItem setImage:[UIImage imageNamed:@"对话1"]];
    [askNav.tabBarItem setSelectedImage:[UIImage imageNamed:@"对话2"]];
    
    PurchaseViewController *purchaseVC = [[PurchaseViewController alloc]init];
    UINavigationController *purchaseNav = [[UINavigationController alloc]initWithRootViewController:purchaseVC];
    purchaseNav.title = @"采购料单";
    [purchaseNav.tabBarItem setImage:[UIImage imageNamed:@"采购1"]];
    [purchaseNav.tabBarItem setSelectedImage:[UIImage imageNamed:@"采购2"]];
    
    MineViewController *mineVC = [[MineViewController alloc]init];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mineVC];
    mineNav.title = @"会员中心";
    [mineNav.tabBarItem setImage:[UIImage imageNamed:@"会员1"]];
    [mineNav.tabBarItem setSelectedImage:[UIImage imageNamed:@"会员2"]];
    
    self.viewControllers = @[homeNav,askNav,purchaseNav,mineNav];
    
    self.selectedViewController = homeNav;
    
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
