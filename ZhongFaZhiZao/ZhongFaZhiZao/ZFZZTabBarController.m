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
#import "PwLoginViewController.h"
#import "IMViewController.h"
#import "MemberCenterViewController.h"

@interface ZFZZTabBarController ()


@end



@implementation ZFZZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.tintColor = BLUE_COLOR;
    
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVC];

    homeNav.title = @"首页";
    homeNav.tabBarItem.title = @"首页";
    [homeNav.tabBarItem setImage:[UIImage imageNamed:@"首页-1"]];
    [homeNav.tabBarItem setSelectedImage:[UIImage imageNamed:@"首页-1"]];
    
    IMViewController *askVC = [[IMViewController alloc]init];
    UINavigationController *askNav = [[UINavigationController alloc]initWithRootViewController:askVC];
    askNav.title = @"消息";
    askNav.tabBarItem.title = @"咨询";
//    askNav.tabBarItem.badgeValue = @"10";
    [askNav.tabBarItem setImage:[UIImage imageNamed:@"咨询-1"]];
    [askNav.tabBarItem setSelectedImage:[UIImage imageNamed:@"咨询-1"]];
    
    PurchaseViewController *purchaseVC = [[PurchaseViewController alloc]init];
    UINavigationController *purchaseNav = [[UINavigationController alloc]initWithRootViewController:purchaseVC];
    purchaseNav.title = @"采购料单";
    purchaseNav.tabBarItem.title = @"采购料单";
    [purchaseNav.tabBarItem setImage:[UIImage imageNamed:@"采购-1"]];
    [purchaseNav.tabBarItem setSelectedImage:[UIImage imageNamed:@"采购-1"]];
    
    MemberCenterViewController *mineVC = [[MemberCenterViewController alloc]init];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mineVC];
    mineNav.title = @"我的";
    mineNav.tabBarItem.title = @"我的";
    [mineNav.tabBarItem setImage:[UIImage imageNamed:@"会员-1"]];
    [mineNav.tabBarItem setSelectedImage:[UIImage imageNamed:@"会员-1"]];
    
    self.viewControllers = @[homeNav,askNav,purchaseNav,mineNav];
    
//    self.selectedViewController = homeVC;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
