//
//  FinanceViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/1/9.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "FinanceViewController.h"
#import "InnovateTableViewCell.h"
#import "SupplyTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "FinanceDetailOneViewController.h"
#import "FinanceDetailTwoViewController.h"

@interface FinanceViewController ()<UITableViewDelegate,UITableViewDataSource>{

    
    UITableView *_tableView;
    UIView *_headerView;
    UIImageView *_mainImgView;
    UIButton *_titleBtn;
    
    NSMutableArray *_dataArr1;
    NSMutableArray *_dataArr2;
    NSMutableArray *_dataArr3;
}

@property (nonatomic,assign)NSInteger cityNumber;
@property (nonatomic,assign)NSInteger pageIndex;

@end

@implementation FinanceViewController


- (NSMutableArray *)dataArr1{

    if (!_dataArr1) {
        _dataArr1 = [NSMutableArray array];
    }

    return _dataArr1;
}

- (NSMutableArray *)dataArr2{
    
    if (!_dataArr2) {
        _dataArr2 = [NSMutableArray array];
    }
    
    return _dataArr2;
}

- (NSMutableArray *)dataArr3{
    
    if (!_dataArr3) {
        _dataArr3 = [NSMutableArray array];
    }
    
    return _dataArr3;
}


- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
    [self.tabBarController.tabBar setHidden:YES];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = BACK_COLOR;
    
    self.cityNumber = 0;
    self.pageIndex = 1;

    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"金融服务"];
    navView.viewController = self;
    [self.view addSubview:navView];
    
    [self createHeadView];
    [self createTableView];
    
    [self loadData];
    
    
}

- (void)loadData{
    
    NSDictionary *parameters = @{@"pageIndex":[NSNumber numberWithInteger:self.pageIndex]};
//    创新金融
    [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,FINANCE_INNOVATE] parameters:parameters success:^(id response) {
        
        if ([response[@"resultCode"]integerValue] == 1000) {
            
            
            if (self.pageIndex == 1) {
                [_dataArr1 removeAllObjects];
                _dataArr1 = [response[@"data"][@"goodList"]mutableCopy];
            }else{
            
//                if ([response[@"data"][@"goodList"] count] == 0) {
//                    
////                    [_tableView.footer endRefreshing];
////                    
////                    _tableView.footer.state = MJRefreshStateNoMoreData;
//                    
//                    return ;
//                }
                
//                [_tableView.footer endRefreshing];
            [_dataArr1 addObjectsFromArray:response[@"data"][@"goodList"]];
            }
            
            [_tableView reloadData];
        }
        
        
    } failure:^(NSString *error) {
        
        [WKProgressHUD popMessage:@"请检查网络连接" inView:self.view duration:HUD_DURATION animated:YES];
    }];
    
    
//    供应链金融
    [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,FINANCE_SUPPLY] parameters:parameters success:^(id response) {
        
        if ([response[@"resultCode"]integerValue] == 1000) {
            
            if (self.pageIndex == 1) {
                
                [_dataArr2 removeAllObjects];
                _dataArr2 = [response[@"data"][@"goodList"]mutableCopy];
                
            }else{
            
//                if ([response[@"data"][@"goodList"] count] == 0) {
//                    
////                    [_tableView.footer endRefreshing];
////                    
////                    _tableView.footer.state = MJRefreshStateNoMoreData;
//                    
//                    return ;
//                }
                
//                [_tableView.footer endRefreshing];
                [_dataArr2 addObjectsFromArray:response[@"data"][@"goodList"]];
            }
            
            
            [_tableView reloadData];
        }
        

        
    } failure:^(NSString *error) {
        
        
    }];
    
    
//    小额贷金融
    [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,FINANCE_LOAN] parameters:parameters success:^(id response) {
        
        
        if ([response[@"resultCode"]integerValue] == 1000) {
            
            if (self.pageIndex == 1) {
                
                [_dataArr3 removeAllObjects];
                _dataArr3 = [response[@"data"][@"goodList"]mutableCopy];
            }else{
                
//                if ([response[@"data"][@"goodList"] count] == 0) {
//                    
////                    [_tableView.footer endRefreshing];
////                    
////                    _tableView.footer.state = MJRefreshStateNoMoreData;
//                    
//                    return ;
//                }
            
//                [_tableView.footer endRefreshing];
                [_dataArr3 addObjectsFromArray:response[@"data"][@"goodList"]];
            }
            
            
            [_tableView reloadData];
        }
        

        
    } failure:^(NSString *error) {
        
        
    }];
}

