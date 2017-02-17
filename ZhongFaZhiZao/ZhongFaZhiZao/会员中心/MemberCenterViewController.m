//
//  MemberCenterViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/2/15.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "MemberCenterViewController.h"

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

    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, screenWidth, screenWidth-2-49)];
    [self.view addSubview:self.scrollView];
    
    
}

- (void)createUI{

//    相对scrollView的位置
    UIImageView *bgdImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 240*screenScale)];
    bgdImg.backgroundColor = BLUE_COLOR;
    bgdImg.image = [UIImage imageNamed:@"背景"];
    [self.scrollView addSubview:bgdImg];
    
    CGFloat iconImgH = 115*screenScale;
    _iconImg = [[UIImageView alloc]initWithFrame:CGRectMake((screenWidth-iconImgH)/2.0, 50*screenScale,iconImgH, iconImgH)];
    _iconImg.layer.cornerRadius = iconImgH/2.0;
    _iconImg.layer.masksToBounds = YES;
    _iconImg.backgroundColor = [UIColor cyanColor];
    _iconImg.image = [UIImage imageNamed:@"头像"];
    [self.scrollView addSubview:_iconImg];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat loginBtnH = 122*screenScale;
    _loginBtn.frame = CGRectMake((screenWidth-loginBtnH)/2.0, CGRectGetMaxY(_iconImg.frame)+12*screenScale, loginBtnH, 35*screenScale);
    _loginBtn.backgroundColor = [UIColor cyanColor];
    //_loginBtn.titleLabel.text = @"点击登录";
    [_loginBtn setTitle:@"点击登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
   // _loginBtn.titleLabel.textColor = [UIColor whiteColor];
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [self.scrollView addSubview:_loginBtn];
    
    CustomButton *collectBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
    collectBtn.frame = CGRectMake(0, CGRectGetMaxY(bgdImg.frame), (screenWidth-1)/2.0, 41);
    [collectBtn setTitle:@"商品收藏" forState:UIControlStateNormal];
    [collectBtn setTitleColor:TEXT_GREY_COLOR forState:UIControlStateNormal];
    [self.scrollView addSubview:collectBtn];
    
    CustomButton *tenCDBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
    tenCDBtn.frame = CGRectMake(0.5+CGRectGetMaxX(collectBtn.frame), CGRectGetMinY(collectBtn.frame), CGRectGetWidth(collectBtn.frame), CGRectGetHeight(collectBtn.frame));
    [tenCDBtn setTitle:@"店铺收藏" forState:UIControlStateNormal];
    [tenCDBtn setTitleColor:TEXT_GREY_COLOR forState:UIControlStateNormal];
    [self.scrollView addSubview:tenCDBtn];
    
 //   我的订单
    UIView *orderView = [[UIView alloc]initWithFrame:CGRectMake(0, 10+CGRectGetMaxY(collectBtn.frame), screenWidth, 41)];
    orderView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:orderView];
    
    UIImageView *orderImg = [[UIImageView alloc]initWithFrame:CGRectMake(20*screenScale, (41-18)/2.0, 18, 15)];
    [orderView addSubview:orderImg];
    
    UILabel *orderLbl = [[UILabel alloc]initWithFrame:CGRectMake(9+CGRectGetMaxX(orderImg.frame), 20/2.0, 66, 21)];
    orderLbl.text = @"我的订单";
    orderLbl.font = [UIFont systemFontOfSize:15.0];
    [orderView addSubview:orderLbl];
    
    
    
    //订单下View
    UIView *underView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(orderView.frame)+1, screenWidth, 72)];
    underView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:underView];
    
    //账户安全View
    UIView *safeView = [[UIView alloc]initWithFrame:CGRectMake(0, 10+CGRectGetMaxY(underView.frame), screenWidth, 41)];
    safeView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:safeView];
    
    //收货地址View
    UIView *addressView = [[UIView alloc]initWithFrame:CGRectMake(0, 1+CGRectGetMaxY(safeView.frame), screenWidth, 41)];
    addressView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:addressView];
    
    //分享View
    UIView *shareView = [[UIView alloc]initWithFrame:CGRectMake(0, 1+CGRectGetMaxY(addressView.frame), screenWidth, 41)];
    shareView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:shareView];
    
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
