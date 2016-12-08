//
//  SetMeViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/2.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "SetMeViewController.h"

@interface SetMeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation SetMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:NO];
    
    self.navigationItem.title = @"设置";
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-64) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableView];
}

#pragma mark - datasource
//有多少个分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

//每一个分组cell的个数，分组中某一行的cell叫做row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 4;
    }
    else if (section == 1){
    
        return 2;
    }
    else if (section == 2){
    
        return 1;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *iconNameArray1 = @[@"账户安全",@"新手帮助",@"意见反馈",@"联系客服"];
    NSArray *iconNameArray2 = @[@"版本显示",@"清除缓存"];
    NSArray *iconNameArray3 = @[@"消息通知"];
    NSArray *iconNameArray = @[iconNameArray1,iconNameArray2,iconNameArray3];
    
    if (indexPath.section == 0) {
        
        static NSString *cellID = @"CellID0";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //        cell.userInteractionEnabled = NO;
        }
        return cell;
    }
    else if (indexPath.section == 1 && indexPath.row == 0){
    
    }
    else if (indexPath.section == 1 && indexPath.row == 1){
    
    }
    else if (indexPath.section == 2){
    
    }
    
    static NSString *cellID = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //        cell.userInteractionEnabled = NO;
    }
    return cell;
    
}

#pragma mark - delegate
//返回cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 41;
}

//返回页头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    

    if (section == 0){
        
        return 10;
        
    }else if (section == 1){
        
        return 9;
    }else if (section == 2){
    
        return 8.5;
    }
    return 0;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0;
}


//cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
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
