//
//  UMengShareViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/2/28.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "UMengShareViewController.h"
#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UShareUI.h>

#import "WXApi.h"
#import "UMSocialQQHandler.h"
#import <TencentOpenAPI/QQApiInterface.h>

#define SHARE_ADDRESS  @"https://itunes.apple.com/cn/app/zhong-fa-zhi-zao/id1177867297?mt=8"

@interface UMengShareViewController ()

@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,assign)NSInteger btnFlag;

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
    
    self.btnFlag = 0;
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight)];
    self.scrollView.backgroundColor = BACK_COLOR;
    [self.view addSubview:self.scrollView];
    
    [self createUI];
}

- (void)createUI{
    
    /**这里实现了新浪，微信朋友圈，微信聊天，QQ聊天四个*/
    
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_Sina),@(UMSocialPlatformType_QQ),@( UMSocialPlatformType_WechatTimeLine ),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_Qzone),@(UMSocialPlatformType_Sms)]];
    
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
            shareBtn.tag = 5000+self.btnFlag;
            [shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            UILabel *sumLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(shareBtn.frame)-12.5, CGRectGetMaxY(shareBtn.frame)+8*screenScale, 60, 10)];
            
            sumLabel.font = [UIFont systemFontOfSize:11.0];
            sumLabel.textColor = TEXT_GREY_COLOR;
            sumLabel.textAlignment = NSTextAlignmentCenter;
            sumLabel.text = titleArr[i][j];
            
            [self.scrollView addSubview:shareBtn];
            
            [self.scrollView addSubview:sumLabel];
            
            self.btnFlag++;
            
            
        }
    }
    
}

- (void)shareBtnClick:(UIButton *)btn{

   // 朋友圈
    if (btn.tag == 5000) {
        
        if ([WXApi isWXAppInstalled]) {
            
            [self shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine];
        }
        
        
    }
//    微信
    else if (btn.tag == 5001){
    
        NSLog(@"微信");
        
        if ([WXApi isWXAppInstalled]) {
            
            [self shareWebPageToPlatformType:UMSocialPlatformType_WechatSession];
        }
        
        
    }
//    微博
    else if (btn.tag == 5002){
    
        NSLog(@"微博");
        
        [self shareWebPageToPlatformType:UMSocialPlatformType_Sina];
        
    }
//    空间
    else if (btn.tag == 5003){
    
        if ([QQApiInterface isQQInstalled]) {
            
            [self shareWebPageToPlatformType:UMSocialPlatformType_Qzone];
        }
        
    }
//    QQ
    else if (btn.tag == 5004){
        
        if ([QQApiInterface isQQInstalled]) {
            
            [self shareWebPageToPlatformType:UMSocialPlatformType_QQ];

        }
        
           }
//    短信
    else if (btn.tag == 5005){
    
        NSLog(@"短信");
//        [self runShareWithType:UMSocialPlatformType_Sms];
        [self shareWebPageToPlatformType:UMSocialPlatformType_Sms];

        
    }
    else{
    
        NSLog(@"umeng不分享");
    }

}


//网页分享
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"中发智造" descr:@"中国最大的智能智造生态服务平台，下载APP，惊喜等着你！" thumImage:[UIImage imageNamed:@"40x40"]];
    //设置网页地址
    shareObject.webpageUrl =SHARE_ADDRESS;
        

    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}

//文本分享
- (void)runShareWithType:(UMSocialPlatformType)type

{
    
    //创建分享消息对象
    
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //设置文本
    
    messageObject.text = @"#中发智造#";
    
    
    
    //调用分享接口
    
    [[UMSocialManager defaultManager] shareToPlatform:type messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        
        if (error) {
            
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
            
        }else{
            
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                
                UMSocialShareResponse *resp = data;
                
                //分享结果消息
                
                UMSocialLogInfo(@"response message is %@",resp.message);
                
                //第三方原始返回的数据
                
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }
            
            else
                
            {
                
                UMSocialLogInfo(@"response data is %@",data);
                
            }
            
        }
        
        [self alertWithError:error];
        
    }];
    
}

- (void)alertWithError:(NSError *)error

{
    
    NSString *result = nil;
    
    if (!error) {
        
        result = [NSString stringWithFormat:@"分享成功"];
        
    }else{
        
        NSMutableString *str = [NSMutableString string];
        
        if (error.userInfo) {
            
            for (NSString *key in error.userInfo) {
                
                [str appendFormat:@"%@ = %@\n", key, error.userInfo[key]];
                
            }
            
        }
        
        if (error) {
            
            result = [NSString stringWithFormat:@"Share fail with error code: %d\n%@",(int)error.code, str];
            
        }
        
        else{
            
            result = [NSString stringWithFormat:@"分享失败"];
            
        }
        
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享"
                          
                                                    message:result
                          
                                                   delegate:nil
                          
                                          cancelButtonTitle:@"确定"
                          
                                          otherButtonTitles:nil];
    
    [alert show];
    
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
