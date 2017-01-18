//
//  FinanceDetailTwoViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/1/17.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "FinanceDetailTwoViewController.h"
#import "FinanceapplyViewController.h"
#import "CaculateLabelHeight.h"
#import "UIImageView+WebCache.h"

@interface FinanceDetailTwoViewController (){

    UIScrollView *_scrollView;
    UIImageView *_iconView;
    UILabel *_nameLabel;
    UIView *_produceView;
    UILabel *_produceLabel;
    UIView *_goodView;
    UILabel *_goodLabel;
    UIView *_sqtjView;
    UILabel *_sqtjLabel;
    UIView *_otherView;
    UILabel *_otherLabel;
    NSMutableDictionary *_dic;
    UIView *_downView;
}

@end

@implementation FinanceDetailTwoViewController

- (NSMutableDictionary *)dic{
    
    if (!_dic) {
        
        _dic = [NSMutableDictionary dictionary];
    }
    
    return _dic;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    [self.tabBarController.tabBar setHidden:YES];
    self.tabBarController.tabBar.frame = CGRectZero;
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:YES];
    self.tabBarController.tabBar.frame = CGRectMake(0, screenHeight-49, screenWidth, 49);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NavigationControllerView *nav = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"产品详情"];
    nav.viewController = self;
    [self.view addSubview:nav];
    self.view.backgroundColor = BACK_COLOR;
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+11, screenWidth, screenHeight-64-11)];
    [self.view addSubview:_scrollView];
    
    [self createUI];
    [self loadData];
}

- (void)loadData{
    
    [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@/%@",HOST_URL,FINANCE_DETAIL,self.fid] parameters:nil success:^(id response) {
        
        if ([response[@"resultCode"]integerValue] == 1000) {
            
    
             _dic = [response[@"data"]mutableCopy];
            
            [_iconView sd_setImageWithURL:[NSURL URLWithString:_dic[@"cpLogo"]] placeholderImage:[UIImage imageNamed:@"占位图200-188"]];
             _nameLabel.text = [NSString stringWithFormat:@"%@—%@",_dic[@"corpName"],_dic[@"name"]];
            
            _produceLabel.text = [NSString stringWithFormat:@"%@",_dic[@"cpjs"]];
            CGFloat LblW = screenWidth-20*screenScale-Margin;
            CGFloat cpjsH = [CaculateLabelHeight getSpaceLabelHeight:_produceLabel.text withWidth:LblW andFont:12.0 andLines:4.0];
            _produceLabel.frame = CGRectMake(20*screenScale, 39, LblW, cpjsH);
            _produceView.frame = CGRectMake(0, 8+34+32*screenScale, screenWidth, 52+cpjsH);
            
            _goodLabel.text = [NSString stringWithFormat:@"%@",_dic[@"cptd"]];
            CGFloat goodLblH = [CaculateLabelHeight getSpaceLabelHeight:_goodLabel.text withWidth:LblW andFont:12.0 andLines:4.0];
            _goodLabel.frame = CGRectMake(20*screenScale, 39, LblW, goodLblH);
            _goodView.frame = CGRectMake(0,1+CGRectGetMaxY(_produceView.frame), screenWidth, 52+goodLblH);

            
            _sqtjLabel.text = [NSString stringWithFormat:@"%@",_dic[@"sqtj"]];
            CGFloat sqtjLblH = [CaculateLabelHeight getSpaceLabelHeight:_sqtjLabel.text withWidth:LblW andFont:12.0 andLines:4.0];
            _sqtjLabel.frame = CGRectMake(20*screenScale, 39, LblW, sqtjLblH);
            _sqtjView.frame = CGRectMake(0,1+CGRectGetMaxY(_goodView.frame), screenWidth, 52+sqtjLblH);
            
            
            if (_dic[@"qtsm"]) {
                _otherLabel.text = [NSString stringWithFormat:@"%@",_dic[@"qtsm"]];
                CGFloat otherLblH = [CaculateLabelHeight getSpaceLabelHeight:_otherLabel.text withWidth:LblW andFont:12.0 andLines:4.0];
                _otherLabel.frame = CGRectMake(20*screenScale, 39, LblW, otherLblH);
                _otherView.frame = CGRectMake(0,1+CGRectGetMaxY(_sqtjView.frame), screenWidth, 52+otherLblH);
                
            }
            else{
            
                _otherView.frame = CGRectZero;
            }
            
            _downView.frame = CGRectMake(0, 1+CGRectGetMaxY(_otherView.frame), screenWidth, 47*screenScale+56);
     
        }
        
    } failure:^(NSString *error) {
        
        
        
    }];

}

- (void)createUI{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 34+32*screenScale)];
    headView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:headView];
    
    _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(25*screenScale, 17, 80*screenScale, 32*screenScale)];
