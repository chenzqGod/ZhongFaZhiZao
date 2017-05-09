//
//  KnowLedgeViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/17.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "KnowLedgeViewController.h"
#import "KnowLedgeTableViewCell.h"
#import "CommitKnowledgeViewController.h"
#import "UIImageView+WebCache.h"
#import "WKWebViewViewController.h"
#import <RongIMKit/RongIMKit.h>
#import "IMViewController.h"
#import <RongIMKit/RCConversationViewController.h>
#import "IMDetailViewController.h"
#import "PwLoginViewController.h"
#import "WKProgressHUD.h"

@interface KnowLedgeViewController ()<UITableViewDelegate,UITableViewDataSource,RCIMUserInfoDataSource>{

    NSMutableArray *_dataArray;
    
    NSString *_rongNameStr;
    NSMutableArray *_rongNameArr;
}

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) int flag;

@end

@implementation KnowLedgeViewController


- (NSMutableArray *)rongNameArr{

    
    if (!_rongNameArr) {
        
        _rongNameArr = [NSMutableArray array];
    }
    
    return _rongNameArr;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];

    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    [self.tabBarController.tabBar setHidden:YES];
    
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataArray = [[NSMutableArray alloc]init];
    
    self.flag = 0;
    
    self.view.backgroundColor = BACK_COLOR;
    
    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"知识产权专利"];
    navView.viewController = self;
    [self.view addSubview:navView];
    
     [self loadData];
    
    [self createHeader];
    
    self.pageIndex = 1;
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.backgroundColor = BACK_COLOR;
    
    
//    下拉刷新、上拉加载
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        [_tableView.footer resetNoMoreData];
        self.pageIndex = 1;
        [self loadData];
        
        [_tableView.header endRefreshing];

    }];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        [_tableView.footer resetNoMoreData];
        self.pageIndex++;
        [self loadData];

        [_tableView.footer endRefreshing];
        
        
    }];

    
    [self.view addSubview:self.tableView];
    
}

#pragma mark - loadData
- (void)loadData{
    
    
//    NSDictionary *parameters = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInteger:self.pageIndex],@"pageIndex", nil];
    
    NSDictionary *parameters = @{@"pageIndex":[NSNumber numberWithInteger:self.pageIndex]};
    
    [[NSNetworking sharedManager]get:[NSString stringWithFormat:@"%@%@",HOST_URL,PATENT_LIST] parameters:parameters success:^(id response) {
        
        if ([response[@"resultCode"]integerValue] == 1000) {
        

            if (self.pageIndex == 1) {
                [_dataArray removeAllObjects];
                _dataArray = [response[@"data"][@"goodList"] mutableCopy];
            }else{
                
                if ([response[@"data"][@"goodList"] count] == 0) {
                    
                    [_tableView.footer endRefreshing];
                    
//                    效果等同
//                    _tableView.footer.state = MJRefreshStateNoMoreData;
                    
                    [_tableView.footer noticeNoMoreData];
                    
                    return ;
                }
                
                [_tableView.footer endRefreshing];
                
                [_dataArray addObjectsFromArray:response[@"data"][@"goodList"]];
            }
            
            [self.tableView reloadData];
            
            NSLog(@"count = %lu",(unsigned long)_dataArray.count);
        }
        else if ([response[@"resultCode"]integerValue] == 1001){
        
            NSLog(@"知识产权页面请求失败");
        
            
        }
        
    } failure:^(NSString *error) {
        
        NSLog(@"%@",error);
       
        [WKProgressHUD popMessage:@"请检查网络连接" inView:self.view duration:HUD_DURATION animated:YES];
        
    }];
    
}


