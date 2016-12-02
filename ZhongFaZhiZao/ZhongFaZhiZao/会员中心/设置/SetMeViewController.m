//
//  SetMeViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/2.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "SetMeViewController.h"

@interface SetMeViewController ()

@end

@implementation SetMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:NO];
    
    self.navigationItem.title = @"设置";
    
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
