//
//  FinanceViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/1/9.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "FinanceViewController.h"

@interface FinanceViewController ()<UITableViewDelegate,UITableViewDataSource>{

    
    UITableView *_tableView;
    UIView *_headerView;
    UIImageView *_mainImgView;
    UIButton *_titleBtn;
}

@end

@implementation FinanceViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
    [self.tabBarController.tabBar setHidden:YES];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = BACK_COLOR;
    
    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andtitle:@"金融服务"];
    navView.viewController = self;
    [self.view addSubview:navView];
    
    [self createHeadView];
    
    
    
}

- (void)createHeadView{

    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, 143*screenScale+53)];
    
    _headerView.backgroundColor = BACK_COLOR;
//    [self.view addSubview:_headerView];
    
    _mainImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 143*screenScale)];
    
    _mainImgView.backgroundColor = [UIColor cyanColor];
    [_headerView addSubview:_mainImgView];
    
    
    for (int i = 0; i < 3; i++) {
        _titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _titleBtn.frame = CGRectMake((screenWidth-92)/4.0, CGRectGetMaxY(_mainImgView.frame)+14, 92, 25);
        _titleBtn.layer.masksToBounds = YES;
        _titleBtn.layer.cornerRadius = 10;
        _titleBtn.tag = 180000+i;
        [_headerView addSubview:_titleBtn];
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

    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
