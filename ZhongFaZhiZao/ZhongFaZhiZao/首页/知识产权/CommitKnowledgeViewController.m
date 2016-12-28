//
//  CommitKnowledgeViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/19.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "CommitKnowledgeViewController.h"
#import "NSString+Mobile.h"

@interface CommitKnowledgeViewController ()<UITextFieldDelegate,UITextViewDelegate>{

    UILabel *_styleLabel;
}

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
    [commitKnowBtn addTarget:self action:@selector(comitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    commitKnowBtn.layer.cornerRadius = 2;
    [self.scrollView addSubview:commitKnowBtn];
    
//    服务类型
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 24, 96*screenScale, 17)];
    label1.text = @"服务类型";
    label1.textAlignment = NSTextAlignmentRight;
    label1.font = [UIFont systemFontOfSize:13.0];
    [backView addSubview:label1];
    
    _styleLabel = [[UILabel alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(label1.frame), 24, 100, 17)];
    
    _styleLabel.text = @"默认类型";
    
    if ([_typeId isEqualToString:@"80004010"]) {
        _styleLabel.text = @"专利申请";
    }
    else if ([_typeId isEqualToString:@"80004020"]){
        _styleLabel.text = @"专利挖掘";
    }
    else if ([_typeId isEqualToString:@"80004030"]){
        _styleLabel.text = @"无效请求";
    }
    else if ([_typeId isEqualToString:@"80004040"]){
        _styleLabel.text = @"专利维权";
    }
    else if ([_typeId isEqualToString:@"80004050"]){
        _styleLabel.text = @"专利培训";
    }
    else if ([_typeId isEqualToString:@"80004060"]){
        _styleLabel.text = @"专利预警";
    }
    else if ([_typeId isEqualToString:@"80004070"]){
        _styleLabel.text = @"专利分析";
    }
    else if ([_typeId isEqualToString:@"80004080"]){
        _styleLabel.text = @"专利交易";
    }
    else if ([_typeId isEqualToString:@"80004090"]){
        _styleLabel.text = @"数据库定制";
    }
    else if ([_typeId isEqualToString:@"80004020"]){
        _styleLabel.text = @"更多";
    }
    
    
    _styleLabel.font = [UIFont systemFontOfSize:13.0];
    [backView addSubview:_styleLabel];
    
//    申请领域
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label1.frame)+24, CGRectGetWidth(label1.frame), CGRectGetHeight(label1.frame))];
    label2.text = @"* 申请领域";
    label2.textAlignment = NSTextAlignmentRight;
    label2.font = [UIFont systemFontOfSize:13.0];
    [backView addSubview:label2];
    
    self.areasTF = [[UITextField alloc]initWithFrame:CGRectMake(13*screenScale+CGRectGetMaxX(label2.frame), CGRectGetMaxY(label1.frame)+17, 204*screenScale, 29)];
    self.areasTF.placeholder = @"请选择";
    self.areasTF.layer.borderWidth = 1;
    self.areasTF.font = [UIFont systemFontOfSize:13.0];
    self.areasTF.layer.masksToBounds = YES;
    self.areasTF.layer.cornerRadius = 2;
    self.areasTF.layer.borderColor = BACK_COLOR.CGColor;
    self.areasTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.areasTF.leftViewMode = UITextFieldViewModeAlways;
    [backView addSubview:self.areasTF];
    
    
    //    联系人
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label2.frame)+24, CGRectGetWidth(label1.frame), CGRectGetHeight(label1.frame))];
    label3.text = @"*   联系人";
    label3.textAlignment = NSTextAlignmentRight;
    label3.font = [UIFont systemFontOfSize:13.0];
    [backView addSubview:label3];
    
    self.nameTF = [[UITextField alloc]initWithFrame:CGRectMake(13*screenScale+CGRectGetMaxX(label3.frame), CGRectGetMaxY(self.areasTF.frame)+11, 204*screenScale, 29)];
    self.nameTF.placeholder = @"联系人";
    self.nameTF.layer.borderWidth = 1;
    self.nameTF.layer.masksToBounds = YES;
    self.nameTF.layer.cornerRadius = 2;
    self.nameTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.nameTF.leftViewMode = UITextFieldViewModeAlways;
    self.nameTF.font = [UIFont systemFontOfSize:13.0];

    self.nameTF.layer.borderColor = BACK_COLOR.CGColor;
    [backView addSubview:self.nameTF];
    
    //    手机号码
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label3.frame)+24, CGRectGetWidth(label1.frame), CGRectGetHeight(label1.frame))];
    label4.text = @"* 手机号码";
    label4.textAlignment = NSTextAlignmentRight;
    label4.font = [UIFont systemFontOfSize:13.0];
    [backView addSubview:label4];
    
    self.phoneTF = [[UITextField alloc]initWithFrame:CGRectMake(13*screenScale+CGRectGetMaxX(label4.frame), CGRectGetMaxY(self.nameTF.frame)+11, 204*screenScale, 29)];
    self.phoneTF.placeholder = @"请输入手机号";
    self.phoneTF.layer.borderWidth = 1;
    self.phoneTF.layer.masksToBounds = YES;
    self.phoneTF.layer.cornerRadius = 2;
    self.phoneTF.font = [UIFont systemFontOfSize:13.0];
    self.phoneTF.leftViewMode = UITextFieldViewModeAlways;
    self.phoneTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.phoneTF.layer.borderColor = BACK_COLOR.CGColor;
    [backView addSubview:self.phoneTF];
    
    
    //    需求描述
    UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label4.frame)+24, CGRectGetWidth(label1.frame), CGRectGetHeight(label1.frame))];
    label5.text = @"* 需求描述";
    label5.textAlignment = NSTextAlignmentRight;
    label5.font = [UIFont systemFontOfSize:13.0];
    [backView addSubview:label5];
    
    self.issueTF = [[UITextView alloc]initWithFrame:CGRectMake(13*screenScale+CGRectGetMaxX(label4.frame), CGRectGetMaxY(self.phoneTF.frame)+11, 204*screenScale, 114)];
