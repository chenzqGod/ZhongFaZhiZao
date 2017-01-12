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
    
    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"金融服务"];
    navView.viewController = self;
    [self.view addSubview:navView];
    
    [self createHeadView];
    [self createTableView];
    
    
}

- (void)loadData{
    
    
//    创新金融
    [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,FINANCE_INNOVATE] parameters:nil success:^(id response) {
        
        if ([response[@"resultCode"]integerValue] == 1000) {
            
            _dataArr1 = [response[@"data"][@"goodList"]mutableCopy];
            
            
            [_tableView reloadData];
        }
        
        
    } failure:^(NSString *error) {
        
        
    }];
    
    
//    供应链金融
    [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,FINANCE_SUPPLY] parameters:nil success:^(id response) {
        
        if ([response[@"resultCode"]integerValue] == 1000) {
            
            _dataArr2 = [response[@"data"][@"goodList"]mutableCopy];
            
            [_tableView reloadData];
        }
        

        
    } failure:^(NSString *error) {
        
        
    }];
    
    
//    小额贷金融
    [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,FINANCE_LOAN] parameters:nil success:^(id response) {
        
        
        if ([response[@"resultCode"]integerValue] == 1000) {
            
            _dataArr3 = [response[@"data"][@"goodList"]mutableCopy];
            
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
        _titleBtn.frame = CGRectMake((screenWidth-92*screenScale*3)/4.0*(i+1)+92*i*screenScale, CGRectGetMaxY(_mainImgView.frame)+14*screenScale, 92*screenScale, 25*screenScale);
        _titleBtn.layer.masksToBounds = YES;
        _titleBtn.layer.cornerRadius = 10;
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
    
    [self.view addSubview:_tableView];
}

#pragma mark - datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    

    
    if (self.cityNumber == 0) {
        
        NSString *cellID = @"cell1";
        InnovateTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell1) {
            
            
            cell1 = [[InnovateTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        return cell1;
    }
    
    NSString *cellID2 = @"cell2";
    SupplyTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellID2];
    
    if (!cellID2) {
        
        cell2 = [[SupplyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID2];
    }
    
    return cell2;
    
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
