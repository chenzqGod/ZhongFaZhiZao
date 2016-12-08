//
//  ForgetPwView.h
//  NeiSha
//
//  Created by paperclouds on 16/8/12.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetPwView : UIView

//@property (nonatomic,strong) CreateNavgationView *navView;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UILabel *websiteLogo; // 网站logo
@property (nonatomic,strong) UILabel *phoneNumLbl; // 手机号
@property (nonatomic,strong) UITextField *phoneNumTF;
@property (nonatomic,strong) UIView *firstLine;
@property (nonatomic,strong) UILabel *vfCodeLbl; // 验证码
@property (nonatomic,strong) UITextField *vfCodeTF;
@property (nonatomic,strong) UIView *secondLine;
@property (nonatomic,strong) UIButton *getvfCodeBtn; // 获取验证码按钮
@property (nonatomic,strong) UILabel *vfCodePromteLbl; // 验证码提示文字
@property (nonatomic,strong) UILabel *inputErrorLbl; // 输入错误提示文字
@property (nonatomic,strong) UIButton *nextBtn; // 用户协议按钮
@end
