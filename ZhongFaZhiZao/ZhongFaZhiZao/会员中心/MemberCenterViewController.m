//
//  MemberCenterViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/2/15.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "MemberCenterViewController.h"
#import "PwLoginViewController.h"
#import "AskViewController.h"
#import "UMengShareViewController.h"
#import "WKWebViewViewController.h"
#import "UIImageView+WebCache.h"
#import "RCDCustomerServiceViewController.h"

@interface MemberCenterViewController (){

    UIImageView *_iconImg;
    UIButton *_loginBtn;
    UILabel *_iconLabel;
    UIImageView *_bqlbl1;
    UILabel *_bqLbl;
    UIButton *_exitBtn;
    CustomButton *_informationBtn;
    
//    我的订单小红点
    UILabel *_redLbl1;
    UILabel *_redLbl2;
    UILabel *_redLbl3;
    UILabel *_redLbl4;
    
}

@property (nonatomic,strong)UIScrollView *scrollView;

@end

@implementation MemberCenterViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    [self.tabBarController.tabBar setHidden:NO];
    
    

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-49)];
    self.scrollView.backgroundColor = BACK_COLOR;
    [self.view addSubview:self.scrollView];
    
    [self createUI];
    
    if ([USER_DEFAULTS objectForKey:@"token"]) {
        
        [self loadData];
    }
    
    
//    定义通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess) name:@"sucess" object:nil];

}

//定义将要调用的方法
- (void)loginSuccess{

    [self loadData];
}


- (void)createUI{

//    相对scrollView的位置
    UIImageView *bgdImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 240*screenScale)];
    bgdImg.backgroundColor = BLUE_COLOR;
    bgdImg.image = [UIImage imageNamed:@"背景"];
    [self.scrollView addSubview:bgdImg];
    
    CGFloat iconImgH = 108*screenScale;
    _iconImg = [[UIImageView alloc]initWithFrame:CGRectMake((screenWidth-iconImgH)/2.0-1, 55*screenScale,iconImgH, iconImgH)];
    _iconImg.layer.cornerRadius = iconImgH/2.0;
    _iconImg.layer.masksToBounds = YES;
    _iconImg.image = [UIImage imageNamed:@"头像"];
    [self.scrollView addSubview:_iconImg];
    
//    点击登录按钮
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat loginBtnH = 122*screenScale;
    _loginBtn.frame = CGRectMake((screenWidth-loginBtnH)/2.0, CGRectGetMaxY(_iconImg.frame)+12*screenScale, loginBtnH, 35*screenScale);
    _loginBtn.backgroundColor = [UIColor colorWithHexString:@"#8682fc"];
    [_loginBtn setTitle:@"点击登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _loginBtn.titleLabel.textColor = [UIColor whiteColor];
    _loginBtn.layer.masksToBounds = YES;
    _loginBtn.layer.cornerRadius = 15;
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
   
    if ([USER_DEFAULTS objectForKey:@"token"]) {
        
        _loginBtn.hidden = YES;
    }else{
    _loginBtn.hidden = NO;
    }
    [self.scrollView addSubview:_loginBtn];
    
    
//    公司名字
    _iconLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(_iconImg.frame)+13*screenScale, screenWidth-40*2, 21)];
    _iconLabel.font = [UIFont systemFontOfSize:17.0];
    _iconLabel.textAlignment = NSTextAlignmentCenter;
    _iconLabel.textColor = [UIColor whiteColor];
//    _iconLabel.text = @"中发智造";
    
    if ([USER_DEFAULTS objectForKey:@"token"]) {
        
        _iconLabel.hidden = NO;
    }else{
        _iconLabel.hidden = YES;
    }
    [self.scrollView addSubview:_iconLabel];
    
