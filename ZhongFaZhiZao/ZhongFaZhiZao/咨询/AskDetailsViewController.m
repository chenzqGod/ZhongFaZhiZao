//
//  AskDetailsViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/2.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "AskDetailsViewController.h"

@interface AskDetailsViewController ()



@end

@implementation AskDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"消息中心"];
    navView.viewController = self;
    [self.view addSubview:navView];
    
    
    self.view.backgroundColor = BACK_COLOR;
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
