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
#import "ZhongFaDataBase.h"
#import "UIImageView+WebCache.h"
#import "WKWebViewViewController.h"


@interface AskViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    UIImageView *_noImgeView;
    UILabel *_noLabel;
}

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;

@end

@implementation AskViewController

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:YES];
    
    self.tabBarController.tabBar.hidden=YES;

    [self.navigationController setNavigationBarHidden:YES animated:NO];
    

//    刷新数据库信息
//    NSString *path = [NSString stringWithFormat:@"%@/Documents/data.db",NSHomeDirectory()];
//    FMDatabase *database = [FMDatabase databaseWithPath:path];
//    [database open];
//    
//    [database executeUpdate:@"update push_data"];

//    查找并赋值
//    按日期排序 order by date desc
//    _dataArr = [[NSMutableArray alloc]init];
    _dataArr = [ZhongFaDataBase getPushMessage];
    
    }

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _noImgeView = [[UIImageView alloc]init];
    _noLabel = [[UILabel alloc]init];
  
    self.view.backgroundColor = [UIColor whiteColor];

    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"消息中心"];
    navView.viewController = self;
    [self.view addSubview:navView];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(12*screenScale, 64, screenWidth-12*screenScale*2, screenHeight-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_tableView];
    
    if (self.dataArr.count == 0) {
        
        _noImgeView.frame = CGRectMake((screenWidth-258)/2.0, 122, 258, 171);
        _noImgeView.image = [UIImage imageNamed:@"Group no"];
        [self.view addSubview:_noImgeView];
        
        _noLabel.frame = CGRectMake((screenWidth-258)/2.0, 18+122+171, 258, 14);
        _noLabel.text = @"消息游走于太空";
        _noLabel.font = [UIFont systemFontOfSize:12.0];
        _noLabel.textColor = TEXT_GREY_COLOR;
        _noLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_noLabel];
        
    }else{
    
        _noImgeView.frame = CGRectZero;
        _noLabel.frame = CGRectZero;
    }

}

#pragma mark - datasource
//有多少个分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
//    return 6;
    
    return self.dataArr.count;
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
      
            
        }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //        cell.userInteractionEnabled = NO;
    
//    if (self.dataArr[indexPath.section]) {
    
        cell.titleLabel.text = [NSString stringWithFormat:@"%@",self.dataArr[indexPath.section][@"title"]];
        [cell.mainImgView sd_setImageWithURL:[NSURL URLWithString:self.dataArr[indexPath.section][@"imgurl"]] placeholderImage:[UIImage imageNamed:@"占位图-消息"]];
        
        cell.sumLabel.text = [NSString stringWithFormat:@"%@",self.dataArr[indexPath.section][@"summury"]];

        
//    }
       return cell;
    
}

#pragma mark - delegate
//返回cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 240;
}

//返回页头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
 
    return 55;
 
}

//自定义区头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{


        UIView *view = [[UIView alloc]init];
        view.frame = CGRectMake(0 , 0, screenWidth, 55);
        view.backgroundColor = BACK_COLOR;
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake((screenWidth-98)/2.0, (55-27)/2.0, 98, 27)];
    timeLabel.text = @"2016年11月23日";
    
    if (self.dataArr[section]) {
        
        timeLabel.text = [NSString stringWithFormat:@"%@",self.dataArr[section][@"date"]];
        
    }
//
    timeLabel.backgroundColor = [UIColor colorWithHexString:@"#9b9b9b"];
    timeLabel.alpha = 0.4;
    timeLabel.font = [UIFont systemFontOfSize:11.0];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.layer.masksToBounds = YES;
    timeLabel.layer.cornerRadius = 4;
    [view addSubview:timeLabel];

    return view;


}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0;
}


//cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    AskDetailsViewController *vc = [[AskDetailsViewController alloc]init];
//    vc.detailUrl = @"http://www.baidu.com";
//    
//
//    [self.navigationController pushViewController:vc animated:YES];
    
    WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@",self.dataArr[indexPath.section][@"url"]] title:@"消息中心"];
//    WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://www.baidu.com" title:@"消息中心"];
    [self.navigationController pushViewController:wkvc animated:YES];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if (scrollView == _tableView) {
        CGFloat sectionHeaderHeight = 55;
        
        if (scrollView.contentOffset.y<=sectionHeaderHeight && scrollView.contentOffset.y>0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        }
        
        
        else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
            
        }
        
    }

}


@end
