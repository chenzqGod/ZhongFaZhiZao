//
//  KnowLedgeViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/17.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "KnowLedgeViewController.h"

@interface KnowLedgeViewController ()

@end

@implementation KnowLedgeViewController


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];

    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = BACK_COLOR;
    
    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"知识产权专利"];
    navView.viewController = self;
    [self.view addSubview:navView];
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
