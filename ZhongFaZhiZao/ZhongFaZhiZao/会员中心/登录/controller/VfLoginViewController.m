//
//  LoginViewController.m
//  NeiSha
//
//  Created by paperclouds on 16/8/11.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "VfLoginViewController.h"
#import "VfLoginView.h"
#import "PwLoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetPwViewController.h"
#import "NSString+Mobile.h"
#import "NSNetworking.h"

@interface VfLoginViewController ()

@property (nonatomic,strong) VfLoginView *vfLoginView;
@property (nonatomic, strong) UserInfo *userInfo;
@end

@implementation VfLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];

    self.vfLoginView =[[VfLoginView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.vfLoginView];

    [self.vfLoginView.pwLoginBtn addTarget:self action:@selector(pwLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [self.vfLoginView.closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    [self.vfLoginView.quickRegisterBtn addTarget:self action:@selector(quickRegister) forControlEvents:UIControlEventTouchUpInside];
    
    [self.vfLoginView.forgetPwBtn addTarget:self action:@selector(forgetPw) forControlEvents:UIControlEventTouchUpInside];

    [self.vfLoginView.getvfCodeBtn addTarget:self action:@selector(getvfCode:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.vfLoginView.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];

}

- (void)pwLogin{
    PwLoginViewController *pwLogin = [[PwLoginViewController alloc]init];
//    [self.navigationController pushViewController:pwLogin animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)quickRegister{
    RegisterViewController *regist = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:regist animated:YES];
}

- (void)forgetPw{
    ForgetPwViewController *forgetPw = [[ForgetPwViewController alloc]init];
    [self.navigationController pushViewController:forgetPw animated:YES];
}

// 获取验证码
- (void)getvfCode:(UIButton *)sender{
    self.phoneNum = self.vfLoginView.phoneNumTF.text;
    
    if ([self.phoneNum isEqualToString:@""]) {
        [WKProgressHUD popMessage:@"请输入手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else if (![self.phoneNum isMobileNumber]){
        [WKProgressHUD popMessage:@"请输入正确的手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else{
        
        NSDictionary *parameters = @{@"mob":self.phoneNum};
        
//        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HOST_URL,LOGIN_VF,self.phoneNum]];
//        
//        NSLog(@"url url == %@",url);
//        
        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@/%@",HOST_URL,SEND_VF,self.phoneNum] parameters:nil success:^(id response) {
            if ([response[@"rusultCode"] isEqualToString:@"1000"]) {
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
            
            
            NSLog(@"error == %@",error);
        }];
    }
}

// 登录
- (void)login{
    self.phoneNum = self.vfLoginView.phoneNumTF.text;
    self.vfCode = self.vfLoginView.vfCodeTF.text;
    
    if ([self.phoneNum isEqualToString:@""]) {
        [WKProgressHUD popMessage:@"请输入手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else if ([self.vfCode isEqualToString:@""]){
        [WKProgressHUD popMessage:@"请输入验证码" inView:self.view duration:HUD_DURATION animated:YES];
    }else if (![self.phoneNum isMobileNumber]){
        [WKProgressHUD popMessage:@"请输入正确的手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else{
        
        NSDictionary *parameters = @{@"logmob":self.phoneNum,@"logincode":self.vfCode};
        
        
        
        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,LOGIN] parameters:parameters success:^(id response) {
            if ([response[@"resultCode"]isEqualToString:@"1000"]) {
                [WKProgressHUD popMessage:@"登录成功" inView:self.view duration:HUD_DURATION animated:YES];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.userInfo = [UserInfo sharedUserInfo];
                    self.userInfo.desId = response[@"desId"];
                    self.userInfo.mob = response[@"mob"];
                    self.userInfo.nickName = response[@"nick_name"];
                    self.userInfo.photo = response[@"photo"];
                    self.userInfo.createDate = response[@"create_date"];
                    self.userInfo.uid = response[@"uid"];
                    self.userInfo.isLogin = YES;
                    
                    [USER_DEFAULTS setObject:_userInfo.desId forKey:@"desId"];
                    [USER_DEFAULTS setObject:_userInfo.mob forKey:@"mob"];
                    [USER_DEFAULTS setObject:_userInfo.nickName forKey:@"nick_name"];
                    [USER_DEFAULTS setObject:_userInfo.photo forKey:@"photo"];
                    [USER_DEFAULTS setObject:_userInfo.createDate forKey:@"create_date"];
                    [USER_DEFAULTS setObject:_userInfo.uid forKey:@"uid"];
                    [USER_DEFAULTS synchronize];
//                    [(NeiShaTabbar *)self.tabBarController showImageView];
                });
            }else{
                [WKProgressHUD popMessage:@"失败" inView:self.view duration:HUD_DURATION animated:YES];
            }
            
        } failure:^(NSString *error) {
            [WKProgressHUD popMessage:@"请检查网络连接" inView:self.view duration:HUD_DURATION animated:YES];
        }];
    }

}

- (void)close{
    [self.navigationController popViewControllerAnimated:YES];
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
