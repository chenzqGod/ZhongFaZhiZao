//
//  FinanceDetailOneViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/1/17.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "FinanceDetailOneViewController.h"
#import "CaculateLabelHeight.h"

@interface FinanceDetailOneViewController (){

    UIScrollView *_scrollView;
    UIImageView *_iconView;
    UILabel *_nameLabel;
    UILabel *_biaoqianLabel;
    UILabel *_tqhkLabel;
    UILabel *_sqtjLabel;
    UILabel *_clLabel;
    UILabel *_rateLabel;
}

@end

@implementation FinanceDetailOneViewController

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
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64)];
    [self.view addSubview:_scrollView];
    
    [self createUI];
    
}

- (void)loadData{}

- (void)createUI{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 84*screenScale)];
    headView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:headView];
   
    _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130*screenScale, 62*screenScale)];
    _iconView.center = headView.center;
    _iconView.backgroundColor = [UIColor cyanColor];
    [headView addSubview:_iconView];
    
    UIView *midView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 7+CGRectGetMaxY(headView.frame), screenWidth, 90)];
    midView1.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:midView1];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(19*screenScale, 13, screenWidth-19*screenScale-Margin, 20)];
    _nameLabel.backgroundColor = [UIColor cyanColor];
    _nameLabel.font = [UIFont systemFontOfSize:14.0];
    [midView1 addSubview:_nameLabel];
    
    _biaoqianLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame), 2+CGRectGetMaxY(_nameLabel.frame), CGRectGetWidth(_nameLabel.frame), 14)];
    _biaoqianLabel.font = [UIFont systemFontOfSize:10.0];
    _biaoqianLabel.textColor = [UIColor colorWithHexString:@"#F6A623"];
    [midView1 addSubview:_biaoqianLabel];
    
    UILabel *tiqianLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame), 8+CGRectGetMaxY(_biaoqianLabel.frame), 100, 17)];
    tiqianLabel.text = @"【提前还款说明】";
    tiqianLabel.font = [UIFont boldSystemFontOfSize:12.0];
    [midView1 addSubview:tiqianLabel];
    
    _tqhkLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(tiqianLabel.frame), CGRectGetMinY(tiqianLabel.frame), CGRectGetMaxY(_nameLabel.frame)-95, CGRectGetHeight(tiqianLabel.frame))];
    _tqhkLabel.font = [UIFont systemFontOfSize:12.0];
    [midView1 addSubview:_tqhkLabel];
    
    UIView *applyLabel = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(midView1.frame)+1, screenWidth, 38)];
    applyLabel.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:applyLabel];
    
    UILabel *applynameLbl = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame), 9, 70, 20)];
    applynameLbl.text = @"申请条件";
    applynameLbl.textColor = [UIColor blackColor];
    applynameLbl.font = [UIFont systemFontOfSize:14.0];
    [applyLabel addSubview:applynameLbl];
    
    //自动计算申请条件
    _sqtjLabel = [[UILabel alloc]init];
    _sqtjLabel.numberOfLines = 0;
    _sqtjLabel.backgroundColor = [UIColor whiteColor];
    NSString *addtext =  @"先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。然侍卫之臣不懈于内，忠志之士忘身于外者，先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。然侍卫之臣不懈于内，忠志之士忘身于外者";
    _sqtjLabel.text = addtext;
    _sqtjLabel.textColor = [UIColor colorWithHexString:@"#4a4a4a"];

    CGFloat tjlabelH = [CaculateLabelHeight getSpaceLabelHeight:addtext withWidth:CGRectGetWidth(_nameLabel.frame) andFont:12.0 andLines:4.0];
    
    _sqtjLabel.frame = CGRectMake(CGRectGetMinX(_nameLabel.frame), CGRectGetMaxY(applyLabel.frame)+1, CGRectGetWidth(_nameLabel.frame), tjlabelH);
    [_scrollView addSubview:_sqtjLabel];

    UIView *needLabel = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_sqtjLabel.frame)+1, screenWidth, 38)];
    needLabel.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:needLabel];
    
    UILabel *neednameLbl = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame), 9, 70, 20)];
    neednameLbl.text = @"所需材料";
    neednameLbl.font = [UIFont systemFontOfSize:14.0];
    [needLabel addSubview:neednameLbl];

