//
//  PwLoginViewController.m
//  NeiSha
//
//  Created by paperclouds on 16/8/11.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "PwLoginViewController.h"
#import "PwLoginView.h"
#import "VfLoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetPwViewController.h"
#import "NSString+Mobile.h"
#import "MemberCenterViewController.h"
#import "WKWebViewViewController.h"
#import <RongIMKit/RongIMKit.h>
#import <RongIMKit/RCConversationViewController.h>
#import <UMSocialCore/UMSocialCore.h>
#import "WXApi.h"
#import "UMSocialQQHandler.h"
#import <TencentOpenAPI/QQApiInterface.h>


@interface PwLoginViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) PwLoginView *pwLoginView;
@property (nonatomic, strong) UserInfo *userInfo;
@end

@implementation PwLoginViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    self.tabBarController.tabBar.hidden=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andRightBtn:@"会员登录"];
//    navView.backgroundColor = [UIColor blueColor];
    navView.viewController = self;
    [self.view addSubview:navView];
    
//    self.pwLoginView =[[PwLoginView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.pwLoginView = [[PwLoginView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64)];
    [self.view addSubview:self.pwLoginView];
    
    self.pwLoginView.phoneNumTF.text = [USER_DEFAULTS objectForKey:@"mob"];
    self.pwLoginView.passWdTF.text = [USER_DEFAULTS objectForKey:@"password"];
    self.pwLoginView.phoneNumTF.delegate = self;
    self.pwLoginView.passWdTF.delegate = self;
    if ([USER_DEFAULTS objectForKey:@"password"]) {
        self.pwLoginView.pwVisibleBtn.selected = YES;
        self.pwLoginView.rememberPwBtn.titleLabel.font = [UIFont fontWithName:IconFont size:12];
        [self.pwLoginView.rememberPwBtn setTitle:@"\U0000e624" forState:UIControlStateNormal];
        [self.pwLoginView.rememberPwBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
    }
    
    
    
    if (self.pwLoginView.phoneNumTF.text && self.pwLoginView.passWdTF.text) {
        
        [self.pwLoginView.loginBtn setBackgroundColor:BLUE_COLOR];
    }else{
    
        [self.pwLoginView.loginBtn setBackgroundColor:[UIColor colorWithHexString:@"#9b9b9b"]];

    }
    
    [self.pwLoginView.pwVisibleBtn addTarget:self action:@selector(pwVisible) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwLoginView.vfLoginBtn addTarget:self action:@selector(pwLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwLoginView.rememberPwBtn addTarget:self action:@selector(rememberPw) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwLoginView.closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwLoginView.quickRegisterBtn addTarget:self action:@selector(quickRegister) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwLoginView.forgetPwBtn addTarget:self action:@selector(forgetPw) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwLoginView.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
//    第三方登录方法
    [self.pwLoginView.QQbutton addTarget:self action:@selector(QQlogin) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwLoginView.WXbutton addTarget:self action:@selector(WXlogin) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwLoginView.sinaButton addTarget:self action:@selector(sinaLogin) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - 第三方登录
- (void)QQlogin{

    NSLog(@"进行QQ第三方登录操作");
    
    if ([QQApiInterface isQQInstalled]) {
        
        [self getAuthWithUserInfoFromQQ];
    }
}

- (void)WXlogin{

    NSLog(@"进行微信第三方登录操作");
    
    if ([WXApi isWXAppInstalled]) {
        
        [self getAuthWithUserInfoFromWechat];
    }
}

- (void)sinaLogin{

    NSLog(@"进行微博第三方登录操作");
    
    [self getAuthWithUserInfoFromSina];
}


- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
        
        UMSocialUserInfoResponse *resp = result;
        
        // 第三方登录数据(为空表示平台未提供)
        // 授权数据
        NSLog(@" uid: %@", resp.uid);
        NSLog(@" openid: %@", resp.openid);
        NSLog(@" accessToken: %@", resp.accessToken);
        NSLog(@" refreshToken: %@", resp.refreshToken);
        NSLog(@" expiration: %@", resp.expiration);
        
        // 用户数据
        NSLog(@" name: %@", resp.name);
        NSLog(@" iconurl: %@", resp.iconurl);
        NSLog(@" gender: %@", resp.gender);
        
        // 第三方平台SDK原始数据
        NSLog(@" originalResponse: %@", resp.originalResponse);
    }];
}


//新浪微博授权并获取用户信息(获取uid、access token及用户名等)
- (void)getAuthWithUserInfoFromSina
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_Sina currentViewController:nil completion:^(id result, NSError *error) {
        if (error) {
            
        } else {
            UMSocialUserInfoResponse *resp = result;
            
            // 授权信息
            NSLog(@"Sina uid: %@", resp.uid);
            NSLog(@"Sina accessToken: %@", resp.accessToken);
            NSLog(@"Sina refreshToken: %@", resp.refreshToken);
            NSLog(@"Sina expiration: %@", resp.expiration);
            
            // 用户信息
            NSLog(@"Sina name: %@", resp.name);
            NSLog(@"Sina iconurl: %@", resp.iconurl);
            NSLog(@"Sina gender: %@", resp.gender);
            
            // 第三方平台SDK源数据
            NSLog(@"Sina originalResponse: %@", resp.originalResponse);
        }
    }];
}


