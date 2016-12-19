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
    
    self.scrollView.backgroundColor = BACK_COLOR;
    [self addSubview:self.scrollView];
    
    self.logoView = [[UIImageView alloc]init];
    self.logoView.image = [UIImage imageNamed:@"默认头像"];
    [self.scrollView addSubview:self.logoView];
    
    self.userView = [[UIView alloc]init];
    self.userView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.userView];
    
    self.phoneNumLbl = [[UIImageView alloc]init];
    self.phoneNumLbl.image = [UIImage imageNamed:@"账号登录"];
//    [self.phoneNumLbl sizeToFit];
//    self.phoneNumLbl.contentMode = UIViewContentModeLeft;
    [self.userView addSubview:self.phoneNumLbl];
    
    self.phoneNumTF = [[UITextField alloc]init];
    self.phoneNumTF.leftView = self.phoneNumLbl;
    [self.phoneNumTF setValue:[NSNumber numberWithInteger:20] forKey:@"paddingTop"];
    self.phoneNumTF.leftViewMode = UITextFieldViewModeAlways;
    self.phoneNumTF.placeholder = @"用户名/手机号/邮箱";
    self.phoneNumTF.font = [UIFont boldSystemFontOfSize:15];
    self.phoneNumTF.textColor = TEXT_GREY_COLOR;
    self.phoneNumTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.userView addSubview:self.phoneNumTF];
    
    self.firstLine = [[UIView alloc]init];
    self.firstLine.backgroundColor = [UIColor colorWithHexString:@"#ebebeb"];
    [self.scrollView addSubview:self.firstLine];
    
    self.pwdView = [[UIView alloc]init];
    self.pwdView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.pwdView];
    
    self.passWdLbl = [[UIImageView alloc]init];
//    self.passWdLbl.font = [UIFont fontWithName:IconFont size:26];
    self.passWdLbl.image = [UIImage imageNamed:@"密码登录"];
//    [self.passWdLbl sizeToFit];
//    self.passWdLbl.contentMode = UIViewContentModeLeft;
    
    [self.pwdView addSubview:self.passWdLbl];
    
    self.passWdTF = [[UITextField alloc]init];
    self.passWdTF.leftView = self.passWdLbl;
    self.passWdTF.leftViewMode = UITextFieldViewModeAlways;
    self.passWdTF.rightView = self.pwVisibleBtn;
    self.passWdTF.rightViewMode = UITextFieldViewModeAlways;
    self.passWdTF.placeholder = @"请输入密码";
    self.passWdTF.font = [UIFont systemFontOfSize:15];
    self.passWdTF.secureTextEntry = YES;
    self.passWdTF.textColor = TEXT_GREY_COLOR;
    self.passWdTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.pwdView addSubview:self.passWdTF];
    
//    self.secondLine = [[UIView alloc]init];
//    self.secondLine.backgroundColor = [UIColor colorWithHexString:@"#b4b4b4"];
//    [self.scrollView addSubview:self.secondLine];
    
    
    self.pwVisibleBtn = [[UIButton alloc]init];
    self.pwVisibleBtn.titleLabel.font = [UIFont fontWithName:IconFont size:26];
//    [self.pwVisibleBtn setTitle:@"\U0000e607" forState:UIControlStateNormal];
    [self.pwVisibleBtn setImage:[UIImage imageNamed:@"eye"] forState:UIControlStateNormal];
    [self.pwVisibleBtn sizeToFit];
    [self.pwdView addSubview:self.pwVisibleBtn];
    
    self.vfLoginBtn = [[UIButton alloc]init];
    [self.vfLoginBtn setTitle:@"使用验证码登录 >" forState:UIControlStateNormal];
    [self.vfLoginBtn setTitleColor:TEXT_GREY_COLOR forState:UIControlStateNormal];
    self.vfLoginBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
//    self.vfLoginBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    self.vfLoginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//    [self.vfLoginBtn sizeToFit];
    [self.scrollView addSubview:self.vfLoginBtn];
    
