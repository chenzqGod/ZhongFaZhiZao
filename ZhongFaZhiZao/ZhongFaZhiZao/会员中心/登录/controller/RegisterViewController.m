//
//  RegisterViewController.m
//  NeiSha
//
//  Created by paperclouds on 16/8/10.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "NSString+Mobile.h"
#import "DelegateViewController.h"
#import "PwLoginViewController.h"
#import "NSNetworking.h"

@interface RegisterViewController ()

@property (nonatomic,strong) RegisterView *registView;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.registView = [[RegisterView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.registView];
    
//    self.registView.navView.viewController = self;
    
    [self.registView.getvfCodeBtn addTarget:self action:@selector(getVfCode:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.registView.delegateBtn addTarget:self action:@selector(delegate) forControlEvents:UIControlEventTouchUpInside];
    
    [self.registView.pwVisibleBtn addTarget:self action:@selector(pwVisible) forControlEvents:UIControlEventTouchUpInside];
    
    [self.registView.registerBtn addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
}

// 获取验证码
- (void)getVfCode:(UIButton *)sender{
    
    self.phoneNum = self.registView.phoneNumTF.text;
    
    if ([self.phoneNum isEqualToString:@""]) {
        [WKProgressHUD popMessage:@"请输入手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else if (![self.phoneNum isMobileNumber]){
        [WKProgressHUD popMessage:@"请输入正确的手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else{
        
        NSDictionary *parameters = @{@"mob":self.phoneNum};
        
        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,REGIST_VF] parameters:parameters success:^(id response) {
            if ([response[@"state"] isEqualToString:@"Y"]) {
                [WKProgressHUD popMessage:@"验证码已发送" inView:self.view duration:HUD_DURATION animated:YES];
                __block int timeout = 60; // 倒计时时间
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
                dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); // 每秒执行
                dispatch_source_set_event_handler(_timer, ^{
                    if (timeout <= 1) // 倒计时结束关闭
                    {
                        dispatch_source_cancel(_timer);
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            [sender setTitle:@"获取验证码" forState:UIControlStateNormal];
                            sender.userInteractionEnabled = YES;
                        });
                    }
                    else
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            [UIView beginAnimations:nil context:nil];
                            [UIView setAnimationDuration:1.0f];
                            [sender setTitle:[NSString stringWithFormat:@"%ds", timeout] forState:UIControlStateNormal];
                            [UIView commitAnimations];
                            sender.userInteractionEnabled = NO;
                        });
                        
                        timeout--;
                    }
                });
                
                dispatch_resume(_timer);
            }
        } failure:^(NSString *error) {
            [WKProgressHUD popMessage:@"请检查网络连接" inView:self.view duration:HUD_DURATION animated:YES];
        }];
    }

}

- (void)delegate{
    DelegateViewController *delegate =[[DelegateViewController alloc]init];
    [self.navigationController pushViewController:delegate animated:YES];
}

// 密码可见
- (void)pwVisible{
    self.registView.pwVisibleBtn.selected = !self.registView.pwVisibleBtn.isSelected;
    
    if (self.registView.pwVisibleBtn.isSelected) {
        [self.registView.pwVisibleBtn setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
        self.registView.passWdTF.secureTextEntry = NO;
    }else{
        [self.registView.pwVisibleBtn setTitleColor:[UIColor colorWithHexString:@"#787878"] forState:UIControlStateNormal];
        self.registView.passWdTF.secureTextEntry = YES;
    }
}

// 注册
- (void)regist{
    
    self.phoneNum = self.registView.phoneNumTF.text;
    self.verifyCode = self.registView.vfCodeTF.text;
    self.passWd = self.registView.passWdTF.text;
    
    if ([self.phoneNum isEqualToString:@""]) {
        [WKProgressHUD popMessage:@"请输入手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else if ([self.verifyCode isEqualToString:@""]){
        [WKProgressHUD popMessage:@"请输入验证码" inView:self.view duration:HUD_DURATION animated:YES];
    }else if ([self.passWd isEqualToString:@""]){
        [WKProgressHUD popMessage:@"请输入密码" inView:self.view duration:HUD_DURATION animated:YES];
    }else if (![self.phoneNum isMobileNumber]){
        [WKProgressHUD popMessage:@"请输入正确的手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else if (self.passWd.length < 6){
        [WKProgressHUD popMessage:@"密码长度不能小于6位" inView:self.view duration:HUD_DURATION animated:YES];
    }else if (self.passWd.length > 16){
        [WKProgressHUD popMessage:@"密码长度不能大于16位" inView:self.view duration:HUD_DURATION animated:YES];
    }else{
        NSDictionary *parameters = @{@"logmob":self.phoneNum,@"logpassword":self.passWd,@"logincode":self.verifyCode};
        
        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,REGIST] parameters:parameters success:^(id response) {
            if ([response[@"resultCode"]isEqualToString:@"1000"]) {
                [WKProgressHUD popMessage:@"注册成功" inView:self.view duration:HUD_DURATION animated:YES];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    PwLoginViewController *pwLogin = [[PwLoginViewController alloc]init];
                    [self.navigationController pushViewController:pwLogin animated:YES];
                });
            }else if ([response[@"resultCode"]isEqualToString:@"1001"]){
                [WKProgressHUD popMessage:@"失败" inView:self.view duration:HUD_DURATION animated:YES];
            }else if ( [response[@"resultCode"]isEqualToString:@"1004"]){
            
                [WKProgressHUD popMessage:@"验证码过期" inView:self.view duration:HUD_DURATION animated:YES];
            }
            
        } failure:^(NSString *error) {
            [WKProgressHUD popMessage:@"请检查网络连接" inView:self.view duration:HUD_DURATION animated:YES];
        }];
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
