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
#import "MemberCenterViewController.h"
#import "WKWebViewViewController.h"
#import <RongIMKit/RongIMKit.h>
#import <RongIMKit/RCConversationViewController.h>

@interface VfLoginViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) VfLoginView *vfLoginView;
@property (nonatomic, strong) UserInfo *userInfo;
@end

@implementation VfLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];

    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andRightBtn:@"动态密码登录"];
    navView.viewController = self;
    
    [self.view addSubview:navView];
    
    self.vfLoginView =[[VfLoginView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64)];
    [self.view addSubview:self.vfLoginView];

    [self.vfLoginView.pwLoginBtn addTarget:self action:@selector(pwLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [self.vfLoginView.closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    [self.vfLoginView.quickRegisterBtn addTarget:self action:@selector(quickRegister) forControlEvents:UIControlEventTouchUpInside];
    
    [self.vfLoginView.forgetPwBtn addTarget:self action:@selector(forgetPw) forControlEvents:UIControlEventTouchUpInside];

    [self.vfLoginView.getvfCodeBtn addTarget:self action:@selector(getvfCode:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.vfLoginView.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];

    self.vfLoginView.phoneNumTF.delegate = self;
    self.vfLoginView.vfCodeTF.delegate = self;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    textField.returnKeyType = UIReturnKeyNext;
    
    return YES;
}



- (void)pwLogin{
//    PwLoginViewController *pwLogin = [[PwLoginViewController alloc]init];
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
        
//        NSDictionary *parameters = @{@"mob":self.phoneNum};
        
//        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HOST_URL,LOGIN_VF,self.phoneNum]];
//        
//        NSLog(@"url url == %@",url);
//        
        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@/%@",HOST_URL,LOGIN_VF,self.phoneNum] parameters:nil success:^(id response) {
            if ([response[@"resultCode"]integerValue] == 1000 ) {
            
                
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
            else if ([response[@"resultCode"]integerValue] == 1001){
            
                [WKProgressHUD popMessage:@"发送失败" inView:self.view duration:HUD_DURATION animated:YES];
            }
            
        }
         

                    failure:^(NSString *error) {
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
        
//        NSDictionary *parameters = @{@"logmob":self.phoneNum,@"logincode":self.vfCode};
        
        
        
        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@/%@/%@",HOST_URL,LOGIN,self.phoneNum,self.vfCode] parameters:nil success:^(id response) {
            if ([response[@"resultCode"]integerValue] == 1000) {
                [WKProgressHUD popMessage:@"登录成功" inView:self.view duration:HUD_DURATION animated:YES];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.userInfo = [UserInfo sharedUserInfo];

                    self.userInfo.uid = response[@"data"][@"uid"];
                    self.userInfo.token = response[@"data"][@"token"];
                    self.userInfo.uname = response[@"data"][@"uname"];
                    self.userInfo.contacts = response[@"data"][@"contacts"];
                    self.userInfo.mobile = response[@"data"][@"mobile"];
                    self.userInfo.isLogin = YES;
                    
                    [USER_DEFAULTS setObject:_userInfo.uid forKey:@"uid"];
                    [USER_DEFAULTS setObject:_userInfo.token forKey:@"token"];
                    [USER_DEFAULTS setObject:_userInfo.uname forKey:@"uname"];
                    [USER_DEFAULTS setObject:_userInfo.contacts forKey:@"contacts"];
                    [USER_DEFAULTS setObject:_userInfo.mobile forKey:@"mobile"];
                    [USER_DEFAULTS synchronize];
                    
                    [self passregisterid];
                    [self getRongToken];
                    
                    
                    [self.navigationController popToRootViewControllerAnimated:NO];
                    self.tabBarController.selectedIndex = 3;
                    
                    //                调用通知
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"sucess" object:self];

//
//                    }

//                    跳转到上2级页面
//                    UIViewController * viewVC = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 2];
//                    [self.navigationController popToViewController:viewVC animated:YES];
                    
//                    NSArray *controllers = [self.navigationController viewControllers];
//                    [self.navigationController popToViewController:controllers[controllers.count - 2] animated:YES];
                    
                });
            }else if ([response[@"resultCode"]integerValue] == 1003){
            
                [WKProgressHUD popMessage:@"不存在该用户" inView:self.view duration:HUD_DURATION animated:YES];
            }else if ([response[@"resultCode"]integerValue] == 1004){
                
                [WKProgressHUD popMessage:@"验证码过期" inView:self.view duration:HUD_DURATION animated:YES];
            }else if ([response[@"resultCode"]integerValue] == 1008){
                
                [WKProgressHUD popMessage:@"参数错误" inView:self.view duration:HUD_DURATION animated:YES];
            }else if ([response[@"resultCode"]integerValue] == 1009){
                
                [WKProgressHUD popMessage:@"账号已过期" inView:self.view duration:HUD_DURATION animated:YES];
            }else if ([response[@"resultCode"]integerValue] == 1006){
                
                [WKProgressHUD popMessage:@"手机号格式错误" inView:self.view duration:HUD_DURATION animated:YES];
            }
            else{
                [WKProgressHUD popMessage:@"登录失败" inView:self.view duration:HUD_DURATION animated:YES];
            }
            
        } failure:^(NSString *error) {
            [WKProgressHUD popMessage:@"请检查网络连接" inView:self.view duration:HUD_DURATION animated:YES];
        }];
    }

}


