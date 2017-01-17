//
//  FinanceDetailTwoViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/1/17.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "FinanceDetailTwoViewController.h"

@interface FinanceDetailTwoViewController (){

    UIScrollView *_scrollView;
    UIImageView *_iconView;
    UILabel *_nameLabel;
    UILabel *_produceLabel;
    UILabel *_goodLabel;
    UILabel *_sqtjLabel;
    UILabel *_otherLabel;
}

@end

@implementation FinanceDetailTwoViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    [self.tabBarController.tabBar setHidden:YES];
    self.tabBarController.tabBar.frame = CGRectZero;
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:YES];
    self.tabBarController.tabBar.frame = CGRectMake(0, screenHeight-49, screenWidth, 49);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