//    最多三个标签
    _bqLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 5*screenScale+CGRectGetMaxY(_iconImg.frame)+13*screenScale+21, screenWidth, 14)];
    if ([USER_DEFAULTS objectForKey:@"token"]) {
        _bqLbl.hidden = NO;
    }else{
        _bqLbl.hidden = YES;
    }
    [self.scrollView addSubview:_bqLbl];

    
    _bqlbl1 = [[UIImageView alloc]init];
    if ([USER_DEFAULTS objectForKey:@"token"]) {
        _bqlbl1.hidden = NO;
    }else{
         _bqlbl1.hidden = YES;
    }
    [self.scrollView addSubview:_bqlbl1];
    
    _informationBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
    _informationBtn.frame = CGRectMake(screenWidth-15*screenScale-24, 12, 26, 32);
    _informationBtn.imageRect = CGRectMake(4, 0, 18, 14);
    _informationBtn.titleRect = CGRectMake(0, 16, 26, 14);
    [_informationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_informationBtn setTitle:@"消息" forState:UIControlStateNormal];
    _informationBtn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    _informationBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    if ([USER_DEFAULTS objectForKey:@"token"]) {
        
    _informationBtn.hidden = NO;

    }else{
    _informationBtn.hidden = YES;
    }
    
    [_informationBtn setImage:[UIImage imageNamed:@"消息1"] forState:UIControlStateNormal];
    [_informationBtn addTarget:self action:@selector(informationBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:_informationBtn];
    
   
    
    //body
    CustomButton *collectBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
    collectBtn.frame = CGRectMake(0, CGRectGetMaxY(bgdImg.frame), (screenWidth-1)/2.0, 41);
    [collectBtn setTitle:@"商品收藏" forState:UIControlStateNormal];
    [collectBtn setTitleColor:TEXT_GREY_COLOR forState:UIControlStateNormal];
    collectBtn.backgroundColor = [UIColor whiteColor];
    collectBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    collectBtn.imageRect = CGRectMake(53*screenScale, 14, 13, 13);
    collectBtn.titleRect = CGRectMake(75*screenScale, 15, 70*screenScale, 13);
    [collectBtn setImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
    [collectBtn addTarget:self action:@selector(mycollectionClickjan) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:collectBtn];
    
    CustomButton *tenCDBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
    tenCDBtn.frame = CGRectMake(0.5+CGRectGetMaxX(collectBtn.frame), CGRectGetMinY(collectBtn.frame), CGRectGetWidth(collectBtn.frame), CGRectGetHeight(collectBtn.frame));
    tenCDBtn.imageRect = CGRectMake(53*screenScale, 14, 13, 13);
    tenCDBtn.titleRect = CGRectMake(75*screenScale, 14, 70*screenScale, 13);
    [tenCDBtn setImage:[UIImage imageNamed:@"收藏"] forState:UIControlStateNormal];
    tenCDBtn.backgroundColor = [UIColor whiteColor];
    [tenCDBtn setTitle:@"店铺收藏" forState:UIControlStateNormal];
    [tenCDBtn setTitleColor:TEXT_GREY_COLOR forState:UIControlStateNormal];
    tenCDBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [tenCDBtn addTarget:self action:@selector(mycollectionClickten) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:tenCDBtn];
    
 //   我的订单
    UIView *orderView = [[UIView alloc]initWithFrame:CGRectMake(0, 10+CGRectGetMaxY(collectBtn.frame), screenWidth, 41)];
    orderView.backgroundColor = [UIColor whiteColor];
    orderView.userInteractionEnabled = YES;
    [self.scrollView addSubview:orderView];
    
    UIImageView *orderImg = [[UIImageView alloc]initWithFrame:CGRectMake(20*screenScale, (41-17)/2.0, 17, 17)];
    orderImg.image = [UIImage imageNamed:@"我的订单icon"];
    [orderView addSubview:orderImg];
    
    UILabel *orderLbl = [[UILabel alloc]initWithFrame:CGRectMake(9+CGRectGetMaxX(orderImg.frame), 20/2.0, 66, 21)];
    orderLbl.text = @"我的订单";
    orderLbl.font = [UIFont systemFontOfSize:16.0];
    [orderView addSubview:orderLbl];
    
    UIImageView *JTImg = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth-15*screenScale-8, (41-15)/2.0, 8, 15)];
    JTImg.image = [UIImage imageNamed:@"箭头"];
    [orderView addSubview:JTImg];
    
    UILabel *JTlabel = [[UILabel alloc]initWithFrame:CGRectMake(screenWidth-15*screenScale-8-10*screenScale-80, (41-17)/2.0, 80, 17)];
    JTlabel.text = @"查看全部订单";
    JTlabel.textAlignment = NSTextAlignmentRight;
    JTlabel.font = [UIFont systemFontOfSize:13.0];
    JTlabel.textColor = TEXT_GREY_COLOR;
    [orderView addSubview:JTlabel];
    
    UIButton *orderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    orderBtn.frame = orderView.frame;
    
    [orderBtn addTarget:self action:@selector(orderBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:orderBtn];

    
    //订单下View
    UIView *underView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(orderView.frame)+1, screenWidth, 72)];
    underView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:underView];
    
    NSArray *titleArr = @[@"待付款",@"待发货",@"待收货",@"退款中"];
    NSArray *imgArr = @[@"待付款",@"待发货icon",@"待收货icon",@"退款icon"];
    
    for (int i = 0; i < 4; i++) {
        
        CustomButton *buttonOrder = [CustomButton buttonWithType:UIButtonTypeCustom];
        buttonOrder.frame = CGRectMake(screenWidth/4.0*i, 0, screenWidth/4.0, 40);
        buttonOrder.backgroundColor = [UIColor whiteColor];
        [buttonOrder setTitle:titleArr[i] forState:UIControlStateNormal];
        [buttonOrder setTitleColor:TEXT_GREY_COLOR forState:UIControlStateNormal];
        [buttonOrder setImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
        buttonOrder.titleLabel.font = [UIFont systemFontOfSize:13.0];
        buttonOrder.imageRect = CGRectMake((screenWidth/4.0-25)/2.0, 14, 25, 25);
        buttonOrder.titleRect = CGRectMake(0, 14+25+8, screenWidth/4.0, 17);
        buttonOrder.tag = 60+i;
        [buttonOrder addTarget:self action:@selector(buttonOrderClick:) forControlEvents:UIControlEventTouchUpInside];
        buttonOrder.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [underView addSubview:buttonOrder];
        
  
    }
    
    
//    小圆点
    _redLbl1 = [[UILabel alloc]initWithFrame:CGRectMake((screenWidth/4.0-25)/2.0+20, 9*screenScale, 13, 13)];
    _redLbl1.layer.masksToBounds = YES;
    _redLbl1.layer.cornerRadius = 6.5;
    _redLbl1.backgroundColor = RED_COLOR;
    _redLbl1.textColor = [UIColor whiteColor];
    _redLbl1.textAlignment = NSTextAlignmentCenter;
    _redLbl1.font = [UIFont systemFontOfSize:10.0];
    
    if ([USER_DEFAULTS objectForKey:@"token"]) {
        
        _redLbl1.hidden = NO;
        
    }else{
         _redLbl1.hidden = YES;
    }
    
    [underView addSubview:_redLbl1];
    
    _redLbl2 = [[UILabel alloc]initWithFrame:CGRectMake((screenWidth/4.0-25)/2.0+20+screenWidth/4.0, 9*screenScale, 13, 13)];
    _redLbl2.layer.masksToBounds = YES;
    _redLbl2.layer.cornerRadius = 6.5;
    _redLbl2.backgroundColor = RED_COLOR;
    _redLbl2.textColor = [UIColor whiteColor];
    _redLbl2.textAlignment = NSTextAlignmentCenter;
    _redLbl2.font = [UIFont systemFontOfSize:10.0];
    
    if ([USER_DEFAULTS objectForKey:@"token"]) {
        
        _redLbl2.hidden = NO;
        
    }else{
        _redLbl2.hidden = YES;
    }
    [underView addSubview:_redLbl2];
    
    _redLbl3 = [[UILabel alloc]initWithFrame:CGRectMake((screenWidth/4.0-25)/2.0+20+screenWidth/4.0*2, 9*screenScale, 13, 13)];
    _redLbl3.layer.masksToBounds = YES;
    _redLbl3.layer.cornerRadius = 6.5;
    _redLbl3.backgroundColor = RED_COLOR;
    _redLbl3.textColor = [UIColor whiteColor];
    _redLbl3.textAlignment = NSTextAlignmentCenter;
    _redLbl3.font = [UIFont systemFontOfSize:10.0];
    if ([USER_DEFAULTS objectForKey:@"token"]) {
        
        _redLbl3.hidden = NO;
        
    }else{
        _redLbl3.hidden = YES;
    }
    [underView addSubview:_redLbl3];
    
    _redLbl4 = [[UILabel alloc]initWithFrame:CGRectMake((screenWidth/4.0-25)/2.0+20+screenWidth/4.0*3, 9*screenScale, 13, 13)];
    _redLbl4.layer.masksToBounds = YES;
    _redLbl4.layer.cornerRadius = 6.5;
    _redLbl4.backgroundColor = RED_COLOR;
    _redLbl4.textColor = [UIColor whiteColor];
    _redLbl4.textAlignment = NSTextAlignmentCenter;
    _redLbl4.font = [UIFont systemFontOfSize:10.0];

    if ([USER_DEFAULTS objectForKey:@"token"]) {
        
        _redLbl4.hidden = NO;
        
    }else{
        _redLbl4.hidden = YES;
    }
    [underView addSubview:_redLbl4];
    
    //账户安全View
    UIView *safeView = [[UIView alloc]initWithFrame:CGRectMake(0, 10+CGRectGetMaxY(underView.frame), screenWidth, 41)];
    safeView.backgroundColor = [UIColor whiteColor];
    safeView.userInteractionEnabled = YES;
    [self.scrollView addSubview:safeView];
    
    UIImageView *safeImg = [[UIImageView alloc]initWithFrame:CGRectMake(20*screenScale, (41-17)/2.0, 17, 17)];
    safeImg.image = [UIImage imageNamed:@"安全"];
    [safeView addSubview:safeImg];
    
    UILabel *safeLbl = [[UILabel alloc]initWithFrame:CGRectMake(9+CGRectGetMaxX(safeImg.frame), 20/2.0, 66, 21)];
    safeLbl.text = @"账户安全";
    safeLbl.font = [UIFont systemFontOfSize:16.0];
    [safeView addSubview:safeLbl];
    
    UIImageView *JTImg2 = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth-15*screenScale-8, (41-15)/2.0, 8, 15)];
    JTImg2.image = [UIImage imageNamed:@"箭头"];
    [safeView addSubview:JTImg2];

    UIButton *safeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    safeBtn.frame = safeView.frame;
    
    [safeBtn addTarget:self action:@selector(safeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:safeBtn];

    
    //收货地址View
    UIView *addressView = [[UIView alloc]initWithFrame:CGRectMake(0, 1+CGRectGetMaxY(safeView.frame), screenWidth, 41)];
    addressView.backgroundColor = [UIColor whiteColor];
    addressView.userInteractionEnabled = YES;
    [self.scrollView addSubview:addressView];
    
    UIImageView *addressImg = [[UIImageView alloc]initWithFrame:CGRectMake(20*screenScale, (41-17)/2.0, 17, 17)];
    addressImg.image = [UIImage imageNamed:@"地址"];
    [addressView addSubview:addressImg];
    
    UILabel *addressLbl = [[UILabel alloc]initWithFrame:CGRectMake(9+CGRectGetMaxX(addressImg.frame), 20/2.0, 100, 21)];
    addressLbl.text = @"收货地址管理";
    addressLbl.font = [UIFont systemFontOfSize:16.0];
    [addressView addSubview:addressLbl];
    
    UIImageView *JTImg3 = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth-15*screenScale-8, (41-15)/2.0, 8, 15)];
    JTImg3.image = [UIImage imageNamed:@"箭头"];
    [addressView addSubview:JTImg3];
    
    UIButton *addressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addressBtn.frame = addressView.frame;
    
    [addressBtn addTarget:self action:@selector(addressBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:addressBtn];

    
    //分享View
    UIView *shareView = [[UIView alloc]initWithFrame:CGRectMake(0, 1+CGRectGetMaxY(addressView.frame), screenWidth, 41)];
    shareView.backgroundColor = [UIColor whiteColor];
    shareView.userInteractionEnabled = YES;
    [self.scrollView addSubview:shareView];
    
    UIImageView *shareImg = [[UIImageView alloc]initWithFrame:CGRectMake(20*screenScale, (41-17)/2.0, 17, 17)];
    shareImg.image = [UIImage imageNamed:@"分享"];
    [shareView addSubview:shareImg];
    
    UILabel *shareLbl = [[UILabel alloc]initWithFrame:CGRectMake(9+CGRectGetMaxX(shareImg.frame), 20/2.0, 66, 21)];
    shareLbl.text = @"分享好友";
    shareLbl.font = [UIFont systemFontOfSize:16.0];
    [shareView addSubview:shareLbl];
    
    UIImageView *JTImg4 = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth-15*screenScale-8, (41-15)/2.0, 8, 15)];
    JTImg4.image = [UIImage imageNamed:@"箭头"];
    [shareView addSubview:JTImg4];
    
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = shareView.frame;
    
    [shareBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:shareBtn];
    
