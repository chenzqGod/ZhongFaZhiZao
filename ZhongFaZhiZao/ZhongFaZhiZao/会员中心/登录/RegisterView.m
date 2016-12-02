//
//  RegisterView.m
//  NeiSha
//
//  Created by paperclouds on 16/8/10.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews{
    self.navView = [[CreateNavgationView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 63) andBgd:@"#ffffff" andtitle:@"注册内啥" andtitleColor:@"#505050"];
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 63, screenWidth, 1)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"#f0f0f0"];
    [self addSubview:lineView];
    [self addSubview:self.navView];
    
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
    
    self.delegateLbl = [[UILabel alloc]init];
    self.delegateLbl.text = @"注册代表同意";
    self.delegateLbl.textColor = [UIColor colorWithHexString:@"#787878"];
    self.delegateLbl.font = [UIFont systemFontOfSize:12];
    [self.scrollView addSubview:self.delegateLbl];
    
    self.delegateBtn = [[UIButton alloc]init];
    [self.delegateBtn setTitleColor:[UIColor colorWithHexString:@"#646464"] forState:UIControlStateNormal];
    [self.delegateBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    self.delegateBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.scrollView addSubview:self.delegateBtn];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"用户协议"];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [self.delegateBtn setAttributedTitle:str forState:UIControlStateNormal];

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

    self.thirdLine = [[UIView alloc]init];
    self.thirdLine.backgroundColor = [UIColor colorWithHexString:@"#b4b4b4"];
    [self.scrollView addSubview:self.thirdLine];

    
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
    
    self.registerBtn = [[UIButton alloc]init];
    [self.registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.registerBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    self.registerBtn.backgroundColor = MAIN_COLOR;
    self.registerBtn.layer.cornerRadius = 5;
    self.registerBtn.layer.masksToBounds = YES;
    [self.scrollView addSubview:self.registerBtn];
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
    
    [self.delegateLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.secondLine.mas_bottom).offset(14.5*HEIGHT);
        make.left.equalTo(self.secondLine.mas_left);
    }];
    
    [self.delegateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.delegateLbl);
        make.left.equalTo(self.delegateLbl.mas_right).offset(2);
    }];
    
    [self.passWdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(270.5*WIDTH));
        make.height.equalTo(@(32));
        make.top.equalTo(self.delegateLbl.mas_bottom).offset(20.5*HEIGHT);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.passWdLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35, 32));
        make.left.equalTo(self.passWdTF.mas_left);
        make.centerY.equalTo(self.passWdTF.mas_centerY);
    }];

    [self.thirdLine mas_makeConstraints:^(MASConstraintMaker *make) {
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
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwPromoteLbl.mas_bottom).offset(28.5*HEIGHT);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(self.vfCodeTF.mas_width);
        make.height.equalTo(@34);
    }];
    
}
@end
