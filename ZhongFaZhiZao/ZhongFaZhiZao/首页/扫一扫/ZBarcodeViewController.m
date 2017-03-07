//
//  ZBarcodeViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/3/7.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "ZBarcodeViewController.h"
#import "NavigationControllerView.h"

@interface ZBarcodeViewController ()

@end

@implementation ZBarcodeViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    self.tabBarController.tabBar.hidden=YES;
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:YES];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"扫一扫"];
    navView.viewController = self;
    [self.view addSubview:navView];

    self.view.backgroundColor = [UIColor whiteColor];
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
