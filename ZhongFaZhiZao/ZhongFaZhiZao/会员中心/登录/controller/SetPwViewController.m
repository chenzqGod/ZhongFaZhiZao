//
//  SetPwViewController.m
//  NeiSha
//
//  Created by paperclouds on 16/8/12.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "SetPwViewController.h"
#import "SetPwView.h"
#import "NSString+Mobile.h"
#import "PwLoginViewController.h"

@interface SetPwViewController ()

@property (nonatomic,strong) SetPwView *setPwView;
@end

@implementation SetPwViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.setPwView = [[SetPwView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.setPwView];
//    self.setPwView.navView.viewController = self;
    
    [self.setPwView.pwVisibleBtn addTarget:self action:@selector(pwVisible) forControlEvents:UIControlEventTouchUpInside];
    
    [self.setPwView.cpwVisibleBtn addTarget:self action:@selector(cpwVisible) forControlEvents:UIControlEventTouchUpInside];
    
    [self.setPwView.completeBtn addTarget:self action:@selector(complete) forControlEvents:UIControlEventTouchUpInside];
}

// 密码可见
- (void)pwVisible{
    self.setPwView.pwVisibleBtn.selected = !self.setPwView.pwVisibleBtn.isSelected;
    
    if (self.setPwView.pwVisibleBtn.isSelected) {
        [self.setPwView.pwVisibleBtn setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
        self.setPwView.passWdTF.secureTextEntry = NO;
    }else{
        [self.setPwView.pwVisibleBtn setTitleColor:[UIColor colorWithHexString:@"#787878"] forState:UIControlStateNormal];
        self.setPwView.passWdTF.secureTextEntry = YES;
    }
}

// 确认密码可见
- (void)cpwVisible{
    self.setPwView.cpwVisibleBtn.selected = !self.setPwView.cpwVisibleBtn.isSelected;
    
    if (self.setPwView.cpwVisibleBtn.isSelected) {
        [self.setPwView.cpwVisibleBtn setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
        self.setPwView.confirmPwTF.secureTextEntry = NO;
    }else{
        [self.setPwView.cpwVisibleBtn setTitleColor:[UIColor colorWithHexString:@"#787878"] forState:UIControlStateNormal];
        self.setPwView.confirmPwTF.secureTextEntry = YES;
    }
}

// 完成
- (void)complete{
    self.phoneNum = self.setPwView.phoneNumTF.text;
    self.passWd = self.setPwView.passWdTF.text;
    self.cpassWd = self.setPwView.confirmPwTF.text;
    
    if ([self.phoneNum isEqualToString:@""]) {
        [WKProgressHUD popMessage:@"请输入手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else if ([self.passWd isEqualToString:@""]){
        [WKProgressHUD popMessage:@"请输入密码" inView:self.view duration:HUD_DURATION animated:YES];
    }else if (![self.phoneNum isMobileNumber]){
        [WKProgressHUD popMessage:@"请输入正确的手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else if (self.passWd.length < 6){
        [WKProgressHUD popMessage:@"密码长度不能小于6位" inView:self.view duration:HUD_DURATION animated:YES];
    }else if (self.passWd.length > 16){
        [WKProgressHUD popMessage:@"密码长度不能大于16位" inView:self.view duration:HUD_DURATION animated:YES];
    }else if (![self.passWd isEqualToString:self.cpassWd]){
        [WKProgressHUD popMessage:@"请确认两次输入密码相同" inView:self.view duration:HUD_DURATION animated:YES];
    }else{
        NSDictionary *parameters = @{@"mob":self.phoneNum,@"mobcode":self.vfCode,@"newpwd":self.passWd,@"newpwdrepeat":self.cpassWd};
        
//        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,SET_PW] parameters:parameters success:^(id response) {
//            if ([response[@"msg"]isEqualToString:@"ok"]) {
//                [WKProgressHUD popMessage:@"修改成功" inView:self.view duration:HUD_DURATION animated:YES];
//                PwLoginViewController *pwLogin = [[PwLoginViewController alloc]init];
//                [self.navigationController pushViewController:pwLogin animated:YES];
//            }else{
//                [WKProgressHUD popMessage:response[@"msg"] inView:self.view duration:HUD_DURATION animated:YES];
//            }
//            
//        } failure:^(NSString *error) {
//            [WKProgressHUD popMessage:@"请检查网络连接" inView:self.view duration:HUD_DURATION animated:YES];
//        }];
        
    }
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
