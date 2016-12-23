//
//  IMViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/20.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "IMViewController.h"


@interface IMViewController ()

@end

@implementation IMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = BACK_COLOR;
    
    [WKProgressHUD popMessage:@"即时通讯" inView:self.view duration:HUD_DURATION animated:YES];
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
