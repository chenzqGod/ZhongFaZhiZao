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

@interface PwLoginViewController ()

@property (nonatomic,strong) PwLoginView *pwLoginView;
@property (nonatomic, strong) UserInfo *userInfo;
@end

@implementation PwLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.pwLoginView =[[PwLoginView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.pwLoginView];
    
    self.pwLoginView.phoneNumTF.text = [USER_DEFAULTS objectForKey:@"mob"];
    self.pwLoginView.passWdTF.text = [USER_DEFAULTS objectForKey:@"password"];
    
    if ([USER_DEFAULTS objectForKey:@"password"]) {
        self.pwLoginView.pwVisibleBtn.selected = YES;
        self.pwLoginView.rememberPwBtn.titleLabel.font = [UIFont fontWithName:IconFont size:12];
        [self.pwLoginView.rememberPwBtn setTitle:@"\U0000e624" forState:UIControlStateNormal];
        [self.pwLoginView.rememberPwBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
    }
    
    [self.pwLoginView.pwVisibleBtn addTarget:self action:@selector(pwVisible) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwLoginView.vfLoginBtn addTarget:self action:@selector(pwLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwLoginView.rememberPwBtn addTarget:self action:@selector(rememberPw) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwLoginView.closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwLoginView.quickRegisterBtn addTarget:self action:@selector(quickRegister) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwLoginView.forgetPwBtn addTarget:self action:@selector(forgetPw) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwLoginView.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
}

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
        [WKProgressHUD popMessage:@"请输入手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else if ([self.passWd isEqualToString:@""]){
        [WKProgressHUD popMessage:@"请输入密码" inView:self.view duration:HUD_DURATION animated:YES];
    }else if (![self.phoneNum isMobileNumber]){
        [WKProgressHUD popMessage:@"请输入正确的手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else{
        
        NSDictionary *parameters = @{@"logmob":self.phoneNum,@"logpassword":self.passWd,@"wxopenId":@"",@"logincode":@""};
        
//        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,LOGIN] parameters:parameters success:^(id response) {
//            NSLog(@"%@",response[@"msg"]);
//            if ([response[@"msg"]isEqualToString:@"ok"]) {
//            [WKProgressHUD popMessage:@"登录成功" inView:self.view duration:HUD_DURATION animated:YES];
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                    self.userInfo = [UserInfo sharedUserInfo];
//                    self.userInfo.desId = response[@"desId"];
//                    self.userInfo.mob = response[@"mob"];
//                    self.userInfo.nickName = response[@"nick_name"];
//                    self.userInfo.photo = response[@"photo"];
//                    self.userInfo.createDate = response[@"create_date"];
//                    self.userInfo.uid = response[@"uid"];
//                    self.userInfo.isLogin = YES;
//                    
//                    self.userInfo.password = self.passWd;
//                    [USER_DEFAULTS setObject:_userInfo.desId forKey:@"desId"];
//                    [USER_DEFAULTS setObject:_userInfo.mob forKey:@"mob"];
//                    [USER_DEFAULTS setObject:_userInfo.nickName forKey:@"nick_name"];
//                    [USER_DEFAULTS setObject:_userInfo.photo forKey:@"photo"];
//                    [USER_DEFAULTS setObject:_userInfo.createDate forKey:@"create_date"];
//                    [USER_DEFAULTS setObject:_userInfo.uid forKey:@"uid"];
//                    if (_pwLoginView.rememberPwBtn.isSelected) {
//                    [USER_DEFAULTS setObject:_userInfo.password forKey:@"password"];
//                    }else{
//                    [USER_DEFAULTS setObject:@"" forKey:@"password"];
//                    }
//                    [USER_DEFAULTS synchronize];
//                    [(NeiShaTabbar *)self.tabBarController showImageView];
//                });
//
//            }else{
//            [WKProgressHUD popMessage:response[@"msg"] inView:self.view duration:HUD_DURATION animated:YES];
//            }
//            
//        } failure:^(NSString *error) {
//            NSLog(@"%@",error);
//            [WKProgressHUD popMessage:@"请检查网络连接" inView:self.view duration:HUD_DURATION animated:YES];
//        }];
        
    }
    
    
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
