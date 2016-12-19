//
//  NavigationControllerView.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/17.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "NavigationControllerView.h"

@implementation NavigationControllerView

- (instancetype)initWithFrame:(CGRect)frame andLeftBtn:(NSString *)title{

    if (self = [super initWithFrame:frame]) {
        
        UIView *navView = [[UIView alloc]initWithFrame:frame];
        navView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"NavBack"]];
        [self addSubview:navView];
        
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.frame = CGRectMake(0, 64-65/2.0-10, 94/2.0, 65/2.0);
        leftBtn.imageView.frame = leftBtn.bounds;
        leftBtn.hidden = NO;
//        leftBtn.center = CGPointMake(94/2.0/2.0, 44);
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"NavBk"] forState:UIControlStateNormal];
        [leftBtn addTarget:self action:@selector(leftBarButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:leftBtn];
        
        UILabel *midLabel = [[UILabel alloc]init];
        midLabel.frame = CGRectMake(0, 0, 180, 24);
        midLabel.center = CGPointMake(screenWidth/2.0, 42);
        midLabel.text = title;
        midLabel.textColor = [UIColor whiteColor];
        midLabel.textAlignment = NSTextAlignmentCenter;
        midLabel.font = [UIFont systemFontOfSize:18.0];
        [self addSubview:midLabel];

    }

    return self;
}


- (instancetype)initWithFrame:(CGRect)frame andRightBtn:(NSString *)title{

    if (self = [super initWithFrame:frame]) {
        
        UIView *navView = [[UIView alloc]initWithFrame:frame];
        navView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"NavBack"]];
        [self addSubview:navView];
        
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame = CGRectMake(screenWidth-21-20, 44-21/2.0, 21, 21);
        rightBtn.imageView.frame = rightBtn.bounds;
        rightBtn.hidden = NO;
        [rightBtn setBackgroundImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateNormal];
        [rightBtn addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rightBtn];
        
        UILabel *midLabel = [[UILabel alloc]init];
        midLabel.frame = CGRectMake(0, 0, 180, 24);
        midLabel.center = CGPointMake(screenWidth/2.0, 42);
        midLabel.text = title;
        midLabel.textColor = [UIColor whiteColor];
        midLabel.textAlignment = NSTextAlignmentCenter;
        midLabel.font = [UIFont systemFontOfSize:18.0];
        [self addSubview:midLabel];
        

    }
    
    return self;
}

#pragma mark - 点击事件
- (void)leftBarButtonItemClick{
    
    
    if (self.viewController) {
        
        [self.viewController.navigationController popViewControllerAnimated:YES];
    }
    
}


- (void)rightButtonClick{

    if (self.viewController) {
        
        [self.viewController.navigationController popToRootViewControllerAnimated:YES];
    }
    
}

@end
