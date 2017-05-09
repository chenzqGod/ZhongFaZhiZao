//
//  FinanceDetailOneViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/1/17.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "FinanceDetailOneViewController.h"
#import "CaculateLabelHeight.h"
#import "FinanceapplyViewController.h"
#import "UIImageView+WebCache.h"
#import <RongIMKit/RongIMKit.h>
#import "IMViewController.h"
#import <RongIMKit/RCConversationViewController.h>
#import "IMDetailViewController.h"
#import "PwLoginViewController.h"

@interface FinanceDetailOneViewController (){

    UIScrollView *_scrollView;
    UIImageView *_iconView;
    UILabel *_nameLabel;
    UILabel *_biaoqianLabel;
    UILabel *_tqhkLabel;
    UIView *_sqtjView;
    UILabel *_sqtjLabel;
    UIView *_clView;
    UILabel *_clLabel;
    UILabel *_rateLabel;
    UIView *_downView;
    NSMutableDictionary *_dic;
    UILabel *_tiaozLabel;
    
}

@property (nonatomic,strong)NSString *dyStr;
@property (nonatomic,strong)NSString *sfStr;
@property (nonatomic,strong)NSString *fdStr;

@end

@implementation FinanceDetailOneViewController

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
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64)];
//    _scrollView.contentSize = CGSizeMake(screenWidth, 1500);
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
            _tqhkLabel.text = [NSString stringWithFormat:@"%@",_dic[@"tqhk"]];
            _tiaozLabel.text = [NSString stringWithFormat:@"%@",_dic[@"llsm"]];
            
            if ([_dic[@"dytype"] isEqualToString:@""]) {
                
                self.dyStr = @"无抵押";
            }else{
            
                self.dyStr = _dic[@"dytype"];
            }
         
            if ([_dic[@"user"] isEqualToString:@""]) {
                
                self.sfStr = @"无身份限制";
            }else{
                
                self.sfStr = _dic[@"user"];
            }

                self.fdStr = _dic[@"fkqx"];

            _biaoqianLabel.text = [NSString stringWithFormat:@"%@ %@ %@",self.dyStr,self.sfStr,self.fdStr];
            
               CGFloat LblW = screenWidth-20*screenScale-Margin;
            
            _sqtjLabel.text = [NSString stringWithFormat:@"%@",_dic[@"sqtj"]];
            CGFloat sqtjLblH = [CaculateLabelHeight getSpaceLabelHeight:_sqtjLabel.text withWidth:LblW andFont:12.0 andLines:4.0];
            _sqtjLabel.frame = CGRectMake(20*screenScale, 39, LblW, sqtjLblH);
            _sqtjView.frame = CGRectMake(0,90+8+84*screenScale, screenWidth, 52+sqtjLblH);
            
            _clLabel.text = [NSString stringWithFormat:@"%@",_dic[@"sxcl"]];
            CGFloat clLblH = [CaculateLabelHeight getSpaceLabelHeight:_clLabel.text withWidth:LblW andFont:12.0 andLines:4.0];
            _clLabel.frame = CGRectMake(20*screenScale, 39, LblW, clLblH);
            _clView.frame = CGRectMake(0,1+CGRectGetMaxY(_sqtjView.frame), screenWidth, 52+clLblH);
            
            _downView.frame = CGRectMake(0, 1+CGRectGetMaxY(_clView.frame), screenWidth, 47*screenScale+56);
            
            NSMutableAttributedString *renewAttributed = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"贷款利率：%@/月",_dic[@"ylv"]]];
            [renewAttributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.0] range:NSMakeRange(0, 5)];
            [renewAttributed addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#000000"] range:NSMakeRange(0, 5)];
            
            [renewAttributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18.0] range:NSMakeRange(5, [_dic[@"ylv"] length])];
            [renewAttributed addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#F6A623"] range:NSMakeRange(5, [_dic[@"ylv"] length])];
            
            [renewAttributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.0] range:NSMakeRange(5+[_dic[@"ylv"] length], 2)];
            [renewAttributed addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#000000"] range:NSMakeRange(5+[_dic[@"ylv"] length], 2)];
            
            _rateLabel.attributedText = renewAttributed;
        }
        
        
        _scrollView.contentSize = CGSizeMake(screenWidth, 140+CGRectGetMaxY(_downView.frame));
     
    } failure:^(NSString *error) {
       
        
        
    }];
        
        
}

