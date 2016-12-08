//
//  SetPwView.h
//  NeiSha
//
//  Created by paperclouds on 16/8/12.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetPwView : UIView

//@property (nonatomic,strong) CreateNavgationView *navView;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UILabel *websiteLogo; // 网站logo
@property (nonatomic,strong) UILabel *phoneNumLbl; // 手机号
@property (nonatomic,strong) UITextField *phoneNumTF;
@property (nonatomic,strong) UIView *firstLine;
@property (nonatomic,strong) UILabel *passWdLbl; // 密码
@property (nonatomic,strong) UITextField *passWdTF;
@property (nonatomic,strong) UIView *secondLine;
@property (nonatomic,strong) UIButton *pwVisibleBtn; // 密码可见按钮
@property (nonatomic,strong) UILabel *pwPromoteLbl; // 密码提示
@property (nonatomic,strong) UILabel *confirmPwLbl; // 确认密码
@property (nonatomic,strong) UITextField *confirmPwTF; // 确认密码
@property (nonatomic,strong) UIView *thirdLine;
@property (nonatomic,strong) UIButton *cpwVisibleBtn; // 确认密码可见按钮
@property (nonatomic,strong) UILabel *cpwPromoteLbl; // 确认密码提示
@property (nonatomic,strong) UIButton *completeBtn; // 完成按钮
@end