- (void)createHeadView{

    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, 143*screenScale+53)];
    _headerView.userInteractionEnabled = YES;
    _headerView.backgroundColor = BACK_COLOR;
//    [self.view addSubview:_headerView];
    
    _mainImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 143*screenScale)];
    
    _mainImgView.image = [UIImage imageNamed:@"jinrongmain"];
    [_headerView addSubview:_mainImgView];
    
    NSArray *btntitle = @[@"创新金融",@"供应链金融",@"小额贷"];
    
    for (int i = 0; i < 3; i++) {
        _titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _titleBtn.frame = CGRectMake((screenWidth-92*screenScale*3)/4.0*(i+1)+92*i*screenScale,(52-25*screenScale)/2.0+CGRectGetMaxY(_mainImgView.frame), 92*screenScale, 25*screenScale);
        _titleBtn.layer.masksToBounds = YES;
        _titleBtn.layer.cornerRadius = 12;
        [_titleBtn setTitle:btntitle[i] forState:UIControlStateNormal];
        [_titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_titleBtn setTitleColor:TEXT_GREY_COLOR forState:UIControlStateNormal];

        _titleBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        _titleBtn.tag = 180000+i;
        [_titleBtn addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:_titleBtn];
        
        if (i == self.cityNumber ) {
            
            _titleBtn.backgroundColor = BLUE_COLOR;
            _titleBtn.selected = YES;
            _titleBtn.layer.borderWidth = 0;
            _titleBtn.layer.borderColor = TEXT_LINE_COLOR.CGColor;
            
        }else{
            
            _titleBtn.backgroundColor = [UIColor whiteColor];
            _titleBtn.layer.borderWidth = 1;
            _titleBtn.layer.borderColor = TEXT_LINE_COLOR.CGColor;
        }

    }
    
}

- (void)createTableView{

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.tableHeaderView = _headerView;
    _tableView.tableFooterView = [[UIView alloc]init];
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    //    下拉刷新、上拉加载
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        [_tableView.footer resetNoMoreData];
        self.pageIndex = 1;
        [self loadData];
        
        [_tableView.header endRefreshing];
        
    }];
    
    _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        [_tableView.footer resetNoMoreData];
        self.pageIndex++;
        [self loadData];
        
        [_tableView.footer endRefreshing];
        [_tableView.footer noticeNoMoreData];
        
    }];

    
    
    
    [self.view addSubview:_tableView];
    
    
    
}

