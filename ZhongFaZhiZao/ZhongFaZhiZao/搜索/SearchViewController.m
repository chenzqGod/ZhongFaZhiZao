//
//  SearchViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/16.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController
- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = BACK_COLOR;
    
    [self createNavgationView];
}


- (void)createNavgationView {
    
    self.navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64)];
    self.navigationView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"NavBack"]];
    //    self.navigationView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.navigationView];
    
    
    UILabel *leftLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 32, 59/2.0)];
    
    
    
    UIImageView *searchImg = [[UIImageView alloc]initWithFrame:CGRectMake((32-18)/2.0, (59/2.0-18)/2.0, 18, 18)];
    searchImg.image = [UIImage imageNamed:@"搜索icon"];
    searchImg.backgroundColor = [UIColor clearColor];
    [leftLbl addSubview:searchImg];
    
        self.textField = [[UITextField alloc]initWithFrame:CGRectMake(59, 26, 516/2.0*screenScale, 59/2.0)];
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
    
    [self.view addSubview:self.textField];
    

    
//    UIButton  *pushSerchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    pushSerchBtn.frame = CGRectMake(59, 24, 516/2.0*screenScale, 59/2.0);
//    pushSerchBtn.backgroundColor = [UIColor clearColor];
//    [pushSerchBtn setBackgroundImage:[UIImage imageNamed:@"搜素"] forState:UIControlStateNormal];
//    //    self.pushSerchBtn.layer.cornerRadius = 3;
//    //    self.pushSerchBtn.layer.masksToBounds = YES;
//    pushSerchBtn.imageView.frame = pushSerchBtn.bounds;
//    pushSerchBtn.hidden = NO;
//    [pushSerchBtn setEnabled:YES];
////    [pushSerchBtn addTarget:self action:@selector(SearchButtonPush) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:pushSerchBtn];
    
    
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
    
    UIButton *QRcode = [UIButton buttonWithType:UIButtonTypeCustom];
    QRcode.frame = CGRectMake(14, 24+(59/2.0-57/2.0)/2.0, 59/2.0, 57/2.0);
    QRcode.backgroundColor = [UIColor clearColor];
    [QRcode setBackgroundImage:[UIImage imageNamed:@"扫一扫"] forState:UIControlStateNormal];
    QRcode.imageView.frame = QRcode.bounds;
    QRcode.hidden = NO;
    [self.view addSubview:QRcode];
    
}


#pragma mark - 点击事件

//取消按钮
- (void)cancelBtnClick{

    [self.navigationController popViewControllerAnimated:YES];
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
