//
//  DelegateView.m
//  NeiSha
//
//  Created by paperclouds on 16/8/12.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "DelegateView.h"

@implementation DelegateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews{
    
//    self.navView = [[CreateNavgationView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 63) andBgd:@"#ffffff" andtitle:@"用户协议" andtitleColor:@"#505050"];
//    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 63, screenWidth, 1)];
//    lineView.backgroundColor = [UIColor colorWithHexString:@"#f0f0f0"];
//    [self addSubview:lineView];
//    [self addSubview:self.navView];
    
    self.webview = [[UIWebView alloc]init];
    [self addSubview:self.webview];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.webview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@64);
        make.left.equalTo(@0);
        make.width.equalTo(@(screenWidth));
        make.height.equalTo(@(screenHeight-64));
    }];
}

@end