#pragma mark - createUI
- (void)createHeader{
    
    NSArray *btnNameArr = @[@[@"专利申请",@"专利挖掘",@"无效请求"],@[@"专利维权",@"专利培训",@"专利预警"],@[@"专利分析",@"专利交易",@"数据库定制"]];
    NSArray *btniconArr = @[@[@"申请icon",@"挖掘icon",@"icon2"],@[@"Group 15",@"icon",@"预警icon"],@[@"分析icon",@"交易icon",@"数据库icon"]];

    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenWidth/375.0*145+46*3+51)];
    self.headerView.backgroundColor = BACK_COLOR;
    [self.view addSubview:self.headerView];
    
    UIImageView *mainImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenWidth/375.0*145)];
    mainImg.image = [UIImage imageNamed:@"banner2"];
    [self.headerView addSubview:mainImg];
    
    UIView *cellHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(mainImg.frame), screenWidth, 51)];
    cellHeadView.backgroundColor = BACK_COLOR;
    [self.headerView addSubview:cellHeadView];
    
    UILabel *leftcellHeadLabel = [[UILabel alloc]initWithFrame:CGRectMake(Margin, 25, (screenWidth-72)/2.0-Margin*2, 1)];
    leftcellHeadLabel.backgroundColor = [UIColor colorWithHexString:@"#979797"];
    [cellHeadView addSubview:leftcellHeadLabel];
    
    UILabel *rightcellHeadLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenWidth - Margin -CGRectGetWidth(leftcellHeadLabel.frame), 25, (screenWidth-72)/2.0-Margin*2, 1)];
    rightcellHeadLabel.backgroundColor = [UIColor colorWithHexString:@"#979797"];
    [cellHeadView addSubview:rightcellHeadLabel];
    
    UILabel *cellTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenWidth/2.0-36, (51-16.5)/2, 72, 16.5)];
    cellTitleLabel.text = @"基础服务";
    cellTitleLabel.font = [UIFont systemFontOfSize:12.0];
    cellTitleLabel.textAlignment = NSTextAlignmentCenter;
    [cellHeadView addSubview:cellTitleLabel];
    
    UIView *buttonView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(cellHeadView.frame), screenWidth, 46*3)];
    buttonView.backgroundColor = BACK_COLOR;
    [self.headerView addSubview:buttonView];
    
    for (NSInteger i = 0; i < 3; i++) {
        
        for (NSInteger j = 0; j < 3; j++) {
            
            CustomButton *button = [CustomButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i*1+(screenWidth-2)/3.0*i, 1*j+45*j, (screenWidth-2)/3.0, 45);
            button.backgroundColor = [UIColor whiteColor];
            [button setTitle:btnNameArr[j][i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:12.0];
            [button setImage:[UIImage imageNamed:btniconArr[j][i]] forState:UIControlStateNormal];
            
            button.imageRect = CGRectMake(16*screenScale, (45-26)/2.0, 26, 26);
            button.titleRect = CGRectMake(8*screenScale+16*screenScale+26, (45-16)/2.0, 62, 16);
            button.tag = 50000+self.flag;
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [buttonView addSubview:button];
            
            self.flag++;
        }
        
    }
    
}