//QQ授权并获取用户信息(获取uid、access token及用户名等)
- (void)getAuthWithUserInfoFromQQ
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error) {
        if (error) {
            
        } else {
            UMSocialUserInfoResponse *resp = result;
            
            // 授权信息
            NSLog(@"QQ uid: %@", resp.uid);
            NSLog(@"QQ openid: %@", resp.openid);
            NSLog(@"QQ accessToken: %@", resp.accessToken);
            NSLog(@"QQ expiration: %@", resp.expiration);
            
            // 用户信息
            NSLog(@"QQ name: %@", resp.name);
            NSLog(@"QQ iconurl: %@", resp.iconurl);
            NSLog(@"QQ gender: %@", resp.gender);
            
            // 第三方平台SDK源数据
            NSLog(@"QQ originalResponse: %@", resp.originalResponse);
        }
    }];
}


//微信授权并获取用户信息(获取uid、access token及用户名等)
- (void)getAuthWithUserInfoFromWechat
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:self completion:^(id result, NSError *error) {
        if (error) {
            
        } else {
            UMSocialUserInfoResponse *resp = result;
            
            // 授权信息
            NSLog(@"Wechat uid: %@", resp.uid);
            NSLog(@"Wechat openid: %@", resp.openid);
            NSLog(@"Wechat accessToken: %@", resp.accessToken);
            NSLog(@"Wechat refreshToken: %@", resp.refreshToken);
            NSLog(@"Wechat expiration: %@", resp.expiration);
            
            // 用户信息
            NSLog(@"Wechat name: %@", resp.name);
            NSLog(@"Wechat iconurl: %@", resp.iconurl);
            NSLog(@"Wechat gender: %@", resp.gender);
            
            // 第三方平台SDK源数据
            NSLog(@"Wechat originalResponse: %@", resp.originalResponse);
        }
    }];
}

#pragma mark - 账号密码登录