- (void)createUI{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 84*screenScale)];
    headView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:headView];
   
    _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130*screenScale, 62*screenScale)];
    _iconView.center = headView.center;
    [headView addSubview:_iconView];
    
    UIView *midView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 7+CGRectGetMaxY(headView.frame), screenWidth, 90)];
    midView1.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:midView1];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(19*screenScale, 13, screenWidth-19*screenScale-Margin, 20)];
    _nameLabel.font = [UIFont systemFontOfSize:15.0];
    [midView1 addSubview:_nameLabel];
    
    _biaoqianLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame), 3+CGRectGetMaxY(_nameLabel.frame), CGRectGetWidth(_nameLabel.frame), 14)];
    _biaoqianLabel.font = [UIFont systemFontOfSize:10.0];
    _biaoqianLabel.textColor = [UIColor colorWithHexString:@"#F6A623"];
    [midView1 addSubview:_biaoqianLabel];
    
    UILabel *tiqianLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame)-6, 8+CGRectGetMaxY(_biaoqianLabel.frame), 100, 17)];
    tiqianLabel.text = @"【提前还款说明】";
    tiqianLabel.font = [UIFont boldSystemFontOfSize:12.0];
    [midView1 addSubview:tiqianLabel];
    
    _tqhkLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(tiqianLabel.frame), CGRectGetMinY(tiqianLabel.frame), screenWidth-CGRectGetMaxX(tiqianLabel.frame)-Margin, CGRectGetHeight(tiqianLabel.frame))];
    _tqhkLabel.font = [UIFont systemFontOfSize:12.0];
    [midView1 addSubview:_tqhkLabel];
    
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
  
//    所需材料
    _clView = [[UIView alloc]init];
    _clView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_clView];
    
    UILabel *clLbl = [[UILabel alloc]initWithFrame:CGRectMake(20*screenScale, 13, 150, 20)];
    clLbl.text = @"所需材料";
    clLbl.font = [UIFont systemFontOfSize:15.0];
    [_clView addSubview:clLbl];
    
    _clLabel = [[UILabel alloc]init];
    _clLabel.numberOfLines = 0;
    _clLabel.font = [UIFont systemFontOfSize:12.0];
    _clLabel.textColor = TEXT_SUMMARY_COLOR;
    [_clView addSubview:_clLabel];
    
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
    
//    放在window层上
    UIView *downLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, screenHeight-52, 477/2.0*screenScale, 52)];
    downLeftView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:downLeftView];
    
    _rateLabel = [[UILabel alloc]initWithFrame:CGRectMake(19*screenScale, 3, 477/2.0*screenScale-19*screenScale-2, 24)];
    _rateLabel.font = [UIFont systemFontOfSize:14.0];
    [downLeftView addSubview:_rateLabel];
    
    _tiaozLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_rateLabel.frame), 2+CGRectGetMaxY(_rateLabel.frame)+2, CGRectGetWidth(_rateLabel.frame), 16)];
    _tiaozLabel.text = @"根据企业具体情况，利率会有所调整";
    _tiaozLabel.font = [UIFont systemFontOfSize:12.0];
    [downLeftView addSubview:_tiaozLabel];
    
//    申请按钮
    UIButton *applyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    applyBtn.frame = CGRectMake(477/2.0*screenScale, screenHeight-53, screenWidth-477/2.0*screenScale, 53);
    applyBtn.backgroundColor = [UIColor colorWithHexString:@"#F6A623"];
    [applyBtn setTitle:@"立即申请" forState:UIControlStateNormal];
    applyBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [applyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [applyBtn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:applyBtn];
    
//    在线咨询
    UIButton *askBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    askBtn.frame = CGRectMake(screenWidth-97*screenScale, screenHeight-53-24-32*screenScale, 97*screenScale, 32*screenScale);
    [askBtn setBackgroundImage:[UIImage imageNamed:@"在线咨询"] forState:UIControlStateNormal];
    [askBtn addTarget:self action:@selector(IMBtnClick2) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:askBtn];
}

#pragma mark - 点击事件
- (void)IMBtnClick2{
    
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



- (void)buttonClick{

    FinanceapplyViewController *vc = [[FinanceapplyViewController alloc]init];
    vc.iconImg = [NSString stringWithFormat:@"%@",_dic[@"cpLogo"]];
    vc.name = [NSString stringWithFormat:@"%@—%@",_dic[@"corpName"],_dic[@"name"]];
    vc.rate = [NSString stringWithFormat:@"%@",_dic[@"ylv"]];
    vc.moneyMax = [NSString stringWithFormat:@"%@",_dic[@"moneyMax"]];
    vc.moneyMin = [NSString stringWithFormat:@"%@",_dic[@"moneyMin"]];
    vc.periodMax = [NSString stringWithFormat:@"%@",_dic[@"periodMax"]];
    vc.periodMin = [NSString stringWithFormat:@"%@",_dic[@"periodMin"]];
    vc.fid = self.fid;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