//    退出按钮
  
    _exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _exitBtn.frame = CGRectMake(17.5*screenScale, CGRectGetMaxY(shareView.frame)+20*screenScale, 340*screenScale, 35*screenScale);
    _exitBtn.backgroundColor = [UIColor whiteColor];
    [_exitBtn setTitle:@"退出" forState:UIControlStateNormal];
    [_exitBtn setTitleColor:BLUE_COLOR forState:UIControlStateNormal];
    _exitBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _exitBtn.titleLabel.text = @"退出";
    _exitBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
    
    if ([USER_DEFAULTS objectForKey:@"token"]) {
        
      _exitBtn.hidden = NO;
    }else{
        _exitBtn.hidden = YES;
    }

    [_exitBtn addTarget:self action:@selector(exitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:_exitBtn];
    
    
    self.scrollView.contentSize = CGSizeMake(screenWidth,55+CGRectGetMaxY(shareBtn.frame)+30);


  
/*
    //客服测试
    UIView *serviceView = [[UIView alloc]initWithFrame:CGRectMake(0, 1+CGRectGetMaxY(shareView.frame), screenWidth, 41)];
    serviceView.backgroundColor = [UIColor whiteColor];
    serviceView.userInteractionEnabled = YES;
    [self.scrollView addSubview:serviceView];
    
    UIImageView *serviceimg = [[UIImageView alloc]initWithFrame:CGRectMake(20*screenScale, (41-17)/2.0, 17, 17)];
    serviceimg.image = [UIImage imageNamed:@"分享"];
    [serviceView addSubview:serviceimg];
    
    UILabel *serviceLbl = [[UILabel alloc]initWithFrame:CGRectMake(9+CGRectGetMaxX(serviceimg.frame), 20/2.0, 66, 21)];
    serviceLbl.text = @"联系我们";
    serviceLbl.font = [UIFont systemFontOfSize:16.0];
    [serviceView addSubview:serviceLbl];
    
    UIImageView *svImg4 = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth-15*screenScale-8, (41-15)/2.0, 8, 15)];
    svImg4.image = [UIImage imageNamed:@"箭头"];
    [serviceView addSubview:svImg4];
    
    
    UIButton *serviceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    serviceBtn.frame = serviceView.frame;
    
    [serviceBtn addTarget:self action:@selector(serviceBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:serviceBtn];
    
    
    
    //    退出按钮
    _exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _exitBtn.frame = CGRectMake(17.5*screenScale, CGRectGetMaxY(serviceView.frame)+20*screenScale, 340*screenScale, 35*screenScale);
    _exitBtn.backgroundColor = [UIColor whiteColor];
    [_exitBtn setTitle:@"退出" forState:UIControlStateNormal];
    [_exitBtn setTitleColor:BLUE_COLOR forState:UIControlStateNormal];
    _exitBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _exitBtn.titleLabel.text = @"退出";
    _exitBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
    
    if ([USER_DEFAULTS objectForKey:@"token"]) {
        
        _exitBtn.hidden = NO;
    }else{
        _exitBtn.hidden = YES;
    }
    
    [_exitBtn addTarget:self action:@selector(exitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:_exitBtn];
    
    
    self.scrollView.contentSize = CGSizeMake(screenWidth,55+CGRectGetMaxY(shareBtn.frame)+30);
 */

}

