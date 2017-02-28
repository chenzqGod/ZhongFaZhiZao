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

@interface MemberCenterViewController (){

    UIImageView *_iconImg;
    UIButton *_loginBtn;
    UILabel *_iconLabel;
    UIImageView *_bqlbl1;
    UIImageView *_bqlbl2;
    UIImageView *_bqlbl3;
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
    _iconImg.backgroundColor = [UIColor cyanColor];
    _iconImg.image = [UIImage imageNamed:@"头像"];
    [self.scrollView addSubview:_iconImg];
    
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
    [_loginBtn addTarget:self action:@selector(loginBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:_loginBtn];
    
    CustomButton *informationBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
    informationBtn.frame = CGRectMake(screenWidth-15*screenScale-24, 12, 26, 32);
    informationBtn.imageRect = CGRectMake(4, 0, 18, 14);
    informationBtn.titleRect = CGRectMake(0, 16, 26, 14);
    [informationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [informationBtn setTitle:@"消息" forState:UIControlStateNormal];
    informationBtn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    informationBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [informationBtn setImage:[UIImage imageNamed:@"消息1"] forState:UIControlStateNormal];
    [informationBtn addTarget:self action:@selector(informationBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:informationBtn];
    
   
    
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
    [self.scrollView addSubview:tenCDBtn];
    
 //   我的订单
    UIView *orderView = [[UIView alloc]initWithFrame:CGRectMake(0, 10+CGRectGetMaxY(collectBtn.frame), screenWidth, 41)];
    orderView.backgroundColor = [UIColor whiteColor];
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
        
        buttonOrder.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [underView addSubview:buttonOrder];
    }
    
    //账户安全View
    UIView *safeView = [[UIView alloc]initWithFrame:CGRectMake(0, 10+CGRectGetMaxY(underView.frame), screenWidth, 41)];
    safeView.backgroundColor = [UIColor whiteColor];
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

    
    //收货地址View
    UIView *addressView = [[UIView alloc]initWithFrame:CGRectMake(0, 1+CGRectGetMaxY(safeView.frame), screenWidth, 41)];
    addressView.backgroundColor = [UIColor whiteColor];
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
    
    
    
}

#pragma mark - 点击事件
- (void)loginBtn{

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

@end
