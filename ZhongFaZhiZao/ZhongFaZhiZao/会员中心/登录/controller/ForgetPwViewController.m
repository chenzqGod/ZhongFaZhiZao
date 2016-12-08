//
//  ForgetPwViewController.m
//  NeiSha
//
//  Created by paperclouds on 16/8/12.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "ForgetPwViewController.h"
#import "ForgetPwView.h"
#import "SetPwViewController.h"
#import "NSString+Mobile.h"

@interface ForgetPwViewController ()

@property (nonatomic,strong) ForgetPwView *forgetView;
@end

@implementation ForgetPwViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view .backgroundColor = [UIColor whiteColor];
    
    self.forgetView = [[ForgetPwView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.forgetView];
    
//    self.forgetView.navView.viewController = self;
    
    [self.forgetView.getvfCodeBtn addTarget:self action:@selector(getVfCode:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.forgetView.nextBtn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
}

// 获取验证码
- (void)getVfCode:(UIButton *)sender{
    self.phoneNum = self.forgetView.phoneNumTF.text;
    
    if ([self.phoneNum isEqualToString:@""]) {
        [WKProgressHUD popMessage:@"请输入手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else if (![self.phoneNum isMobileNumber]){
        [WKProgressHUD popMessage:@"请输入正确的手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else{
        NSDictionary *parameters = @{@"mob":self.phoneNum};
        
//        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,SEND_VF] parameters:parameters success:^(id response) {
//            if ([response[@"msg"] isEqualToString:@"ok"]) {
//                [WKProgressHUD popMessage:@"验证码已发送" inView:self.view duration:HUD_DURATION animated:YES];
//                __block int timeout = 60; // 倒计时时间
//                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//                dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//                dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); // 每秒执行
//                dispatch_source_set_event_handler(_timer, ^{
//                    if (timeout <= 1) // 倒计时结束关闭
//                    {
//                        dispatch_source_cancel(_timer);
//                        dispatch_async(dispatch_get_main_queue(), ^{
//                            
//                            [sender setTitle:@"获取验证码" forState:UIControlStateNormal];
//                            sender.userInteractionEnabled = YES;
//                        });
//                    }
//                    else
//                    {
//                        dispatch_async(dispatch_get_main_queue(), ^{
//                            
//                            [UIView beginAnimations:nil context:nil];
//                            [UIView setAnimationDuration:1.0f];
//                            [sender setTitle:[NSString stringWithFormat:@"%ds", timeout] forState:UIControlStateNormal];
//                            [UIView commitAnimations];
//                            sender.userInteractionEnabled = NO;
//                        });
//                        
//                        timeout--;
//                    }
//                });
//                
//                dispatch_resume(_timer);
//            }
//        } failure:^(NSString *error) {
//            [WKProgressHUD popMessage:@"请检查网络连接" inView:self.view duration:HUD_DURATION animated:YES];
//        }];
    }
}

// 下一步
- (void)next{
    self.phoneNum = self.forgetView.phoneNumTF.text;
    self.vfCode = self.forgetView.vfCodeTF.text;
    
    if ([self.phoneNum isEqualToString:@""]) {
        [WKProgressHUD popMessage:@"请输入手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else if ([self.vfCode isEqualToString:@""]){
        [WKProgressHUD popMessage:@"请输入验证码" inView:self.view duration:HUD_DURATION animated:YES];
    }else if (![self.phoneNum isMobileNumber]){
        [WKProgressHUD popMessage:@"请输入正确的手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }else{
        
        NSDictionary *parameters = @{@"mob":self.phoneNum,@"code":self.vfCode};
        
//        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,FOGET_PW] parameters:parameters success:^(id response) {
//            if ([response[@"msg"]isEqualToString:@"ok"]) {
//                SetPwViewController *setPw = [[SetPwViewController alloc]init];
//                setPw.vfCode = self.vfCode;
//                [self.navigationController pushViewController:setPw animated:YES];
//            }
//        } failure:^(NSString *error) {
//        [WKProgressHUD popMessage:@"请检查网络连接" inView:self.view duration:HUD_DURATION animated:YES];
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
