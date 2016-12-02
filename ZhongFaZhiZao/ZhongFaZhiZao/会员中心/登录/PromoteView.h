//
//  PromoteView.h
//  NeiSha
//
//  Created by paperclouds on 16/8/10.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromoteView : UIView

@property (nonatomic,strong) UIImageView *logoImage; // logo
@property (nonatomic,strong) UIImageView *adImageView; // 广告图
@property (nonatomic,strong) UIButton *registerBtn; // 注册按钮
@property (nonatomic,strong) UILabel *promoteLbl; // 提示文字
@property (nonatomic,strong) UIButton *loginBtn; // 登陆按钮
@property (nonatomic,strong) UIButton *closeBtn; // 关闭按钮
@end
