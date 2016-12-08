//
//  SetPwView.m
//  NeiSha
//
//  Created by paperclouds on 16/8/12.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "SetPwView.h"

@implementation SetPwView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews{
    
//    self.navView = [[CreateNavgationView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 63) andBgd:@"#ffffff" andtitle:@"设置密码" andtitleColor:@"#505050"];
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
    
    self.passWdLbl = [[UILabel alloc]init];
    self.passWdLbl.font = [UIFont fontWithName:IconFont size:26];
    self.passWdLbl.text = @"\U0000e608";
    self.passWdLbl.textColor = [UIColor colorWithHexString:@"#b4b4b4"];
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
    
    self.pwPromoteLbl = [[UILabel alloc]init];
    self.pwPromoteLbl.text = @"密码长度为6-16位，支持数字，字母和字符";
    self.pwPromoteLbl.textColor = [UIColor colorWithHexString:@"#787878"];
    self.pwPromoteLbl.font = [UIFont systemFontOfSize:12];
    [self.scrollView addSubview:self.pwPromoteLbl];
    
    self.confirmPwLbl = [[UILabel alloc]init];
    self.confirmPwLbl.font = [UIFont fontWithName:IconFont size:26];
    self.confirmPwLbl.text = @"\U0000e608";
    self.confirmPwLbl.textColor = [UIColor colorWithHexString:@"#b4b4b4"];
    [self.confirmPwLbl sizeToFit];
    [self.scrollView addSubview:self.confirmPwLbl];
    
    self.confirmPwTF = [[UITextField alloc]init];
    self.confirmPwTF.leftView = self.confirmPwLbl;
    self.confirmPwTF.leftViewMode = UITextFieldViewModeAlways;
    self.confirmPwTF.rightView = self.cpwVisibleBtn;
    self.confirmPwTF.rightViewMode = UITextFieldViewModeAlways;
    self.confirmPwTF.placeholder = @"请确认您的密码";
    self.confirmPwTF.font = [UIFont systemFontOfSize:15];
    self.confirmPwTF.secureTextEntry = YES;
    self.confirmPwTF.textColor = [UIColor colorWithHexString:@"#646464"];
    [self.scrollView addSubview:self.confirmPwTF];
    
    self.thirdLine = [[UIView alloc]init];
    self.thirdLine.backgroundColor = [UIColor colorWithHexString:@"#b4b4b4"];
    [self.scrollView addSubview:self.thirdLine];
    
    self.cpwVisibleBtn = [[UIButton alloc]init];
    self.cpwVisibleBtn.titleLabel.font = [UIFont fontWithName:IconFont size:26];
    [self.cpwVisibleBtn setTitle:@"\U0000e607" forState:UIControlStateNormal];
    [self.cpwVisibleBtn setTitleColor:[UIColor colorWithHexString:@"#787878"] forState:UIControlStateNormal];
    [self.cpwVisibleBtn sizeToFit];
    [self.scrollView addSubview:self.cpwVisibleBtn];
    
    self.cpwPromoteLbl = [[UILabel alloc]init];
    self.cpwPromoteLbl.text = @"密码长度为6-16位，支持数字，字母和字符";
    self.cpwPromoteLbl.textColor = [UIColor colorWithHexString:@"#787878"];
    self.cpwPromoteLbl.font = [UIFont systemFontOfSize:12];
    [self.scrollView addSubview:self.cpwPromoteLbl];
    
    self.completeBtn = [[UIButton alloc]init];
    [self.completeBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self.completeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.completeBtn setBackgroundColor:MAIN_COLOR];
    self.completeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    self.completeBtn.layer.cornerRadius = 5;
    self.completeBtn.layer.masksToBounds = YES;
    [self.scrollView addSubview:self.completeBtn];
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

    [self.passWdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(270.5*WIDTH));
        make.height.equalTo(@(32));
        make.top.equalTo(self.phoneNumTF.mas_bottom).offset(35*HEIGHT);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.passWdLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35, 32));
        make.left.equalTo(self.passWdTF.mas_left);
        make.centerY.equalTo(self.passWdTF.mas_centerY);
    }];
    
    [self.secondLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.passWdTF);
        make.height.equalTo(@1);
        make.top.equalTo(self.passWdTF.mas_bottom).offset(-1);
        make.centerX.equalTo(self.passWdTF.mas_centerX);
    }];
    
    [self.pwVisibleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(32, 32));
        make.right.equalTo(self.passWdTF.mas_right).offset(5);
        make.centerY.equalTo(self.passWdTF.mas_centerY);
    }];

    [self.pwPromoteLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passWdTF.mas_bottom).offset(14.5*HEIGHT);
        make.left.equalTo(self.passWdTF.mas_left);
    }];
    
    [self.confirmPwTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(270.5*WIDTH));
        make.height.equalTo(@(32));
        make.top.equalTo(self.passWdTF.mas_bottom).offset(35*HEIGHT);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.confirmPwLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35, 32));
        make.left.equalTo(self.confirmPwTF.mas_left);
        make.centerY.equalTo(self.confirmPwTF.mas_centerY);
    }];
    
    [self.thirdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.confirmPwTF);
        make.height.equalTo(@1);
        make.top.equalTo(self.confirmPwTF.mas_bottom).offset(-1);
        make.centerX.equalTo(self.confirmPwTF.mas_centerX);
    }];
    
    [self.cpwVisibleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(32, 32));
        make.right.equalTo(self.confirmPwTF.mas_right).offset(5);
        make.centerY.equalTo(self.confirmPwTF.mas_centerY);
    }];
    
    [self.cpwPromoteLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.confirmPwTF.mas_bottom).offset(14.5*HEIGHT);
        make.left.equalTo(self.confirmPwTF.mas_left);
    }];
    
    [self.completeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cpwPromoteLbl.mas_bottom).offset(28.5*HEIGHT);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(self.passWdTF.mas_width);
        make.height.equalTo(@34);
    }];
}

@end
