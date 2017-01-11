//
//  SearchViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/16.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) NSMutableArray *searchArray;

@end

@implementation SearchViewController

-(NSMutableArray *)searchArray
{
    if (_searchArray == nil) {
        _searchArray = [NSMutableArray array];
    }
    return _searchArray;
}


- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
    [self.tabBarController.tabBar setHidden:YES];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createNavgationView];
    
    [self createHistory];
}

#pragma mark - 加载数据
- (void)loadhotData{

//热搜
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    [[NSNetworking sharedManager]get:[NSString stringWithFormat:@"%@%@",HOST_URL,COMMUNITY_HOT_SEARCH] parameters:nil success:^(id response) {
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        for (NSDictionary *dict in response[@"items"]) {
//            [self.hotSearchArray addObject:@{@"content_name":dict[@"name"]}];
//        }
//        [self prepareData];
//        [self.searchCollectionView reloadData];
//    } failure:^(NSString *error) {
//        
//    }];

}

- (void)prepareData{

    UserInfo *userinfo = [UserInfo sharedUserInfo];
    
    NSDictionary *historyDict = [NSDictionary dictionary];
    if (userinfo.uid) {
        historyDict = [USER_DEFAULTS objectForKey:[NSString stringWithFormat:@"%@searchHistory",userinfo.uid]];
    }
    
//    if (historyDict.count) {
//        [testArray addObject:historyDict];
//        [self.searchArray addObjectsFromArray:historyDict[@"section_content"]];
//    }
//    
//    for (NSDictionary *sectionDict in testArray) {
//        CXSearchSectionModel *model = [[CXSearchSectionModel alloc]initWithDictionary:sectionDict];
//        [self.sectionArray addObject:model];
//    }

    
}


- (void)createNavgationView {
    
    self.navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64)];
    self.navigationView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"NavBG"]];
    //    self.navigationView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.navigationView];
    

//    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(27, 20, screenWidth-27, 44)];
//    searchBar.backgroundColor = BLUE_COLOR;
//    searchBar.barTintColor = BLUE_COLOR;
//    searchBar.showsCancelButton = YES;
//    [self.navigationView addSubview:searchBar];
    
    
    UILabel *leftLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 32, 59/2.0)];
    
    
    UIImageView *searchImg = [[UIImageView alloc]initWithFrame:CGRectMake((32-18)/2.0, (59/2.0-18)/2.0, 18, 18)];
    searchImg.image = [UIImage imageNamed:@"搜索icon"];
    searchImg.backgroundColor = [UIColor clearColor];
    [leftLbl addSubview:searchImg];
    
        self.textField = [[UITextField alloc]initWithFrame:CGRectMake(27, 26, 16+516/2.0*screenScale, 59/2.0)];
        self.textField.placeholder = @"搜索产品名称或型号";
        self.textField.font = [UIFont boldSystemFontOfSize:15.0];
        self.textField.textColor = TEXT_GREY_COLOR;
        self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.textField.backgroundColor = [UIColor whiteColor];
        self.textField.layer.masksToBounds = YES;
        self.textField.layer.cornerRadius = 3;
//    self.textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 32, 59/2.0)];
    self.textField.leftView = leftLbl;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    [self.textField addSubview:self.textField.leftView];
    
    self.textField.delegate = self;
    
    [self.view addSubview:self.textField];
    
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(screenWidth-32-12, 24+(59/2.0-21)/2.0, 32, 21);
//    cancelBtn.backgroundColor = [UIColor clearColor];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.frame = cancelBtn.bounds;
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancelBtn.hidden = NO;
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
//    cancelBtn.backgroundColor = [UIColor redColor];
    [cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:cancelBtn];
    
//    UIButton *QRcode = [UIButton buttonWithType:UIButtonTypeCustom];
//    QRcode.frame = CGRectMake(14, 24+(59/2.0-57/2.0)/2.0, 59/2.0, 57/2.0);
//    QRcode.backgroundColor = [UIColor clearColor];
//    [QRcode setBackgroundImage:[UIImage imageNamed:@"扫一扫"] forState:UIControlStateNormal];
//    QRcode.imageView.frame = QRcode.bounds;
//    QRcode.hidden = NO;
//    [self.view addSubview:QRcode];
    
}

- (void)createHistory{

    UIView *historyView = [[UIView alloc]initWithFrame:CGRectMake(0, 65, screenWidth, 32)];
    historyView.backgroundColor = BACK_COLOR;
    [self.view addSubview:historyView];
    
    UILabel *hisLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, 0, 60, 32)];
    hisLabel.text = @"历史记录";
    hisLabel.font = [UIFont systemFontOfSize:14.0];
    [historyView addSubview:hisLabel];
    
  
    CustomButton *hisdelHisBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
    hisdelHisBtn.frame = CGRectMake(screenWidth-16-45, 14/2.0, 45, 18);
    hisdelHisBtn.imageRect = CGRectMake(0, 1,27/2.0 ,15);
    hisdelHisBtn.titleRect = CGRectMake(27/2.0+7, 0, 26, 18);
    [hisdelHisBtn setTitle:@"清除" forState:UIControlStateNormal];
    hisdelHisBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [hisdelHisBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [hisdelHisBtn setImage:[UIImage imageNamed:@"清除"] forState:UIControlStateNormal];
//    hisdelHisBtn.backgroundColor = [UIColor redColor];
    [hisdelHisBtn addTarget:self action:@selector(removeHisBtn) forControlEvents:UIControlEventTouchUpInside];
    [historyView addSubview:hisdelHisBtn];
}

#pragma mark - 点击事件

//清除历史记录
- (void)removeHisBtn{

    
}

//取消按钮
- (void)cancelBtnClick{

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - UITextField delegate
- (void)searchButtonClick{

    [self.textField resignFirstResponder];
    if ([self.textField.text isEqualToString:@""] ) {
        
    }
}


@end
