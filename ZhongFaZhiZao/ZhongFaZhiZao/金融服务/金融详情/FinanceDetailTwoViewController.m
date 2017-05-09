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
#import <RongIMKit/RongIMKit.h>
#import "IMViewController.h"
#import <RongIMKit/RCConversationViewController.h>
#import "IMDetailViewController.h"
#import "PwLoginViewController.h"

@interface FinanceDetailTwoViewController ()<RCIMUserInfoDataSource>{

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
    
//    添加标签（最多三个）
    UIImageView *_FirstImg;
    UIImageView *_SecondImg;
    UIImageView *_ThirdImg;
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
            
            
            if (![_dic[@"qtsm"] isEqualToString:@""]) {
                _otherLabel.text = [NSString stringWithFormat:@"%@",_dic[@"qtsm"]];
                CGFloat otherLblH = [CaculateLabelHeight getSpaceLabelHeight:_otherLabel.text withWidth:LblW andFont:12.0 andLines:4.0];
                _otherLabel.frame = CGRectMake(20*screenScale, 39, LblW, otherLblH);
                _otherView.frame = CGRectMake(0,1+CGRectGetMaxY(_sqtjView.frame), screenWidth, 52+otherLblH);
                 _downView.frame = CGRectMake(0, 1+CGRectGetMaxY(_otherView.frame), screenWidth, 47*screenScale+56);
                
            }
            else{
            
                _otherView.frame = CGRectZero;
                _otherView.hidden = YES;
                 _downView.frame = CGRectMake(0, 1+CGRectGetMaxY(_sqtjView.frame), screenWidth, 47*screenScale+56);
            }
            
            _scrollView.contentSize = CGSizeMake(screenWidth, 140+CGRectGetMaxY(_downView.frame));
            
        }
        
    } failure:^(NSString *error) {
        
        
        
    }];

}

- (void)createUI{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 34+32*screenScale)];
    headView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:headView];
    
    _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(25*screenScale, 17, 80*screenScale, 32*screenScale)];
    [headView addSubview:_iconView];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(_iconView.frame), 13, screenWidth-(16*screenScale+CGRectGetMaxX(_iconView.frame))-Margin, 20)];
    _nameLabel.font = [UIFont systemFontOfSize:15.0];
    [headView addSubview:_nameLabel];
    
    
//    添加标签
    _FirstImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame), CGRectGetMaxY(_iconView.frame)-11, 28, 11)];
    _FirstImg.image = [UIImage imageNamed:self.firstStr];
    [headView addSubview:_FirstImg];
    
    _SecondImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FirstImg.frame)+5, CGRectGetMinY(_FirstImg.frame), CGRectGetWidth(_FirstImg.frame), CGRectGetHeight(_FirstImg.frame))];
    _SecondImg.image = [UIImage imageNamed:self.secondStr];
    [headView addSubview:_SecondImg];
    
    _ThirdImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_SecondImg.frame)+5, CGRectGetMinY(_FirstImg.frame), CGRectGetWidth(_FirstImg.frame), CGRectGetHeight(_FirstImg.frame))];
    _ThirdImg.image = [UIImage imageNamed:self.thirdStr];
    [headView addSubview:_ThirdImg];
    
    
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
    [askBtn addTarget:self action:@selector(IMBtnClick1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:askBtn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 点击事件
- (void)IMBtnClick1{

    if ([USER_DEFAULTS objectForKey:@"token"] == nil) {
        
        PwLoginViewController *vc = [[PwLoginViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{
        
        if ([USER_DEFAULTS objectForKey:@"rongtoken"] == nil) {
            
            [self getRongToken];
        }
        
        IMDetailViewController *chatViewController = [[IMDetailViewController alloc]init];
        chatViewController.targetId = [NSString stringWithFormat:@"%@",_dic[@"corpId"]];
        
        
        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@/corp/%@/getCorpName",HOST_URL,_dic[@"corpId"]] parameters:nil success:^(id response) {
            
            if ([response[@"state"]isEqualToString:@"Y"]) {
                
                //                _rongNameStr = response[@"data"][@"name"];
                chatViewController.title = response[@"data"][@"name"];
            }
            
            
        } failure:^(NSString *error) {
            
            chatViewController.title = @"在线咨询";
        }];
        
        
        
        chatViewController.conversationType = ConversationType_PRIVATE;
        
        [self.navigationController pushViewController:chatViewController animated:YES];
        
        
    }

}



- (void)buttonClick{
    
    FinanceapplyViewController *vc = [[FinanceapplyViewController alloc]init];
    vc.iconImg = [NSString stringWithFormat:@"%@",_dic[@"cpLogo"]];
    vc.name = [NSString stringWithFormat:@"%@—%@",_dic[@"corpName"],_dic[@"name"]];
    vc.rate = @"NOEXIST";
    vc.moneyMax = @"NOEXIST";
    vc.moneyMin = @"NOEXIST";
    vc.periodMax = @"NOEXIST";
    vc.periodMin = @"NOEXIST";
    vc.fid = self.fid;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)getUserInfoWithUserId:(NSString *)userId completion:(void(^)(RCUserInfo* userInfo))completion

{
    if ([userId isEqualToString:[USER_DEFAULTS objectForKey:@"uid"]]) {
        
        RCUserInfo *user = [[RCUserInfo alloc]init];
        
        user.userId = [USER_DEFAULTS objectForKey:@"uid"];
        
        user.name = [USER_DEFAULTS objectForKey:@"uname"];
        
        //        user.portraitUri = @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008";
        
        return completion(user);
        
    }
    
    
}

-(void)getRongToken{
    
    [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,GETRONG_TOKEN] parameters:nil success:^(id response) {
        
        
        [USER_DEFAULTS setObject:response[@"token"] forKey:@"rongtoken"];
        
        NSString *token = [USER_DEFAULTS objectForKey:@"rongtoken"];
        
        if ([USER_DEFAULTS objectForKey:@"token"]) {
            
            [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
                
                //设置用户信息提供者,页面展现的用户头像及昵称都会从此代理取 这里会跳到会话列表界面  就是我们平常QQ聊天都有一个
                
                //        会话的列表  如果想直接跳到聊天界面 下面再说
                
                //                [[RCIM sharedRCIM] setUserInfoDataSource:self];
                
                NSLog(@"Login successfully with userId: %@.", userId);
                
                
            } error:^(RCConnectErrorCode status) {
                
                NSLog(@"login error status: %ld.", (long)status);
                
            } tokenIncorrect:^{
                
                NSLog(@"token 无效 ，请确保生成token 使用的appkey 和初始化时的appkey 一致");
                
            }];
            
        }
        
    } failure:^(NSString *error) {
        
    }];
    
}

@end