-(void)getRongToken{
    
    [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,GETRONG_TOKEN] parameters:nil success:^(id response) {
        
        //        _rongDic = [NSMutableDictionary dictionaryWithDictionary:response];
        
        [USER_DEFAULTS setObject:response[@"token"] forKey:@"rongtoken"];
        
        NSString *token = [USER_DEFAULTS objectForKey:@"rongtoken"];
        
        if ([USER_DEFAULTS objectForKey:@"token"]) {
            
            [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
                
                //设置用户信息提供者,页面展现的用户头像及昵称都会从此代理取 这里会跳到会话列表界面  就是我们平常QQ聊天都有一个
                
                //        会话的列表  如果想直接跳到聊天界面 下面再说
                
                //                [[RCIM sharedRCIM] setUserInfoDataSource:self];
                
                NSLog(@"Login successfully with userId: %@.", userId);
                
                
            } error:^(RCConnectErrorCode status) {
                
                NSLog(@"login error status: %ld.", (long)status);
                
            } tokenIncorrect:^{
                
                NSLog(@"token 无效 ，请确保生成token 使用的appkey 和初始化时的appkey 一致");
                
            }];
            
        }
        
    } failure:^(NSString *error) {
        
    }];
    
}

- (void)close{
    [self.navigationController popViewControllerAnimated:YES];
}


//登录成功后传registerid给服务端
- (void)passregisterid{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *registrationID = [defaults objectForKey:@"registerid"];
    if (registrationID) {
        
        //            传给服务器
        NSDictionary *parameters = @{@"xiaomiToken":@"",@"jiguangToken":registrationID,@"huaweiToken":@""};
        
        
        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,JPUSH_SAVE] parameters:parameters success:^(id response) {
            
            if ([response[@"resultCode"]integerValue] == 1000) {
                
                NSLog(@"VF推送token成功");
                
                NSLog(@"regit ID ======%@",registrationID);
            }else if ([response[@"resultCode"]integerValue] == 1001){
                
                NSLog(@"VF推送token1001");
                
            }else if ([response[@"resultCode"]integerValue] == 1008){
                
                NSLog(@"VF推送token1008");
            }
            
        } failure:^(NSString *error) {
            NSLog(@"%@",error);
            NSLog(@"VF推送token error");
            
        }];
        
        
    }
    else{
        
        NSLog(@"registrationID获取失败");
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
