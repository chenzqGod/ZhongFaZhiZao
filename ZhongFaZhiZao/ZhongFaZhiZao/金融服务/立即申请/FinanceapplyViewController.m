//
//  FinanceapplyViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/1/17.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "FinanceapplyViewController.h"

@interface FinanceapplyViewController (){

    UIScrollView *_scrollView;
    UILabel *_specialLabel;
}

@end

@implementation FinanceapplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"提交申请"];
    navView.viewController = self;
    [self.view addSubview:navView];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64)];
    [self.view addSubview:_scrollView];
    
    [self createUI];
    
}

- (void)createUI{
 
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 72)];
    headView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:headView];
    
    _specialLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 8+CGRectGetMaxY(headView.frame), screenWidth, 100)];
    _specialLabel.backgroundColor = [UIColor colorWithHexString:@"#FFFDE3"];
    [_scrollView addSubview:_specialLabel];
    
    
    UIView *mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 8+CGRectGetMaxY(_specialLabel.frame), screenWidth, 465)];
    mainView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:mainView];
    
    UIButton *applyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    applyBtn.frame = CGRectMake((screenWidth-340*screenScale)/2.0, 18*screenScale+CGRectGetMaxY(mainView.frame), 340*screenScale, 35*screenScale);
    applyBtn.backgroundColor = BLUE_COLOR;
    [applyBtn setTitle:@"提交申请" forState:UIControlStateNormal];
    [applyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    applyBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_scrollView addSubview:applyBtn];
    
    UIButton *adminBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    adminBtn.frame = CGRectMake(124*screenScale, 17*screenScale, 18, 18);
    adminBtn.layer.masksToBounds = YES;
    adminBtn.layer.cornerRadius = 18/2.0;
    [_scrollView addSubview:adminBtn];
    
    UIButton *tiaokuanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tiaokuanBtn.frame = CGRectMake(8*screenScale+CGRectGetMaxX(adminBtn.frame), 19*screenScale+CGRectGetMaxY(applyBtn.frame), 120, 14);
    [tiaokuanBtn setTitle:@"同意中发智造服务条款" forState:UIControlStateNormal];
    [tiaokuanBtn setTitleColor:[UIColor colorWithHexString:@"#4A4A4A"] forState:UIControlStateNormal];
    tiaokuanBtn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    [_scrollView addSubview:tiaokuanBtn];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
