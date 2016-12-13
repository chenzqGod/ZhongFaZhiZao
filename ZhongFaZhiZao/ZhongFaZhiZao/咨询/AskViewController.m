//
//  AskViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/7.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "AskViewController.h"
#import "AskTableViewCell.h"
#import "AskDetailsViewController.h"

@interface AskViewController ()<UITableViewDelegate,UITableViewDataSource>{

}

@property (nonatomic,strong) UITableView *tableView;


@end

@implementation AskViewController

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:YES];
    
//    self.tabBarController.tabBar.hidden=YES;
    self.navigationItem.title = @"消息中心";
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"NavBack.png"] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""]forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    [self.navigationController setNavigationBarHidden:NO];
  
    
    
    
    
    self.view.backgroundColor = [UIColor clearColor];

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_tableView];

}

#pragma mark - datasource
//有多少个分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 6;
}

//每一个分组cell的个数，分组中某一行的cell叫做row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
          //按分类查询设备
    static NSString *cellID = @"CellID";
    AskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[AskTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //        cell.userInteractionEnabled = NO;
    }
       return cell;
    
}

#pragma mark - delegate
//返回cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 300;
}

//返回页头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    //    if (section == 0) {
    //
    //        return 0;
    //
    //    }else
    if (section == 0){
        
        return Margin;
        
    }else if (section == 1){
        
        return 0;
    }
    return 0;
}

//自定义区头
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
////    if (section == 1) {
////
////        UIView *view = [[UIView alloc]init];
//////        view.frame = CGRectMake(0 , 0, screenWidth, 14);
////        view.backgroundColor = [UIColor cyanColor];
////
////        return view;
////
////    }
//
//    return nil;
//}

//自定义footer

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    if (section == 0) {
        
        UIView *view = [[UIView alloc]init];
        view.frame = CGRectMake(0 , 0, screenWidth, 14);
        view.backgroundColor = [UIColor cyanColor];
        
        return view;
        
    }
    
    return nil;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0;
}


//cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AskDetailsViewController *vc = [[AskDetailsViewController alloc]init];
    vc.detailUrl = @"http://www.baidu.com";
    
    [self.navigationController pushViewController:vc animated:YES];
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