//    自动计算所需材料
    _clLabel = [[UILabel alloc]init];
    _clLabel.numberOfLines = 0;
    NSString *addtext2 =  @"先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。然侍卫之臣不懈于内，忠志之士忘身于外者，先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。然侍卫之臣不懈于内，忠志之士忘身于外者";
    _clLabel.text = addtext2;
    _clLabel.textColor = [UIColor colorWithHexString:@"#4a4a4a"];
    _clLabel.backgroundColor = [UIColor whiteColor];
    CGFloat cllabelH = [CaculateLabelHeight getSpaceLabelHeight:_sqtjLabel.text withWidth:CGRectGetWidth(_nameLabel.frame) andFont:12.0 andLines:4.0];
    
    _clLabel.frame = CGRectMake(CGRectGetMinX(_nameLabel.frame), CGRectGetMaxY(needLabel.frame)+1, CGRectGetWidth(_nameLabel.frame), cllabelH);
    [_scrollView addSubview:_clLabel];

    
    UIView *downView = [[UIView alloc]initWithFrame:CGRectMake(0, 1+CGRectGetMaxY(_clLabel.frame), screenWidth, 110)];
    downView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:downView];
    
    UILabel *liuchengLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame), 13, 70, 20)];
    liuchengLabel.text = @"申请流程";
    liuchengLabel.font = [UIFont systemFontOfSize:14.0];
    [downView addSubview:liuchengLabel];
    
    UIImageView *liuchengImg = [[UIImageView alloc]initWithFrame:CGRectMake((screenWidth-327*screenScale)/2.0, CGRectGetMaxY(liuchengLabel.frame)+10, 327*screenScale, 47*screenScale)];
    liuchengImg.image = [UIImage imageNamed:@"申请流程"];
    [downView addSubview:liuchengImg];
    
//    放在window层上
    UIView *downLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, screenHeight-52, 477/2.0*screenScale, 52)];
    downLeftView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:downLeftView];
    
    _rateLabel = [[UILabel alloc]initWithFrame:CGRectMake(19*screenScale, 3, 477/2.0*screenScale-19*screenScale-2, 24)];
    _rateLabel.text = @"贷款利率：1.0%/月";
    _rateLabel.font = [UIFont systemFontOfSize:14.0];
    [downLeftView addSubview:_rateLabel];
    
    UILabel *tiaozLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_rateLabel.frame), 2+CGRectGetMaxY(_rateLabel.frame)+2, CGRectGetWidth(_rateLabel.frame), 16)];
    tiaozLabel.text = @"根据企业具体情况，利率会有所调整";
    tiaozLabel.font = [UIFont systemFontOfSize:12.0];
    [downLeftView addSubview:tiaozLabel];
    
//    申请按钮
    UIButton *applyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    applyBtn.frame = CGRectMake(477/2.0*screenScale, screenHeight-53, screenWidth-477/2.0*screenScale, 53);
    applyBtn.backgroundColor = [UIColor colorWithHexString:@"#F6A623"];
    [applyBtn setTitle:@"立即申请" forState:UIControlStateNormal];
    applyBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [applyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:applyBtn];
    
//    在线咨询
    UIButton *askBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    askBtn.frame = CGRectMake(screenWidth-97*screenScale, screenHeight-53-24-32*screenScale, 97*screenScale, 32*screenScale);
    [askBtn setBackgroundImage:[UIImage imageNamed:@"在线咨询"] forState:UIControlStateNormal];
    [self.view addSubview:askBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
