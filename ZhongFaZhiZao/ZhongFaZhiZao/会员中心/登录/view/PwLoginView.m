//
//  PwLoginView.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/6.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "PwLoginView.h"

@implementation PwLoginView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addSubviews];
    }
    
    return self;
}

- (void)addSubviews {

    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    [self addSubview:self.scrollView];
    
    self.logoView = [[UIImageView alloc]init];
    self.logoView.image = [UIImage imageNamed:@"neisha_"];
    [self.scrollView addSubview:self.logoView];
    
    self.phoneNumLbl = [[UIImageView alloc]init];
//    self.phoneNumLbl.font = [UIFont fon];
    self.phoneNumLbl.image = @"\U0000e605";
    self.phoneNumLbl.backgroundColor = [UIColor colorWithHexString:@"#b4b4b4"];
    [self.phoneNumLbl sizeToFit];
    [self.scrollView addSubview:self.phoneNumLbl];
    
    self.phoneNumTF = [[UITextField alloc]init];
    self.phoneNumTF.leftView = self.phoneNumLbl;
    self.phoneNumTF.leftViewMode = UITextFieldViewModeAlways;
    self.phoneNumTF.placeholder = @"请输入手机号码";
    self.phoneNumTF.font = [UIFont boldSystemFontOfSize:15];
    self.phoneNumTF.textColor = [UIColor colorWithHexString:@"#646464"];
    [self.scrollView addSubview:self.phoneNumTF];
    
    self.firstLine = [[UIView alloc]init];
    self.firstLine.backgroundColor = [UIColor colorWithHexString:@"#b4b4b4"];
    [self.scrollView addSubview:self.firstLine];
    
    self.passWdLbl = [[UIImageView alloc]init];
//    self.passWdLbl.font = [UIFont fontWithName:IconFont size:26];
    self.passWdLbl.image = @"\U0000e608";
    self.passWdLbl.backgroundColor = [UIColor colorWithHexString:@"#b4b4b4"];
    [self.passWdLbl sizeToFit];
    [self.scrollView addSubview:self.passWdLbl];
    
    self.passWdTF = [[UITextField alloc]init];
    self.passWdTF.leftView = self.passWdLbl;
    self.passWdTF.leftViewMode = UITextFieldViewModeAlways;
    self.passWdTF.rightView = self.pwVisibleBtn;
    self.passWdTF.rightViewMode = UITextFieldViewModeAlways;
    self.passWdTF.placeholder = @"请输入您的密码";
    self.passWdTF.font = [UIFont systemFontOfSize:15];
    self.passWdTF.secureTextEntry = YES;
    self.passWdTF.textColor = [UIColor colorWithHexString:@"#646464"];
    [self.scrollView addSubview:self.passWdTF];
    
    self.secondLine = [[UIView alloc]init];
    self.secondLine.backgroundColor = [UIColor colorWithHexString:@"#b4b4b4"];
    [self.scrollView addSubview:self.secondLine];
    
    
    self.pwVisibleBtn = [[UIButton alloc]init];
    self.pwVisibleBtn.titleLabel.font = [UIFont fontWithName:IconFont size:26];
    [self.pwVisibleBtn setTitle:@"\U0000e607" forState:UIControlStateNormal];
    [self.pwVisibleBtn setTitleColor:[UIColor colorWithHexString:@"#787878"] forState:UIControlStateNormal];
    [self.pwVisibleBtn sizeToFit];
    [self.scrollView addSubview:self.pwVisibleBtn];
    
    self.vfLoginBtn = [[UIButton alloc]init];
    [self.vfLoginBtn setTitle:@"验证码登录" forState:UIControlStateNormal];
    [self.vfLoginBtn setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
    self.vfLoginBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    [self.scrollView addSubview:self.vfLoginBtn];
    
    self.rememberPwBtn = [[UIButton alloc]init];
    self.rememberPwBtn.layer.borderColor = [UIColor colorWithHexString:@"#a0a0a0"].CGColor;
    self.rememberPwBtn.layer.borderWidth = 1;
    self.rememberPwBtn.layer.masksToBounds = YES;
    [self.scrollView addSubview:self.rememberPwBtn];
    
    self.rememberPwLbl = [[UILabel alloc]init];
    self.rememberPwLbl.text = @"记住密码";
    self.rememberPwLbl.textColor = [UIColor colorWithHexString:@"#a0a0a0"];
    self.rememberPwLbl.font = [UIFont systemFontOfSize:9];
    [self.scrollView addSubview: self.rememberPwLbl];
    
    self.loginBtn = [[UIButton alloc]init];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginBtn setBackgroundColor:MAIN_COLOR];
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;
    [self.scrollView addSubview:self.loginBtn];
    
    self.forgetPwBtn = [[UIButton alloc]init];
    [self.forgetPwBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [self.forgetPwBtn setTitleColor:[UIColor colorWithHexString:@"8c8c8c"] forState:UIControlStateNormal];
    self.forgetPwBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.scrollView addSubview:self.forgetPwBtn];
    
    self.quickRegisterBtn = [[UIButton alloc]init];
    [self.quickRegisterBtn setTitle:@"快速注册" forState:UIControlStateNormal];
    [self.quickRegisterBtn setTitleColor:[UIColor colorWithHexString:@"8c8c8c"] forState:UIControlStateNormal];
    self.quickRegisterBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.scrollView addSubview:self.quickRegisterBtn];
    
    self.bottomImage = [[UIImageView alloc]init];
    self.bottomImage.image = [UIImage imageNamed:@"bottom"];
    [self.scrollView addSubview:self.bottomImage];
    
    self.closeBtn = [[UIButton alloc]init];
    [self.closeBtn setBackgroundImage:[UIImage imageNamed:@"chahao_"] forState:UIControlStateNormal];
    [self.scrollView addSubview:self.closeBtn];

    
}

@end
