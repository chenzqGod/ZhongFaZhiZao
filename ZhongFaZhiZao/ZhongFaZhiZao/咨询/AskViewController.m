//
//  AskViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/7.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "AskViewController.h"
#import "ABWebViewViewController.h"
@interface AskViewController ()

@end

@implementation AskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.title = @"咨询";
    
    self.view.backgroundColor = [UIColor redColor];

    [self htmlJump:@"http://wap.cecb2b.com" withTitle:@""];

}

#pragma mark - h5Url
- (void)htmlJump:(NSString *)htmlUrl withTitle:(NSString *)title{
    
    ABWebViewViewController *webViewController = [[ABWebViewViewController alloc]initWithUrlStr:htmlUrl title:title];
    
    [self.navigationController pushViewController:webViewController animated:YES];
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
