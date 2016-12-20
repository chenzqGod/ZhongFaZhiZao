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

@interface KnowLedgeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation KnowLedgeViewController


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];

    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = BACK_COLOR;
    
    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"知识产权专利"];
    navView.viewController = self;
    [self.view addSubview:navView];
    
    [self createHeader];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.backgroundColor = BACK_COLOR;
    
    [self.view addSubview:self.tableView];
    
}

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
            
//            UILabel *buttonLbl = [[UILabel alloc]init];
//            buttonLbl.frame = CGRectMake(i*1+(screenWidth-2)/3.0*i, 1*j+45*j, (screenWidth-2)/3.0, 45);
//            buttonLbl.backgroundColor = [UIColor cyanColor];
//            [buttonView addSubview:buttonLbl];
//            
//            UIImageView *buttonIcon = [[UILabel alloc]initWithFrame:CGRectMake(20*screenScale, (45-26)/2.0, 26, 26)];
//            buttonIcon.backgroundColor = [UIColor redColor];
//            [buttonLbl addSubview:buttonIcon];
            
//            UILabel *btnSumLabel = [[UILabel alloc]initWithFrame:CGRectMake(12*screenScale+CGRectGetMaxX(buttonIcon.frame), (90-16)/2.0, 62, 16)];
//            btnSumLabel.text = @"数据库定制";
//            btnSumLabel.font = [UIFont systemFontOfSize:12.0];
//            [buttonLbl addSubview:buttonLbl];
            
            CustomButton *button = [CustomButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i*1+(screenWidth-2)/3.0*i, 1*j+45*j, (screenWidth-2)/3.0, 45);
            button.backgroundColor = [UIColor whiteColor];
            [button setTitle:btnNameArr[j][i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:12.0];
            [button setImage:[UIImage imageNamed:btniconArr[j][i]] forState:UIControlStateNormal];
            
            button.imageRect = CGRectMake(16*screenScale, (45-26)/2.0, 26, 26);
            button.titleRect = CGRectMake(8*screenScale+16*screenScale+26, (45-16)/2.0, 62, 16);
            
            [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
            [buttonView addSubview:button];
            
        }
        
  
    }
    
    
    
}


#pragma mark - 点击事件
- (void)buttonClick{

    CommitKnowledgeViewController *vc = [[CommitKnowledgeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - datasource

//有多少个分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

//每一个分组cell的个数，分组中某一行的cell叫做row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 4;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
        static NSString *hotCellID = @"hotCellID";
        KnowLedgeTableViewCell *hotCell = [tableView dequeueReusableCellWithIdentifier:hotCellID];
        
        if (!hotCell) {
            hotCell = [[KnowLedgeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:hotCellID];
            //            hotCell.backgroundColor = [UIColor cyanColor];
            hotCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
//        [hotCell setcellModel:_modelDic2.items[indexPath.row]];
//    hotCell.textLabel.text = @"123456";
    
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
    
    
    
  
}

//- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
//
//}

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
