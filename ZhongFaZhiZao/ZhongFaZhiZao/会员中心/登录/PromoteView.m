//
//  PromoteView.m
//  NeiSha
//
//  Created by paperclouds on 16/8/10.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "PromoteView.h"

@implementation PromoteView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews{
    self.logoImage = [[UIImageView alloc]init];
    self.logoImage.image = [UIImage imageNamed:@"neisha_"];
    [self addSubview:self.logoImage];
    
    self.adImageView = [[UIImageView alloc]init];
    self.adImageView.image = [UIImage imageNamed:@"img_01_"];
    [self addSubview:self.adImageView];
    
    self.registerBtn = [[UIButton alloc]init];
    [self.registerBtn setTitle:@"手机号注册" forState:UIControlStateNormal];
    [self.registerBtn setTitleColor:TEXT_COLOR forState:UIControlStateNormal];
    self.registerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    self.registerBtn.layer.cornerRadius = 5;
    self.registerBtn.layer.borderWidth = 2;
    self.registerBtn.layer.borderColor = [UIColor colorWithHexString:@"#23aBec"].CGColor;
    self.registerBtn.layer.masksToBounds = YES;
    [self addSubview:self.registerBtn];
    
    self.promoteLbl = [[UILabel alloc]init];
    self.promoteLbl.text = @"已有内啥账号？请";
    self.promoteLbl.textColor = TEXT_COLOR;
    self.promoteLbl.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.promoteLbl];
    
    self.loginBtn = [[UIButton alloc]init];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:TEXT_COLOR forState:UIControlStateNormal];
     [self.loginBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.loginBtn];
    
    self.closeBtn = [[UIButton alloc]init];
    [self.closeBtn setBackgroundImage:[UIImage imageNamed:@"chahao_"] forState:UIControlStateNormal];
    [self addSubview:self.closeBtn];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(126.5*HEIGHT, 79*HEIGHT));
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(@(116*HEIGHT));
    }];
    
    [self.adImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(355*HEIGHT, 150*HEIGHT));
        make.top.equalTo(self.logoImage.mas_bottom).offset(78*HEIGHT);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(295.5*HEIGHT, 46.5*HEIGHT));
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.adImageView.mas_bottom).offset(83*HEIGHT);
    }];
    
    [self.promoteLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.registerBtn.mas_bottom).equalTo(@20.5);
        make.centerX.equalTo(self.mas_centerX).offset(-24);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.promoteLbl.mas_centerY);
        make.left.equalTo(self.promoteLbl.mas_right);
    }];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(12, 12));
        make.top.equalTo(@30);
        make.right.equalTo(@-10);
    }];
}

@end
