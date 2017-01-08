//
//  IMDetailViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/23.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "IMDetailViewController.h"
#import<RongIMKit/RCConversationViewController.h>

@interface IMDetailViewController ()<RCMessageCellDelegate>

@end

@implementation IMDetailViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    
    self.tabBarController.tabBar.hidden=YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    IMDetailViewController *vc = [[IMDetailViewController alloc]initWithConversationType:ConversationType_PRIVATE targetId:@"1"];
    
//    [self.view addSubview:vc];
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