//    self.rememberPwBtn = [[UIButton alloc]init];
//    self.rememberPwBtn.layer.borderColor = [UIColor colorWithHexString:@"#a0a0a0"].CGColor;
//    self.rememberPwBtn.layer.borderWidth = 1;
//    self.rememberPwBtn.layer.masksToBounds = YES;
//    [self.scrollView addSubview:self.rememberPwBtn];
//    
//    self.rememberPwLbl = [[UILabel alloc]init];
//    self.rememberPwLbl.text = @"记住密码";
//    self.rememberPwLbl.textColor = [UIColor colorWithHexString:@"#a0a0a0"];
//    self.rememberPwLbl.font = [UIFont systemFontOfSize:9];
//    [self.scrollView addSubview: self.rememberPwLbl];
    
    self.loginBtn = [[UIButton alloc]init];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginBtn setBackgroundColor:[UIColor colorWithHexString:@"#9b9b9b"]];
    self.loginBtn.alpha = 0.5;
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    self.loginBtn.layer.cornerRadius = 3;
    self.loginBtn.layer.masksToBounds = YES;
    [self.scrollView addSubview:self.loginBtn];
    
    self.forgetPwBtn = [[UIButton alloc]init];
    [self.forgetPwBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [self.forgetPwBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.forgetPwBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.scrollView addSubview:self.forgetPwBtn];
    
    self.quickRegisterBtn = [[UIButton alloc]init];
    [self.quickRegisterBtn setTitle:@"注册新账号" forState:UIControlStateNormal];
    [self.quickRegisterBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.quickRegisterBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.scrollView addSubview:self.quickRegisterBtn];
    
//    self.bottomImage = [[UIImageView alloc]init];
//    self.bottomImage.image = [UIImage imageNamed:@"bottom"];
//    [self.scrollView addSubview:self.bottomImage];
    
    self.closeBtn = [[UIButton alloc]init];
    [self.closeBtn setBackgroundImage:[UIImage imageNamed:@"chahao_"] forState:UIControlStateNormal];
    [self.scrollView addSubview:self.closeBtn];

    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(108*WIDTH, 108*WIDTH));
        make.top.equalTo(@(53*HEIGHT));
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.vfLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.centerY.equalTo(self.rememberPwBtn.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-18);
        make.top.mas_equalTo(self.logoView.mas_bottom).offset(24*HEIGHT);
        make.height.mas_equalTo(@17);
        make.width.mas_equalTo(@120);
    }];
    
    
    [self.userView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(screenWidth, 41));
        make.top.mas_equalTo(self.vfLoginBtn.mas_bottom).offset(HEIGHT*10);
        make.left.mas_equalTo(@0);
    }];
    
    [self.phoneNumTF mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@(316*WIDTH));
        make.height.equalTo(@(20));
        make.left.mas_equalTo(self.userView.mas_left).offset(26);
        make.right.mas_equalTo(self.userView.mas_right).offset(-18);
        make.centerY.equalTo(self.userView.mas_centerY);
    }];
    
    [self.phoneNumLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(14, 17));
        make.left.equalTo(self.phoneNumTF.mas_left);
        make.centerY.equalTo(self.userView.mas_centerY);
    }];
    
    [self.firstLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(screenWidth));
        make.height.equalTo(@1);
        make.top.equalTo(self.userView.mas_bottom);
        make.centerX.equalTo(self.userView.mas_centerX);
    }];
    
    [self.pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(self.userView);
        make.top.mas_equalTo(self.userView.mas_bottom).offset(1);
        make.left.mas_equalTo(self.userView.mas_left);
    }];
    
    [self.passWdTF mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@(270.5*WIDTH));
        make.height.equalTo(@(20));
        make.left.mas_equalTo(self.phoneNumTF.mas_left);
        make.right.mas_equalTo(self.phoneNumTF.mas_right).offset(-38);
        make.centerY.equalTo(self.pwdView.mas_centerY);
    }];
    
    [self.passWdLbl mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(14, 17));
        make.size.mas_equalTo(self.phoneNumLbl);
        make.left.equalTo(self.passWdTF.mas_left);
        make.centerY.equalTo(self.pwdView.mas_centerY);
    }];
    
//    [self.secondLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(self.passWdTF);
//        make.height.equalTo(@1);
//        make.top.equalTo(self.passWdTF.mas_bottom).offset(-1);
//        make.centerX.equalTo(self.passWdTF.mas_centerX);
//    }];
    
    [self.pwVisibleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(17, 10));
        make.right.equalTo(self.pwdView.mas_right).offset(-20);
        make.centerY.equalTo(self.passWdTF.mas_centerY);
    }];
    
//    [self.rememberPwLbl mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.passWdTF.mas_bottom).offset(19*HEIGHT);
//        make.right.equalTo(self.passWdTF.mas_right);
//    }];
//    
//    [self.rememberPwBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(10.5, 10.5));
//        make.top.equalTo(self.rememberPwLbl);
//        make.right.equalTo(self.rememberPwLbl.mas_left).offset(-2);
//        
//    }];
    

    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdView.mas_bottom).offset(34*HEIGHT);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(@35);
        make.width.equalTo(@(screenWidth-36));
    }];
    
//    [self.forgetPwBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.loginBtn.mas_bottom).offset(10*HEIGHT);
//        make.left.equalTo(self.loginBtn.mas_left);
//    }];
    
    [self.quickRegisterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).offset(10*HEIGHT);
        make.right.equalTo(self.loginBtn.mas_right);
    }];
    
//    [self.bottomImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(screenWidth, screenWidth*160/375));
//        make.bottom.equalTo(@(screenHeight));
//    }];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(12, 12));
        make.top.equalTo(self.scrollView.mas_top).offset(10*HEIGHT);
        make.right.equalTo(@(screenWidth-10));
    }];
}

@end