#pragma mark - datasource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    
    if (self.cityNumber == 0) {
        return _dataArr1.count;

    }else if (self.cityNumber == 1){
        return _dataArr2.count;
    }
    else if (self.cityNumber == 2){
    
        return _dataArr3.count;
    }
    
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (self.cityNumber == 0) {
    
        NSString *cellID = @"cell1";
        InnovateTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell1) {
            
            
            cell1 = [[InnovateTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
    
    [cell1.iconImgView sd_setImageWithURL:[NSURL URLWithString:[[_dataArr1 objectAtIndex:indexPath.row]objectForKey:@"logo"]] placeholderImage:[UIImage imageNamed:@"占位图200-188"]];
    cell1.titleLabel.text = [NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row]objectForKey:@"name"]];
    cell1.recommondLabel.text = [NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row]objectForKey:@"recommend"]];
    cell1.suumaryLabel.text = [NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row]objectForKey:@"summary"]];
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    
        if ([[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"] count] == 1) {
            
            cell1.FirstImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"][0]]];
        }
        
        else if ([[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"] count] == 2){
        
            cell1.FirstImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"][0]]];
            
            cell1.SecondImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"][1]]];
            
        }
        else if ([[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"] count] >= 3){
        
            cell1.FirstImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"][0]]];
            
            cell1.SecondImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"][1]]];
            
            cell1.ThirdImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"][2]]];
            
        }
        
        
        
        return cell1;
    }

    else if (self.cityNumber == 1){
    
    NSString *cellID2 = @"cell2";
    SupplyTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellID2];
    
    if (!cell2) {
        
        cell2 = [[SupplyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID2];
    }
    [cell2.iconImgView sd_setImageWithURL:[NSURL URLWithString:[[_dataArr2 objectAtIndex:indexPath.row]objectForKey:@"logo"]] placeholderImage:[UIImage imageNamed:@"占位图200-188"]];
    cell2.titleLabel.text = [NSString stringWithFormat:@"%@",[[_dataArr2 objectAtIndex:indexPath.row]objectForKey:@"name"]];
    cell2.recommondLabel.text = [NSString stringWithFormat:@"%@",[[_dataArr2 objectAtIndex:indexPath.row]objectForKey:@"recommend"]];
    cell2.moneyLabel.text = [NSString stringWithFormat:@"%@",[[_dataArr2 objectAtIndex:indexPath.row]objectForKey:@"moneyScope"]];
    cell2.timeLabel.text = [NSString stringWithFormat:@"%@",[[_dataArr2 objectAtIndex:indexPath.row]objectForKey:@"timeScope"]];
    cell2.rateLabel.text = [NSString stringWithFormat:@"%@",[[_dataArr2 objectAtIndex:indexPath.row]objectForKey:@"moneyRate"]];

    
    cell2.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell2;
}
    else if (self.cityNumber == 2){
        
        NSString *cellID3 = @"cell3";
        SupplyTableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:cellID3];
        
        if (!cell3) {
            
            cell3 = [[SupplyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID3];
        }
        [cell3.iconImgView sd_setImageWithURL:[NSURL URLWithString:[[_dataArr3 objectAtIndex:indexPath.row]objectForKey:@"logo"]] placeholderImage:[UIImage imageNamed:@"占位图200-188"]];
        cell3.titleLabel.text = [NSString stringWithFormat:@"%@",[[_dataArr3 objectAtIndex:indexPath.row]objectForKey:@"name"]];
        cell3.recommondLabel.text = [NSString stringWithFormat:@"%@",[[_dataArr3 objectAtIndex:indexPath.row]objectForKey:@"recommend"]];
        cell3.moneyLabel.text = [NSString stringWithFormat:@"%@",[[_dataArr3 objectAtIndex:indexPath.row]objectForKey:@"moneyScope"]];
        cell3.timeLabel.text = [NSString stringWithFormat:@"%@",[[_dataArr3 objectAtIndex:indexPath.row]objectForKey:@"timeScope"]];
        cell3.rateLabel.text = [NSString stringWithFormat:@"%@",[[_dataArr3 objectAtIndex:indexPath.row]objectForKey:@"moneyRate"]];
        
        
        cell3.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell3;
    }
    
    
    return nil;
    

}

#pragma mark - delegate
//返回cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 101;
    
}

//返回页头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0;
}



//cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.cityNumber == 0) {
        
        
    
        FinanceDetailTwoViewController *vc = [[FinanceDetailTwoViewController alloc]init];
        vc.fid = [[_dataArr1 objectAtIndex:indexPath.row]objectForKey:@"id"];
        
        if ([[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"] count] == 1) {
            
            vc.firstStr = [NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"][0]];
        }
        
        else if ([[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"] count] == 2){
            
            vc.firstStr = [NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"][0]];
            
            vc.secondStr = [NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"][1]];
            
                 }
        else if ([[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"] count] >= 3){
            
            vc.firstStr = [NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"][0]];
            
            vc.secondStr = [NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"][1]];

            vc.thirdStr = [NSString stringWithFormat:@"%@",[[_dataArr1 objectAtIndex:indexPath.row] objectForKey:@"advantage"][2]];
            
        }
        else{
        
            
            vc.firstStr = @"unfull";
            vc.secondStr = @"unfull";
            vc.thirdStr = @"unfull";
        }

        
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }
    else if (self.cityNumber == 1){
    
        FinanceDetailOneViewController *vc = [[FinanceDetailOneViewController alloc]init];
        vc.fid = [[_dataArr2 objectAtIndex:indexPath.row]objectForKey:@"id"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (self.cityNumber == 2){
    
        FinanceDetailOneViewController *vc = [[FinanceDetailOneViewController alloc]init];
        vc.fid = [[_dataArr3 objectAtIndex:indexPath.row]objectForKey:@"id"];
        [self.navigationController pushViewController:vc animated:YES];

    }
    
}



#pragma mark - 按钮点击事件
- (void)buttonclick:(UIButton *)button{

    self.cityNumber = (NSInteger)button.tag-180000;
    
    [self loadData];
    
    for(int i = 0 ; i < 3 ;i ++) {
        
        UIButton *btn = (UIButton *)[self.view viewWithTag:i + 180000];
        if(button.tag == btn.tag) {
            
            [btn setBackgroundColor:BLUE_COLOR];
            btn.layer.borderWidth = 0;
            btn.selected = YES;
        }else {
            
            [btn setBackgroundColor:[UIColor whiteColor]];
            btn.layer.borderWidth = 1;
            btn.selected = NO;
        }
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
