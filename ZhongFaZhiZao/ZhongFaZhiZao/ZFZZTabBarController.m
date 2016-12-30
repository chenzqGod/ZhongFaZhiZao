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
#import "PwLoginViewController.h"
#import "IMViewController.h"

@interface ZFZZTabBarController ()


@end



@implementation ZFZZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [[UITabBar appearance]setBarTintColor:[UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1]];
    
//    self.view.backgroundColor = [UIColor whiteColor];

    self.tabBar.selectedImageTintColor = BLUE_COLOR;
    
//    NSDictionary *fontDic=@{NSFontAttributeName:[UIFont systemFontOfSize:12.0]};
    
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
    askNav.tabBarItem.badgeValue = @"10";
    [askNav.tabBarItem setImage:[UIImage imageNamed:@"咨询-1"]];
    [askNav.tabBarItem setSelectedImage:[UIImage imageNamed:@"咨询-1"]];
    
    PurchaseViewController *purchaseVC = [[PurchaseViewController alloc]init];
    UINavigationController *purchaseNav = [[UINavigationController alloc]initWithRootViewController:purchaseVC];
    purchaseNav.title = @"采购料单";
    purchaseNav.tabBarItem.title = @"采购料单";
    [purchaseNav.tabBarItem setImage:[UIImage imageNamed:@"采购-1"]];
    [purchaseNav.tabBarItem setSelectedImage:[UIImage imageNamed:@"采购-1"]];
    
    MineViewController *mineVC = [[MineViewController alloc]init];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mineVC];
    mineNav.title = @"我的";
    mineNav.tabBarItem.title = @"我的";
    [mineNav.tabBarItem setImage:[UIImage imageNamed:@"会员-1"]];
    [mineNav.tabBarItem setSelectedImage:[UIImage imageNamed:@"会员-1"]];
    
    PwLoginViewController *pwVC = [[PwLoginViewController alloc]init];
    UINavigationController *pwNav = [[UINavigationController alloc]initWithRootViewController:pwVC];
    pwNav.title = @"我的";
    pwNav.tabBarItem.title = @"我的";
    [pwNav.tabBarItem setImage:[UIImage imageNamed:@"会员-1"]];
    [pwNav.tabBarItem setSelectedImage:[UIImage imageNamed:@"会员-1"]];
    
//    self.viewControllers = @[homeVC,askVC,purchaseNav,mineNav];
    
    self.viewControllers = @[homeNav,askNav,purchaseNav,mineNav];
    
//    self.selectedViewController = homeVC;
    
}


//- (void)hideTabBar {
//    if (self.tabBarController.tabBar.hidden == YES) {
//        return;
//    }
//    UIView *contentView;
//    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
//        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
//    else
//        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
//    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
//    self.tabBarController.tabBar.hidden = YES;
//    
//}


//- (void)showTabBar
//
//{
//    if (self.tabBarController.tabBar.hidden == NO)
//    {
//        return;
//    }
//    UIView *contentView;
//    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
//        
//        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
//    
//    else
//        
//        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
//    contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
//    self.tabBarController.tabBar.hidden = NO;
//    
//}

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
