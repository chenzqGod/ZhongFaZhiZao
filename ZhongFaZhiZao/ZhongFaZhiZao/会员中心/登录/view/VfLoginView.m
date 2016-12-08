//
//  VfLoginView.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/7.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "VfLoginView.h"

@implementation VfLoginView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame: frame];
    
    if (self) {
        
        [self addSubviews];
    }
    
    return self;
    
}

- (void)addSubviews{

    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    [self addSubview:self.scrollView];
    
    self.logoView = [[UIImageView alloc]init];
    self.logoView.image = [UIImage imageNamed:@"neisha_"];
    [self.scrollView addSubview:self.logoView];
    
    self.phoneNumLbl = [[UIImageView alloc]init];
//    self.phoneNumLbl.font = [UIFont fontWithName:IconFont size:26];
//    self.phoneNumLbl.text = @"\U0000e605";
//    self.phoneNumLbl.textColor = [UIColor colorWithHexString:@"#b4b4b4"];
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
    
    self.vfCodeLbl = [[UIImageView alloc]init];
//    self.vfCodeLbl.font = [UIFont fontWithName:IconFont size:26];
//    self.vfCodeLbl.text = @"\U0000e60b";
//    self.vfCodeLbl.textColor = [UIColor colorWithHexString:@"#787878"];
    [self.vfCodeLbl sizeToFit];
    [self.scrollView addSubview:self.vfCodeLbl];
    
    self.getvfCodeBtn = [[UIButton alloc]init];
    [self.getvfCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.getvfCodeBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
    self.getvfCodeBtn.layer.cornerRadius = 2;
    self.getvfCodeBtn.layer.borderColor = [UIColor colorWithHexString:@"#a0a0a0"].CGColor;
    self.getvfCodeBtn.layer.borderWidth = 1;
    self.getvfCodeBtn.layer.masksToBounds = YES;
    self.getvfCodeBtn.titleLabel.font  = [UIFont systemFontOfSize:11];
    [self.scrollView addSubview:self.getvfCodeBtn];
    
    self.vfCodeTF = [[UITextField alloc]init];
    self.vfCodeTF.leftView = self.vfCodeLbl;
    self.vfCodeTF.leftViewMode = UITextFieldViewModeAlways;
    self.vfCodeTF.rightView = self.getvfCodeBtn;
    self.vfCodeTF.rightViewMode = UITextFieldViewModeAlways;
    self.vfCodeTF.placeholder = @"请输入验证码";
    self.vfCodeTF.font = [UIFont systemFontOfSize:15];
    self.vfCodeTF.textColor = [UIColor colorWithHexString:@"#646464"];
    [self.scrollView addSubview:self.vfCodeTF];
    
    self.secondLine = [[UIView alloc]init];
    self.secondLine.backgroundColor = [UIColor colorWithHexString:@"#787878"];
    [self.scrollView addSubview:self.secondLine];
    
    self.pwLoginBtn = [[UIButton alloc]init];
    [self.pwLoginBtn setTitle:@"密码登录" forState:UIControlStateNormal];
    [self.pwLoginBtn setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
    self.pwLoginBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    [self.scrollView addSubview:self.pwLoginBtn];
    
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

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 50));
        make.top.equalTo(@(70*HEIGHT));
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.phoneNumTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(270.5*WIDTH));
        make.height.equalTo(@(32));
        make.top.equalTo(self.logoView.mas_bottom).offset(42*HEIGHT);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.phoneNumLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35, 32));
        make.left.equalTo(self.phoneNumTF.mas_left);
        make.centerY.equalTo(self.phoneNumTF.mas_centerY);
    }];
    
    [self.firstLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.phoneNumTF);
        make.height.equalTo(@1);
        make.top.equalTo(self.phoneNumTF.mas_bottom).offset(-1);
        make.centerX.equalTo(self.phoneNumTF.mas_centerX);
    }];
    
    [self.vfCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(270.5*WIDTH));
        make.height.equalTo(@(32));
        make.top.equalTo(self.phoneNumTF.mas_bottom).offset(35*HEIGHT);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.vfCodeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35, 32));
        make.left.equalTo(self.vfCodeTF.mas_left);
        make.centerY.equalTo(self.vfCodeTF.mas_centerY);
    }];
    
    [self.getvfCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(65, 26));
        make.right.equalTo(self.vfCodeTF.mas_right);
        make.top.equalTo(self.vfCodeTF.mas_top);
    }];
    
    [self.secondLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.vfCodeTF);
        make.height.equalTo(@1);
        make.top.equalTo(self.vfCodeTF.mas_bottom).offset(-1);
        make.centerX.equalTo(self.vfCodeTF.mas_centerX);
    }];
    
    
    [self.pwLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.vfCodeTF.mas_bottom).offset(19*HEIGHT);
        make.left.equalTo(self.vfCodeTF.mas_left);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwLoginBtn.mas_bottom).offset(43.5*HEIGHT);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(@34);
        make.width.equalTo(self.vfCodeTF.mas_width);
    }];
    
    [self.forgetPwBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).offset(10*HEIGHT);
        make.left.equalTo(self.loginBtn.mas_left);
    }];
    
    [self.quickRegisterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).offset(10*HEIGHT);
        make.right.equalTo(self.loginBtn.mas_right);
    }];
    
    [self.bottomImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(screenWidth, screenWidth*160/375));
        make.bottom.equalTo(@(screenHeight));
    }];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(12, 12));
        make.top.equalTo(self.scrollView.mas_top).offset(10);
        make.right.equalTo(@(screenWidth-10));
    }];
}


@end