//    _iconView.backgroundColor = [UIColor cyanColor];
    [headView addSubview:_iconView];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(26*screenScale+CGRectGetMaxX(_iconView.frame), 13, screenWidth-(26*screenScale+CGRectGetMaxX(_iconView.frame))-Margin, 20)];
    _nameLabel.font = [UIFont systemFontOfSize:15.0];
//    _nameLabel.backgroundColor = [UIColor cyanColor];
    [headView addSubview:_nameLabel];
    

//    产品介绍
    _produceView = [[UIView alloc]init];
    _produceView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_produceView];
    
    UILabel *cpjsLbl = [[UILabel alloc]initWithFrame:CGRectMake(20*screenScale, 13, 150, 20)];
    cpjsLbl.text = @"产品介绍";
    cpjsLbl.font = [UIFont systemFontOfSize:15.0];
    [_produceView addSubview:cpjsLbl];
    
    _produceLabel = [[UILabel alloc]init];
    _produceLabel.numberOfLines = 0;
    _produceLabel.font = [UIFont systemFontOfSize:12.0];
    _produceLabel.textColor = TEXT_SUMMARY_COLOR;
    
    [_produceView addSubview:_produceLabel];
    
    
//    产品特点
    _goodView = [[UIView alloc]init];
    _goodView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_goodView];
    
    UILabel *cptdLbl = [[UILabel alloc]initWithFrame:CGRectMake(20*screenScale, 13, 150, 20)];
    cptdLbl.text = @"产品特点";
    cptdLbl.font = [UIFont systemFontOfSize:15.0];
    [_goodView addSubview:cptdLbl];
    
    _goodLabel = [[UILabel alloc]init];
    _goodLabel.numberOfLines = 0;
    _goodLabel.font = [UIFont systemFontOfSize:12.0];
    _goodLabel.textColor = TEXT_SUMMARY_COLOR;
    [_goodView addSubview:_goodLabel];

    
//    申请条件
    _sqtjView = [[UIView alloc]init];
    _sqtjView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_sqtjView];
    
    UILabel *sqtjLbl = [[UILabel alloc]initWithFrame:CGRectMake(20*screenScale, 13, 150, 20)];
    sqtjLbl.text = @"申请条件";
    sqtjLbl.font = [UIFont systemFontOfSize:15.0];
    [_sqtjView addSubview:sqtjLbl];
    
    _sqtjLabel = [[UILabel alloc]init];
    _sqtjLabel.numberOfLines = 0;
    _sqtjLabel.font = [UIFont systemFontOfSize:12.0];
    _sqtjLabel.textColor = TEXT_SUMMARY_COLOR;
    [_sqtjView addSubview:_sqtjLabel];

    
//    其他说明
    _otherView = [[UIView alloc]init];
    _otherView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_otherView];
    
    UILabel *otherLbl = [[UILabel alloc]initWithFrame:CGRectMake(20*screenScale, 13, 150, 20)];
    otherLbl.text = @"其他说明";
    otherLbl.font = [UIFont systemFontOfSize:15.0];
    [_otherView addSubview:otherLbl];
    
    _otherLabel = [[UILabel alloc]init];
    _otherLabel.numberOfLines = 0;
    _otherLabel.font = [UIFont systemFontOfSize:12.0];
    _otherLabel.textColor = TEXT_SUMMARY_COLOR;
    [_otherView addSubview:_otherLabel];

    
//    申请流程
    _downView = [[UIView alloc]init];
    _downView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_downView];
    
    UILabel *liuchengLabel = [[UILabel alloc]initWithFrame:CGRectMake(20*screenScale, 13, 150, 20)];
    liuchengLabel.text = @"申请流程";
    liuchengLabel.font = [UIFont systemFontOfSize:15.0];
    [_downView addSubview:liuchengLabel];
    
    UIImageView *liuchengImg = [[UIImageView alloc]initWithFrame:CGRectMake((screenWidth-327*screenScale)/2.0, CGRectGetMaxY(liuchengLabel.frame)+10, 327*screenScale, 47*screenScale)];
    liuchengImg.image = [UIImage imageNamed:@"申请流程"];
    [_downView addSubview:liuchengImg];

    
//  申请
    UIButton *applyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    applyBtn.frame = CGRectMake(0, screenHeight-53, screenWidth, 53);
    applyBtn.backgroundColor = [UIColor colorWithHexString:@"#F6A623"];
    [applyBtn setTitle:@"立即申请" forState:UIControlStateNormal];
    applyBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [applyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [applyBtn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:applyBtn];
    
//   在线咨询
    UIButton *askBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    askBtn.frame = CGRectMake(screenWidth-97*screenScale, screenHeight-53-24-32*screenScale, 97*screenScale, 32*screenScale);
    [askBtn setBackgroundImage:[UIImage imageNamed:@"在线咨询"] forState:UIControlStateNormal];
    [self.view addSubview:askBtn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 点击事件
- (void)buttonClick{
    
    FinanceapplyViewController *vc = [[FinanceapplyViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
