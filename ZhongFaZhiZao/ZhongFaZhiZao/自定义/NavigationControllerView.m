//
//  NavigationControllerView.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/17.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "NavigationControllerView.h"
#import "MineViewController.h"

@implementation NavigationControllerView
{
    UILabel *_midLabel;
}
- (instancetype)initWithFrame:(CGRect)frame andLeftBtn:(NSString *)title{

    if (self = [super initWithFrame:frame]) {
        
        UIView *navView = [[UIView alloc]initWithFrame:frame];
        navView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"NavBG"]];
        [self addSubview:navView];
        
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.frame = CGRectMake(0, 64-65/2.0-6, 94/2.0, 65/2.0);
        leftBtn.imageView.frame = leftBtn.bounds;
        leftBtn.hidden = NO;
//        leftBtn.center = CGPointMake(94/2.0/2.0, 44);
//        leftBtn.backgroundColor = [UIColor redColor];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"BackNV"] forState:UIControlStateNormal];
        [leftBtn addTarget:self action:@selector(leftBarButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:leftBtn];
        
        _midLabel = [[UILabel alloc]init];
        _midLabel.frame = CGRectMake(0, 0, 180, 24);
        _midLabel.center = CGPointMake(screenWidth/2.0, 42);
        _midLabel.text = title;
        _midLabel.textColor = [UIColor whiteColor];
        _midLabel.textAlignment = NSTextAlignmentCenter;
        _midLabel.font = [UIFont systemFontOfSize:18.0];
        [self addSubview:_midLabel];

    }

    return self;
}


- (instancetype)initWithFrame:(CGRect)frame andtitle:(NSString *)title{
    
    if (self = [super initWithFrame:frame]) {
        
        UIView *navView = [[UIView alloc]initWithFrame:frame];
        navView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"NavBG"]];
        [self addSubview:navView];
        
        _midLabel = [[UILabel alloc]init];
        _midLabel.frame = CGRectMake(0, 0, 180, 24);
        _midLabel.center = CGPointMake(screenWidth/2.0, 42);
        _midLabel.text = title;
        _midLabel.textColor = [UIColor whiteColor];
        _midLabel.textAlignment = NSTextAlignmentCenter;
        _midLabel.font = [UIFont systemFontOfSize:18.0];
        [self addSubview:_midLabel];
        
    }
    
    return self;
}

- (void)setTitle:(NSString *)title {
    _midLabel.text = title;
}

- (instancetype)initWithFrame:(CGRect)frame andRightBtn:(NSString *)title{

    if (self = [super initWithFrame:frame]) {
        
        UIView *navView = [[UIView alloc]initWithFrame:frame];
        navView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"NavBG"]];
        [self addSubview:navView];
        
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame = CGRectMake(screenWidth-21-20, 44-21/2.0, 21, 21);
        rightBtn.imageView.frame = rightBtn.bounds;
        rightBtn.hidden = NO;
        [rightBtn setBackgroundImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateNormal];
        [rightBtn addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rightBtn];
        
        _midLabel.frame = CGRectMake(0, 0, 180, 24);
        _midLabel.center = CGPointMake(screenWidth/2.0, 42);
        _midLabel.text = title;
        _midLabel.textColor = [UIColor whiteColor];
        _midLabel.textAlignment = NSTextAlignmentCenter;
        _midLabel.font = [UIFont systemFontOfSize:18.0];
        [self addSubview:_midLabel];
        

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
        
//        [self.viewController.navigationController popToRootViewControllerAnimated:YES];
        
        
//        [self.viewController.navigationController popToViewController:vc animated:YES];
        
        [self.viewController.navigationController popToRootViewControllerAnimated:YES];
    }
    
}

@end