// 密码可见
- (void)pwVisible{
    self.pwLoginView.pwVisibleBtn.selected = !self.pwLoginView.pwVisibleBtn.isSelected;
    
    if (self.pwLoginView.pwVisibleBtn.isSelected) {
        [self.pwLoginView.pwVisibleBtn setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
        self.pwLoginView.passWdTF.secureTextEntry = NO;
    }else{
        [self.pwLoginView.pwVisibleBtn setTitleColor:[UIColor colorWithHexString:@"#787878"] forState:UIControlStateNormal];
        self.pwLoginView.passWdTF.secureTextEntry = YES;
    }
}

// 密码登录
- (void)pwLogin{
    VfLoginViewController *vfLogin = [[VfLoginViewController alloc]init];
    if (self.jumpURL) {
        
        vfLogin.jumpURL = self.jumpURL;
    }
    
    [self.navigationController pushViewController:vfLogin animated:YES];
}

// 记住密码
- (void)rememberPw{
    self.pwLoginView.rememberPwBtn.selected = !self.pwLoginView.rememberPwBtn.isSelected;
    
    if (self.pwLoginView.rememberPwBtn.isSelected) {
        self.pwLoginView.rememberPwBtn.titleLabel.font = [UIFont fontWithName:IconFont size:12];
        [self.pwLoginView.rememberPwBtn setTitle:@"\U0000e624" forState:UIControlStateNormal];
        [self.pwLoginView.rememberPwBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        //[self.pwLoginView.rememberPwBtn sizeToFit];
    }else{
        self.pwLoginView.rememberPwBtn.titleLabel.font = [UIFont fontWithName:IconFont size:12];
        [self.pwLoginView.rememberPwBtn setTitle:@"" forState:UIControlStateNormal];
        [self.pwLoginView.rememberPwBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        //[self.pwLoginView.rememberPwBtn sizeToFit];
    }
}

// 登录
- (void)login{
    self.phoneNum = self.pwLoginView.phoneNumTF.text;
    self.passWd = self.pwLoginView.passWdTF.text;
    
    if ([self.phoneNum isEqualToString:@""]) {
        [WKProgressHUD popMessage:@"请输入用户名" inView:self.view duration:HUD_DURATION animated:YES];
    }else if ([self.passWd isEqualToString:@""]){
        [WKProgressHUD popMessage:@"请输入密码" inView:self.view duration:HUD_DURATION animated:YES];
    }
//    else if (![self.phoneNum isMobileNumber]){
//        [WKProgressHUD popMessage:@"请输入正确的手机号" inView:self.view duration:HUD_DURATION animated:YES];
//    }
    else{
        
//        NSDictionary *parameters = @{@"logmob":self.phoneNum,@"logpassword":self.passWd,@"wxopenId":@"",@"logincode":@""};
        
        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@/%@/%@",HOST_URL,LOGIN_PW,self.phoneNum,self.passWd] parameters:nil success:^(id response) {

            if ([response[@"resultCode"]integerValue] == 1000) {
            [WKProgressHUD popMessage:@"登录成功" inView:self.view duration:HUD_DURATION animated:YES];
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

                    self.userInfo = [UserInfo sharedUserInfo];
                    self.userInfo.uid = response[@"data"][@"uid"];
                    self.userInfo.token = response[@"data"][@"token"];
                    self.userInfo.uname = response[@"data"][@"uname"];
                    self.userInfo.contacts = response[@"data"][@"contacts"];
                    self.userInfo.mobile = response[@"data"][@"mobile"];
                    self.userInfo.isLogin = YES;
                    
                    self.userInfo.password = self.passWd;

                    [USER_DEFAULTS setObject:_userInfo.uid forKey:@"uid"];
                    [USER_DEFAULTS setObject:_userInfo.token forKey:@"token"];
                    [USER_DEFAULTS setObject:_userInfo.uname forKey:@"uname"];
                    [USER_DEFAULTS setObject:_userInfo.contacts forKey:@"contacts"];
                    [USER_DEFAULTS setObject:_userInfo.mobile forKey:@"mobile"];

                    [USER_DEFAULTS synchronize];
                
                    [self passregisterid];
                
                    [self getRongToken];
                    
                    
                    if (_pwLoginView.rememberPwBtn.isSelected) {
                    [USER_DEFAULTS setObject:_userInfo.password forKey:@"password"];
                    }else{
                    [USER_DEFAULTS setObject:@"" forKey:@"password"];
                    }
                    [USER_DEFAULTS synchronize];

                
                [self.navigationController popToRootViewControllerAnimated:NO];
                    self.tabBarController.selectedIndex = 3;
                
//                发出通知
                [[NSNotificationCenter defaultCenter] postNotificationName:@"sucess" object:self];
                    
                    
//                });

            }else if ([response[@"resultCode"]integerValue] == 1003){
                
                [WKProgressHUD popMessage:@"不存在该用户" inView:self.view duration:HUD_DURATION animated:YES];
            }else if ([response[@"resultCode"]integerValue] == 1004){
                
                [WKProgressHUD popMessage:@"验证码过期" inView:self.view duration:HUD_DURATION animated:YES];
            }else if ([response[@"resultCode"]integerValue] == 1008){
                
                [WKProgressHUD popMessage:@"参数错误" inView:self.view duration:HUD_DURATION animated:YES];
            }else if ([response[@"resultCode"]integerValue] == 1009){
                
                [WKProgressHUD popMessage:@"账号已过期" inView:self.view duration:HUD_DURATION animated:YES];
            }else if ([response[@"resultCode"]integerValue] == 1010){
                
                [WKProgressHUD popMessage:@"密码错误" inView:self.view duration:HUD_DURATION animated:YES];
            }

            else{
                [WKProgressHUD popMessage:@"登录失败" inView:self.view duration:HUD_DURATION animated:YES];
            }

        } failure:^(NSString *error) {
            NSLog(@"%@",error);
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


//登录成功后传registerid给服务端
- (void)passregisterid{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *registrationID = [defaults objectForKey:@"registerid"];
    if (registrationID) {
        
        //            传给服务器
        NSDictionary *parameters = @{@"xiaomiToken":@"",@"jiguangToken":registrationID,@"huaweiToken":@""};
        
        
        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,JPUSH_SAVE] parameters:parameters success:^(id response) {
            
            if ([response[@"resultCode"]integerValue] == 1000) {
                
                NSLog(@"PW推送token成功");
                
                NSLog(@"regit ID ======%@",registrationID);
            }else if ([response[@"resultCode"]integerValue] == 1001){
                
                NSLog(@"PW推送token1001");
                
            }else if ([response[@"resultCode"]integerValue] == 1008){
                
                NSLog(@"PW推送token1008");
            }
            
        } failure:^(NSString *error) {
            NSLog(@"%@",error);
            NSLog(@"PW推送token error");
            
        }];
        
        
    }
    else{
        
        NSLog(@"registrationID获取失败");
    }
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    [textField resignFirstResponder];
    return YES;
}
// 快速注册
- (void)quickRegister{
    RegisterViewController *regist = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:regist animated:YES];
}

// 忘记密码
- (void)forgetPw{
    ForgetPwViewController *forgetPw = [[ForgetPwViewController alloc]init];
    [self.navigationController pushViewController:forgetPw animated:YES];
}

// 关闭
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
