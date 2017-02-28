//
//  UMengShareViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/2/28.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "UMengShareViewController.h"

@interface UMengShareViewController ()

@property (nonatomic,strong)UIScrollView *scrollView;

@end

@implementation UMengShareViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    [self.tabBarController.tabBar setHidden:YES];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    NavigationControllerView *view = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"分享"];
    view.viewController = self;
    [self.view addSubview:view];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight)];
    self.scrollView.backgroundColor = BACK_COLOR;
    [self.view addSubview:self.scrollView];
    
    [self createUI];
}

- (void)createUI{

    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 45*screenScale, screenWidth-50*2, 20)];
    titleLabel.font = [UIFont boldSystemFontOfSize:15.0];
    titleLabel.text = @"邀请好友下载中发智造APP";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.scrollView addSubview:titleLabel];
    
    UIImageView *codeImg = [[UIImageView alloc]initWithFrame:CGRectMake((screenWidth-285/2.0)/2.0, 25*screenScale+CGRectGetMaxY(titleLabel.frame), 285/2.0, 285/2.0)];
    codeImg.image = [UIImage imageNamed:@"共用二维码"];
    [self.scrollView addSubview:codeImg];
    
    UILabel *visitLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(codeImg.frame), 10*screenScale+CGRectGetMaxY(codeImg.frame), CGRectGetWidth(codeImg.frame), 20)];
    visitLabel.text = @"面对面扫码邀请";
    visitLabel.font = [UIFont systemFontOfSize:15.0];
    visitLabel.textAlignment = NSTextAlignmentCenter;
    visitLabel.textColor = TEXT_GREY_COLOR;
    [self.scrollView addSubview:visitLabel];
    
    UILabel *shareLbl = [[UILabel alloc]initWithFrame:CGRectMake((screenWidth-34)/2, 155*screenScale+CGRectGetMaxY(visitLabel.frame), 34, 10)];
    shareLbl.text = @"分享到";
    shareLbl.font = [UIFont systemFontOfSize:11.0];
    shareLbl.textColor = TEXT_GREY_COLOR;
    shareLbl.textAlignment = NSTextAlignmentCenter;
    [self.scrollView addSubview:shareLbl];
    
    UILabel *leftLine = [[UILabel alloc]initWithFrame:CGRectMake(17, 4.5+CGRectGetMinY(shareLbl.frame), 125*screenScale, 1)];
    leftLine.backgroundColor = TEXT_GREY_COLOR;
    [self.scrollView addSubview:leftLine];
    
    UILabel *rightLine = [[UILabel alloc]initWithFrame:CGRectMake(screenWidth-17-125*screenScale, CGRectGetMinY(leftLine.frame), CGRectGetWidth(leftLine.frame), CGRectGetHeight(leftLine.frame))];
    rightLine.backgroundColor = TEXT_GREY_COLOR;
    [self.scrollView addSubview:rightLine];
    
    NSArray *imgArr = @[@[@"朋友圈分享",@"微信分享",@"微博分享"],@[@"空间分享",@"QQ分享",@"短信分享"]];
    
    NSArray *titleArr = @[@[@"微信朋友圈",@"微信好友",@"新浪微博"],@[@"QQ空间",@"QQ好友",@"短信"]];
    
    for (NSInteger i = 0; i < 2; i++) {
        
        for (NSInteger j = 0; j < 3; j++) {
            
            CGFloat shareBtnX = (screenWidth-35*3)/4.0;
            
            UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            shareBtn.frame = CGRectMake(shareBtnX*(j+1)+j*35, CGRectGetMaxY(shareLbl.frame)+22*screenScale+i*(35+35+22*screenScale), 35, 35);
            
            [shareBtn setImage:[UIImage imageNamed:imgArr[i][j]] forState:UIControlStateNormal];
            
            shareBtn.layer.cornerRadius = 35/2.0;
            shareBtn.layer.masksToBounds = YES;
            
            UILabel *sumLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(shareBtn.frame)-12.5, CGRectGetMaxY(shareBtn.frame)+8*screenScale, 60, 10)];
            
            sumLabel.font = [UIFont systemFontOfSize:11.0];
            sumLabel.textColor = TEXT_GREY_COLOR;
            sumLabel.textAlignment = NSTextAlignmentCenter;
            sumLabel.text = titleArr[i][j];
            
            [self.scrollView addSubview:shareBtn];
            
            [self.scrollView addSubview:sumLabel];
            
            
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
