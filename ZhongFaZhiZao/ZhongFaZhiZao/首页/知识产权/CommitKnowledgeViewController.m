//
//  CommitKnowledgeViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/19.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "CommitKnowledgeViewController.h"

@interface CommitKnowledgeViewController ()

@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation CommitKnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"提交申请"];
    navView.viewController = self;
    [self.view addSubview:navView];
    
    self.view.backgroundColor = BACK_COLOR;
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64)];
    [self.view addSubview:self.scrollView];
    
    [self createCommitKnow];
}

- (void)createCommitKnow{
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 8, screenWidth, 332)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:backView];

    UIButton *commitKnowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commitKnowBtn.frame = CGRectMake(18, 18+CGRectGetMaxY(backView.frame), screenWidth-18*2, 36);
    commitKnowBtn.backgroundColor = BLUE_COLOR;
    [commitKnowBtn setTitle:@"提交申请" forState:UIControlStateNormal];
    [commitKnowBtn setTintColor:[UIColor whiteColor]];
    commitKnowBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    commitKnowBtn.layer.masksToBounds = YES;
    commitKnowBtn.layer.cornerRadius = 2;
    [self.scrollView addSubview:commitKnowBtn];
    
//    服务类型
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 24, 96*screenScale, 17)];
    label1.text = @"服务类型";
    label1.textAlignment = NSTextAlignmentRight;
    label1.font = [UIFont systemFontOfSize:12.0];
    [backView addSubview:label1];
    
    UILabel *styleLabel = [[UILabel alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(label1.frame), 24, 100, 17)];
    
    styleLabel.text = @"默认类型";
    
//    if ([self.styleStr isEqualToString:@""]) {
//        
//        styleLabel.text = @"默认类型";
//        
//    }else{
//    
//        styleLabel.text = self.styleStr;
//    }
    
    styleLabel.font = [UIFont systemFontOfSize:12.0];
    [backView addSubview:styleLabel];
    
//    申请领域
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label1.frame)+24, CGRectGetWidth(label1.frame), CGRectGetHeight(label1.frame))];
    label2.text = @"* 申请领域";
    label2.textAlignment = NSTextAlignmentRight;
    label2.font = [UIFont systemFontOfSize:12.0];
    [backView addSubview:label2];
    
    self.areasTF = [[UITextField alloc]initWithFrame:CGRectMake(13*screenScale+CGRectGetMaxX(label2.frame), CGRectGetMaxY(label1.frame)+17, 204*screenScale, 29)];
    self.areasTF.placeholder = @" 请选择";
    self.areasTF.layer.borderWidth = 1;
    self.areasTF.font = [UIFont systemFontOfSize:12.0];
    self.areasTF.layer.masksToBounds = YES;
    self.areasTF.layer.cornerRadius = 2;
    self.areasTF.layer.borderColor = BACK_COLOR.CGColor;
    [backView addSubview:self.areasTF];
    
    
    //    联系人
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label2.frame)+24, CGRectGetWidth(label1.frame), CGRectGetHeight(label1.frame))];
    label3.text = @"*   联系人";
    label3.textAlignment = NSTextAlignmentRight;
    label3.font = [UIFont systemFontOfSize:12.0];
    [backView addSubview:label3];
    
    self.nameTF = [[UITextField alloc]initWithFrame:CGRectMake(13*screenScale+CGRectGetMaxX(label3.frame), CGRectGetMaxY(self.areasTF.frame)+11, 204*screenScale, 29)];
    self.nameTF.placeholder = @" 联系人";
    self.nameTF.layer.borderWidth = 1;
    self.nameTF.layer.masksToBounds = YES;
    self.nameTF.layer.cornerRadius = 2;
    self.nameTF.font = [UIFont systemFontOfSize:12.0];

    self.nameTF.layer.borderColor = BACK_COLOR.CGColor;
    [backView addSubview:self.nameTF];
    
    //    手机号码
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label3.frame)+24, CGRectGetWidth(label1.frame), CGRectGetHeight(label1.frame))];
    label4.text = @"* 手机号码";
    label4.textAlignment = NSTextAlignmentRight;
    label4.font = [UIFont systemFontOfSize:12.0];
    [backView addSubview:label4];
    
    self.phoneTF = [[UITextField alloc]initWithFrame:CGRectMake(13*screenScale+CGRectGetMaxX(label4.frame), CGRectGetMaxY(self.nameTF.frame)+11, 204*screenScale, 29)];
    self.phoneTF.placeholder = @" 请输入手机号";
    self.phoneTF.layer.borderWidth = 1;
    self.phoneTF.layer.masksToBounds = YES;
    self.phoneTF.layer.cornerRadius = 2;
    self.phoneTF.font = [UIFont systemFontOfSize:12.0];

    self.phoneTF.layer.borderColor = BACK_COLOR.CGColor;
    [backView addSubview:self.phoneTF];
    
    
    //    需求描述
    UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label4.frame)+24, CGRectGetWidth(label1.frame), CGRectGetHeight(label1.frame))];
    label5.text = @"* 需求描述";
    label5.textAlignment = NSTextAlignmentRight;
    label5.font = [UIFont systemFontOfSize:12.0];
    [backView addSubview:label5];
    
    self.issueTF = [[UITextView alloc]initWithFrame:CGRectMake(13*screenScale+CGRectGetMaxX(label4.frame), CGRectGetMaxY(self.phoneTF.frame)+11, 204*screenScale, 114)];
//    self.issueTF.placeholder = @"请输入手机号";
    self.issueTF.layer.borderWidth = 1;
    self.issueTF.layer.masksToBounds = YES;
    self.issueTF.layer.cornerRadius = 2;
    self.issueTF.layer.borderColor = BACK_COLOR.CGColor;
    [backView addSubview:self.issueTF];


    
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