- (void)loadData{

    
    [[NSNetworking sharedManager]get:[NSString stringWithFormat:@"%@%@",HOST_URL,MEMBER_CENTER] parameters:nil success:^(id response) {
        
        if ([response[@"resultCode"]integerValue] == 1000) {
            
            _loginBtn.hidden = YES;
            _iconLabel.hidden = NO;
            _exitBtn.hidden = NO;
            _informationBtn.hidden = NO;
            _iconLabel.text = response[@"data"][@"corpName"];
            
            
            NSUInteger flagcount = [response[@"data"][@"membership"] count];
            
            if ([response[@"data"][@"membership"] count] > 0) {
                
                for (NSInteger i = 0; i < flagcount; i++) {
                    
                    _bqLbl.hidden = NO;
                    
                    UIImageView *img = [[UIImageView alloc]init];
                    img.frame = CGRectMake((screenWidth -2*(flagcount-1)-28*flagcount)/2.0+2*i+28*i, 0, 28, 14);
//                    img.backgroundColor = [UIColor cyanColor];
//                    img.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",response[@"data"][@"membership"][i][@"role_name"]]];
                    
                    [img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://images.cecb2b.com/images/common-service/icon/%@.png", response[@"data"][@"membership"][i][@"Role_id"]]] placeholderImage:nil];
                    
                    [_bqLbl addSubview:img];
                }
            }
            else {
            
                _bqlbl1.hidden = YES;
            }

            
            if ([response[@"data"][@"orderCount"][@"waitpayCount"]integerValue] > 0) {
                
                _redLbl1.hidden = NO;
                _redLbl1.text = [NSString stringWithFormat:@"%@",response[@"data"][@"orderCount"][@"waitpayCount"]];
                
            }else{
            
                _redLbl1.hidden = YES;

            }
            
            if ([response[@"data"][@"orderCount"][@"waitSippingCount"]integerValue] > 0) {
                
                _redLbl2.hidden = NO;
                _redLbl2.text = [NSString stringWithFormat:@"%@",response[@"data"][@"orderCount"][@"waitSippingCount"]];
                
            }else{
            
                _redLbl2.hidden =YES;
            }
            
            

            if ([response[@"data"][@"orderCount"][@"waitReceiptCount"]integerValue] > 0) {
                
                _redLbl3.hidden = NO;
                _redLbl3.text = [NSString stringWithFormat:@"%@",response[@"data"][@"orderCount"][@"waitReceiptCount"]];
                
            }
            else{
            
                _redLbl3.hidden = YES;
            }

            if ([response[@"data"][@"orderCount"][@"refundCount"]integerValue] > 0) {
                
                _redLbl4.hidden = NO;
                _redLbl4.text = [NSString stringWithFormat:@"%@",response[@"data"][@"orderCount"][@"refundCount"]];
                
            }else{
            
                _redLbl4.hidden = YES;
            }

            
        }
        else if ([response[@"resultCode"]integerValue] == 1001){
            
            NSLog(@"会员中心请求失败");
            
            
        }
        
        else if ([response[@"resultCode"]integerValue] == 1002){
        
            NSLog(@"未登录");
            _loginBtn.hidden = NO;
            _iconLabel.hidden = YES;
            _exitBtn.hidden = YES;
            _informationBtn.hidden = YES;
            
            _redLbl1.hidden = YES;
            _redLbl2.hidden = YES;
            _redLbl3.hidden = YES;
            _redLbl4.hidden = YES;
            
            _bqLbl.hidden =YES;
        }
        
    } failure:^(NSString *error) {
        
        NSLog(@"%@",error);
        
        [WKProgressHUD popMessage:@"请检查网络连接" inView:self.view duration:HUD_DURATION animated:YES];
        
    }];

}

#pragma mark - 点击事件
- (void)loginBtnClick{
    PwLoginViewController *vc = [[PwLoginViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)informationBtn{

    AskViewController *vc = [[AskViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)shareBtnClick{

    UMengShareViewController *vc = [[UMengShareViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)exitBtnClick{

    NSLog(@"退出当前账号");
    
//    [self.navigationController popToRootViewControllerAnimated:YES];
    
    //移除UserDefaults中存储的用户信息
    [USER_DEFAULTS removeObjectForKey:@"uid"];
    [USER_DEFAULTS removeObjectForKey:@"token"];
    [USER_DEFAULTS removeObjectForKey:@"uname"];
    [USER_DEFAULTS removeObjectForKey:@"contacts"];
    [USER_DEFAULTS removeObjectForKey:@"mobile"];

    [USER_DEFAULTS synchronize];
    
    NSLog(@"%@",[USER_DEFAULTS objectForKey:@"token"]);
    
    _loginBtn.hidden = NO;
    _iconLabel.hidden = YES;
    _exitBtn.hidden = YES;
    _informationBtn.hidden = YES;
    
    _redLbl1.hidden = YES;
    _redLbl2.hidden = YES;
    _redLbl3.hidden = YES;
    _redLbl4.hidden = YES;

    _bqLbl.hidden = YES;
    
}

- (void)mycollectionClickjan{

    if (![USER_DEFAULTS objectForKey:@"token"]) {
        
        PwLoginViewController *vc = [[PwLoginViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{
    WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,MEMBER_COLLECT_JAN] title:@"我的收藏"];
    
    [self.navigationController pushViewController:vc animated:YES];
    }
}


- (void)mycollectionClickten{
    if (![USER_DEFAULTS objectForKey:@"token"]) {
        
        PwLoginViewController *vc = [[PwLoginViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{
    
    WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,MEMBER_COLLECT_TEN] title:@"我的收藏"];
    
    [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)addressBtnClick{

    if (![USER_DEFAULTS objectForKey:@"token"]) {
        
        PwLoginViewController *vc = [[PwLoginViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{
    WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,MEMBER_RECEIVEADDRESS] title:@"收货地址"];
    
    [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)safeBtnClick{

    if (![USER_DEFAULTS objectForKey:@"token"]) {
        
        PwLoginViewController *vc = [[PwLoginViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,MEMBER_SAFECOUNT] title:@"账号安全"];
        
        [self.navigationController pushViewController:vc animated:YES];

        
    NSLog(@"期待");
        
        
    }
}

- (void)orderBtnClick{

    if (![USER_DEFAULTS objectForKey:@"token"]) {
        
        PwLoginViewController *vc = [[PwLoginViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{
    WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,MY_ORDER] title:@"我的订单"];
    
    [self.navigationController pushViewController:vc animated:YES];
    }
}

//四个状态按钮
- (void)buttonOrderClick:(UIButton *)btn{
    
    if (![USER_DEFAULTS objectForKey:@"token"]) {
        
        PwLoginViewController *vc = [[PwLoginViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{
    

    
    if (btn.tag == 60) {
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,MEMBER_PENDING] title:@"待付款"];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if (btn.tag == 61){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,MEMBER_DELIVERY] title:@"待发货"];
        
        [self.navigationController pushViewController:vc animated:YES];
    
    }
    else if (btn.tag == 62){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,MEMBER_RECEIVING] title:@"待收货"];
        
        [self.navigationController pushViewController:vc animated:YES];
    
    }
    else if (btn.tag == 63){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,MEMBER_REFUND] title:@"退款中"];
        
        [self.navigationController pushViewController:vc animated:YES];
    
    }
    
    else{
    
        NSLog(@"不是四种订单状态");
    }
    
    }
    
}

- (void)serviceBtnClick{

    RCDCustomerServiceViewController *chatService =
    [[RCDCustomerServiceViewController alloc] init];
    //#define SERVICE_ID @"KEFU145801184889727"
#define SERVICE_ID @"KEFU149092142970554"
    chatService.conversationType = ConversationType_CUSTOMERSERVICE;
    chatService.targetId = SERVICE_ID;
    chatService.title = @"客服";
    
    [self.navigationController pushViewController:chatService animated:YES];
}


-(void)dealloc{

    //    移除通知
    [[NSNotificationCenter
      defaultCenter] removeObserver:self name:@"sucess"
     
     object:nil];
    
}

@end
