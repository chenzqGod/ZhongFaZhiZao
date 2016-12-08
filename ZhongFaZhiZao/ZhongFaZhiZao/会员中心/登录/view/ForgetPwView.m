
//
//  ForgetPwView.m
//  NeiSha
//
//  Created by paperclouds on 16/8/12.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "ForgetPwView.h"

@implementation ForgetPwView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews{
//    self.navView = [[CreateNavgationView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 63) andBgd:@"#ffffff" andtitle:@"忘记密码" andtitleColor:@"#505050"];
//    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 63, screenWidth, 1)];
//    lineView.backgroundColor = [UIColor colorWithHexString:@"#f0f0f0"];
//    [self addSubview:lineView];
//    [self addSubview:self.navView];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-128)];
    [self addSubview:self.scrollView];
    
    self.websiteLogo = [[UILabel alloc]init];
    self.websiteLogo.text = @"NEISHA.CC";
    self.websiteLogo.textColor = MAIN_COLOR;
    self.websiteLogo.font = [UIFont boldSystemFontOfSize:24];
    [self.scrollView addSubview:self.websiteLogo];
    
    self.phoneNumLbl = [[UILabel alloc]init];
    self.phoneNumLbl.font = [UIFont fontWithName:IconFont size:26];
    self.phoneNumLbl.text = @"\U0000e605";
    self.phoneNumLbl.textColor = [UIColor colorWithHexString:@"#b4b4b4"];
    [self.phoneNumLbl sizeToFit];
    [self.scrollView addSubview:self.phoneNumLbl];
    
    self.phoneNumTF = [[UITextField alloc]init];
    self.phoneNumTF.leftView = self.phoneNumLbl;
    self.phoneNumTF.leftViewMode = UITextFieldViewModeAlways;
    self.phoneNumTF.placeholder = @"请输入手机号码";
    self.phoneNumTF.font = [UIFont systemFontOfSize:15];
    self.phoneNumTF.textColor = [UIColor colorWithHexString:@"#646464"];
    [self.scrollView addSubview:self.phoneNumTF];
    
    self.firstLine = [[UIView alloc]init];
    self.firstLine.backgroundColor = [UIColor colorWithHexString:@"#b4b4b4"];
    [self.scrollView addSubview:self.firstLine];
    
    self.vfCodeLbl = [[UILabel alloc]init];
    self.vfCodeLbl.font = [UIFont fontWithName:IconFont size:26];
    self.vfCodeLbl.text = @"\U0000e60b";
    self.vfCodeLbl.textColor = [UIColor colorWithHexString:@"#b4b4b4"];
    [self.vfCodeLbl sizeToFit];
    [self.scrollView addSubview:self.vfCodeLbl];
    
    self.getvfCodeBtn = [[UIButton alloc]init];
    [self.getvfCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.getvfCodeBtn setTitleColor:[UIColor colorWithHexString:@"#787878"] forState:UIControlStateNormal];
    self.getvfCodeBtn.layer.cornerRadius = 2;
    self.getvfCodeBtn.layer.borderColor = [UIColor colorWithHexString:@"#b4b4b4"].CGColor;
    self.getvfCodeBtn.layer.borderWidth = 1;
    self.getvfCodeBtn.layer.masksToBounds = YES;
    self.getvfCodeBtn.titleLabel.font  = [UIFont systemFontOfSize:12];
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
    self.secondLine.backgroundColor = [UIColor colorWithHexString:@"#b4b4b4"];
    [self.scrollView addSubview:self.secondLine];
    
    self.vfCodePromteLbl = [[UILabel alloc]init];
    self.vfCodePromteLbl.text = @"验证码";
    self.vfCodePromteLbl.textColor = [UIColor redColor];
    self.vfCodePromteLbl.font = [UIFont systemFontOfSize:12];
    
    [self.scrollView addSubview:self.vfCodePromteLbl];
    
    self.inputErrorLbl = [[UILabel alloc]init];
    self.inputErrorLbl.text = @"输入错误";
    self.inputErrorLbl.textColor = [UIColor colorWithHexString:@"#787878"];
    self.inputErrorLbl.font = [UIFont systemFontOfSize:12];
    [self.scrollView addSubview:self.inputErrorLbl];
    
    self.nextBtn = [[UIButton alloc]init];
    [self.nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.nextBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    self.nextBtn.backgroundColor = MAIN_COLOR;
    self.nextBtn.layer.cornerRadius = 5;
    self.nextBtn.layer.masksToBounds = YES;
    [self.scrollView addSubview:self.nextBtn];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.websiteLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(35*HEIGHT));
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.phoneNumTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(270.5*WIDTH));
        make.height.equalTo(@(32));
        make.top.equalTo(self.websiteLogo.mas_bottom).offset(48.5*HEIGHT);
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
    
    [self.vfCodePromteLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.vfCodeTF.mas_bottom).offset(14.5*HEIGHT);
        make.left.equalTo(self.vfCodeTF.mas_left);
    }];
    
    [self.inputErrorLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.vfCodePromteLbl.mas_top);
        make.left.equalTo(self.vfCodePromteLbl.mas_right);
    }];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.vfCodePromteLbl.mas_bottom).offset(28.5*HEIGHT);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(self.vfCodeTF.mas_width);
        make.height.equalTo(@34);
    }];
    
}
@end