//    self.issueTF.placeholder = @"请输入手机号";
    self.issueTF.layer.borderWidth = 1;
    self.issueTF.layer.masksToBounds = YES;
    self.issueTF.layer.cornerRadius = 2;
    self.issueTF.layer.borderColor = BACK_COLOR.CGColor;
    [backView addSubview:self.issueTF];

    self.areasTF.delegate = self;
    self.nameTF.delegate = self;
    self.phoneTF.delegate = self;
    self.issueTF.delegate = self;
    
    
}


- (void)setTypeId:(NSString *)typeId{

    _typeId = typeId;
   
    [self createCommitKnow];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (void)comitBtnClick{

    if ([self.areasTF.text isEqualToString:@""]) {
        [WKProgressHUD popMessage:@"请选择领域" inView:self.view duration:HUD_DURATION animated:YES];
    }
    else if ([self.nameTF.text isEqualToString:@""]){
        [WKProgressHUD popMessage:@"请输入联系人" inView:self.view duration:HUD_DURATION animated:YES];

    }
    else if ([self.phoneTF.text isEqualToString:@""]){
    
        [WKProgressHUD popMessage:@"请输入手机号" inView:self.view duration:HUD_DURATION animated:YES];
    }
    else if (![self.phoneTF.text isMobileNumber]){
        [WKProgressHUD popMessage:@"请输入正确手机号" inView:self.view duration:HUD_DURATION animated:YES];

    }
    else if ([self.issueTF.text isEqualToString:@""]){
    
        [WKProgressHUD popMessage:@"请输入需求" inView:self.view duration:HUD_DURATION animated:YES];

    }
    else{
        
        NSDictionary *parameters = @{@"domain":self.areasTF.text,@"contacts":self.nameTF.text,@"mobile":self.phoneTF.text,@"description":self.issueTF.text};

    
        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@/%@",HOST_URL,PATENT_APPLY,self.typeId] parameters:parameters success:^(id response) {
            
            if ([response[@"resultCode"]integerValue] == 1000) {
                [WKProgressHUD popMessage:@"提交成功" inView:self.view duration:HUD_DURATION animated:YES];
                
                
                
            }else if ([response[@"resultCode"]integerValue] == 1001){
                
                [WKProgressHUD popMessage:@"提交失败" inView:self.view duration:HUD_DURATION animated:YES];
            }else if ([response[@"resultCode"]integerValue] == 1008){
                
                [WKProgressHUD popMessage:@"参数错误" inView:self.view duration:HUD_DURATION animated:YES];
            }
            
        } failure:^(NSString *error) {
            NSLog(@"%@",error);
            [WKProgressHUD popMessage:@"请检查网络连接" inView:self.view duration:HUD_DURATION animated:YES];
        }];
        
    }
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{

    if ([text isEqualToString:@""] && range.length > 0) {
        //删除字符肯定是安全的
        return YES;
    }
    else {
        if (textView.text.length - range.length + text.length > 50) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"超出50个字符" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
            return NO;
        }
        else {
            return YES;
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