#pragma mark - 点击事件
- (void)buttonClick:(UIButton *)button{

    
    NSArray *typeID = @[@"80004010",@"80004040",@"80004070",@"80004020",@"80004050",@"80004080",@"80004030",@"80004060",@"80004090"];
    CommitKnowledgeViewController *vc = [[CommitKnowledgeViewController alloc]init];
    vc.typeId = typeID[button.tag-50000];
    
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - datasource

//有多少个分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

//每一个分组cell的个数，分组中某一行的cell叫做row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return _dataArray.count>20?20:_dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    static NSString *hotCellID = @"hotCellID";
    KnowLedgeTableViewCell *hotCell = [tableView dequeueReusableCellWithIdentifier:hotCellID];
    
    if (!hotCell) {
        hotCell = [[KnowLedgeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:hotCellID];
    }
    

    
    CustomButton *button = [CustomButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(screenWidth-16-60, 101-19-14, 60, 14);
    
    button.imageRect = CGRectMake(0, 1.25, 13, 11.5);
    button.titleRect = CGRectMake(13+3, 0, 44, 14);
    [button setTitle:@"在线咨询" forState:UIControlStateNormal];
    [button setTitleColor:BLUE_COLOR forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:10.0];
    [button setImage:[UIImage imageNamed:@"chat"] forState:UIControlStateNormal];
    
    button.tag = indexPath.row + 500000;
    
    [button addTarget:self action:@selector(IMbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [hotCell addSubview:button];
    
    hotCell.selectionStyle = UITableViewCellSelectionStyleNone;

    hotCell.sumLabel.text = [[_dataArray objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    
    
    hotCell.priceLabel.text = [NSString stringWithFormat:@"¥%.1f",[[[_dataArray objectAtIndex:indexPath.row] objectForKey:@"price"] floatValue]];
    
    if ([[[_dataArray objectAtIndex:indexPath.row ]objectForKey:@"price"]floatValue] == 0) {
        
        hotCell.priceLabel.text = @"面议";
    }
    
    [hotCell.iconImageView sd_setImageWithURL:[NSURL URLWithString:[[_dataArray objectAtIndex:indexPath.row] objectForKey:@"imgpath"]] placeholderImage:[UIImage imageNamed:@"占位图200-188"]];
    
    
    
        return hotCell;
}


#pragma mark - delegate
//返回cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 101;
    
}

//返回页头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
      return 51;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0;
}



//cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[[_dataArray objectAtIndex:indexPath.row] objectForKey:@"url"] title:@"url"];
    [self.navigationController pushViewController:vc animated:YES];
  
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

        UIView *cellHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 51)];
        cellHeadView.backgroundColor = BACK_COLOR;
        [self.headerView addSubview:cellHeadView];
    
        UILabel *leftcellHeadLabel = [[UILabel alloc]initWithFrame:CGRectMake(Margin, 25, (screenWidth-76)/2.0-Margin*2, 1)];
        leftcellHeadLabel.backgroundColor = [UIColor colorWithHexString:@"#979797"];
        [cellHeadView addSubview:leftcellHeadLabel];
    
        UILabel *rightcellHeadLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenWidth - Margin -CGRectGetWidth(leftcellHeadLabel.frame), 25, (screenWidth-76)/2.0-Margin*2, 1)];
        rightcellHeadLabel.backgroundColor = [UIColor colorWithHexString:@"#979797"];
        [cellHeadView addSubview:rightcellHeadLabel];
    
        UILabel *cellTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenWidth/2.0-38, (51-16.5)/2, 76, 16.5)];
        cellTitleLabel.text = @"知识产权交易";
        cellTitleLabel.font = [UIFont systemFontOfSize:12.0];
        cellTitleLabel.textAlignment = NSTextAlignmentCenter;
        [cellHeadView addSubview:cellTitleLabel];
        
    return cellHeadView;
}


//去除粘性效果
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == _tableView) {
        CGFloat sectionHeaderHeight = 51;
        
        if (scrollView.contentOffset.y<=sectionHeaderHeight && scrollView.contentOffset.y>0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        }
        
        
        else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
            
        }
        
    }
    
}


- (void)IMbtnClick:(UIButton *)button{
    
    
    if ([USER_DEFAULTS objectForKey:@"token"] == nil) {
        
        PwLoginViewController *vc = [[PwLoginViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{
    
        if ([USER_DEFAULTS objectForKey:@"rongtoken"] == nil) {
            
            [self getRongToken];
        }
        
        IMDetailViewController *chatViewController = [[IMDetailViewController alloc]init];
        chatViewController.targetId = [NSString stringWithFormat:@"%@",_dataArray[button.tag-500000][@"shopId"]];

        
        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@/corp/%@/getCorpName",HOST_URL,_dataArray[button.tag-500000][@"shopId"]] parameters:nil success:^(id response) {
            
            if ([response[@"state"]isEqualToString:@"Y"]) {
                
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
