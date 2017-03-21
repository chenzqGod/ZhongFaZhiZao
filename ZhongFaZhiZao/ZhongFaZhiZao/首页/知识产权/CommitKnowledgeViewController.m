//
//  CommitKnowledgeViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/19.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "CommitKnowledgeViewController.h"
#import "NSString+Mobile.h"

@interface CommitKnowledgeViewController ()<UITextFieldDelegate,UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>{

    UITableView *_tableView;
    
    BOOL showList;
    UILabel *_styleLabel;
    
    NSArray *_areaArr;
}
//字数的限制
@property (nonatomic, strong)UILabel *wordCountLabel;
@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation CommitKnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _areaArr = @[@"请选择",@"智能穿戴",@"智能家居",@"智能家电",@"智能安防",@"智能医疗",@"智慧城市",@"物联网",@"车联网"];
    
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
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(2*screenScale+30*screenScale+6, 24, 48+6, 17)];
    label1.text = @"服务类型";
    label1.textAlignment = NSTextAlignmentRight;
    label1.font = [UIFont systemFontOfSize:12.0];
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
    
    
    _styleLabel.font = [UIFont systemFontOfSize:12.0];
    [backView addSubview:_styleLabel];
    
//    申请领域
    
    UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(30*screenScale, 28+CGRectGetMaxY(label1.frame), 6, 6)];
    img1.image = [UIImage imageNamed:@"yellowstar"];
    [backView addSubview:img1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(2*screenScale+CGRectGetMaxX(img1.frame), 24+CGRectGetMaxY(label1.frame), 48+6, 16)];
//    label2.text = @"* 申请领域";
    label2.text = @"申请领域";
    label2.textAlignment = NSTextAlignmentRight;
    label2.font = [UIFont systemFontOfSize:12.0];
    [backView addSubview:label2];
    
    self.areasTF = [[PickViewTexttField alloc]initWithFrame:CGRectMake(13*screenScale+CGRectGetMaxX(label2.frame), CGRectGetMaxY(label1.frame)+17, 204*screenScale, 29)];
    self.areasTF.placeholder = @"请选择";
    self.areasTF.layer.borderWidth = 1;
    
    self.areasTF.font = [UIFont systemFontOfSize:12.0];
    self.areasTF.layer.masksToBounds = YES;
    self.areasTF.layer.cornerRadius = 2;
    self.areasTF.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    self.areasTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.areasTF.leftViewMode = UITextFieldViewModeAlways;
    self.areasTF.delegate = self;
    self.areasTF.dataArray = _areaArr;
//    [self.areasTF addTarget:self action:@selector(showtableBtnClick) forControlEvents:UIControlEventAllTouchEvents];

    [backView addSubview:self.areasTF];
    
    //    联系人
    UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(30*screenScale, 28+CGRectGetMaxY(label2.frame), 6, 6)];
    img2.image = [UIImage imageNamed:@"yellowstar"];
    [backView addSubview:img2];
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(label2.frame), CGRectGetMaxY(label2.frame)+24, CGRectGetWidth(label1.frame), CGRectGetHeight(label1.frame))];
    label3.text = @"联系人";
    label3.textAlignment = NSTextAlignmentRight;
    label3.font = [UIFont systemFontOfSize:12.0];
    [backView addSubview:label3];
    
    self.nameTF = [[UITextField alloc]initWithFrame:CGRectMake(13*screenScale+CGRectGetMaxX(label3.frame), CGRectGetMaxY(self.areasTF.frame)+11, 204*screenScale, 29)];
    self.nameTF.placeholder = @"联系人";
    self.nameTF.layer.borderWidth = 1;
    self.nameTF.layer.masksToBounds = YES;
    self.nameTF.layer.cornerRadius = 2;
    self.nameTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.nameTF.leftViewMode = UITextFieldViewModeAlways;
    self.nameTF.font = [UIFont systemFontOfSize:12.0];
    self.nameTF.delegate = self;
    self.nameTF.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    [backView addSubview:self.nameTF];

    
    
    
    //    手机号码
    UIImageView *img3 = [[UIImageView alloc]initWithFrame:CGRectMake(30*screenScale, 28+CGRectGetMaxY(label3.frame), 6, 6)];
    img3.image = [UIImage imageNamed:@"yellowstar"];
    [backView addSubview:img3];

    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(label2.frame), CGRectGetMaxY(label3.frame)+24, CGRectGetWidth(label1.frame), CGRectGetHeight(label1.frame))];
    label4.text = @"手机号码";
    label4.textAlignment = NSTextAlignmentRight;
    label4.font = [UIFont systemFontOfSize:12.0];
    [backView addSubview:label4];
    
    self.phoneTF = [[UITextField alloc]initWithFrame:CGRectMake(13*screenScale+CGRectGetMaxX(label4.frame), CGRectGetMaxY(self.nameTF.frame)+11, 204*screenScale, 29)];
    self.phoneTF.placeholder = @"请输入手机号";
    self.phoneTF.layer.borderWidth = 1;
    self.phoneTF.layer.masksToBounds = YES;
    self.phoneTF.layer.cornerRadius = 2;
    self.phoneTF.font = [UIFont systemFontOfSize:12.0];
    self.phoneTF.leftViewMode = UITextFieldViewModeAlways;
    self.phoneTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.phoneTF.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    self.phoneTF.delegate = self;
    [backView addSubview:self.phoneTF];
    
    
    //    需求描述
    UIImageView *img4 = [[UIImageView alloc]initWithFrame:CGRectMake(30*screenScale, 28+CGRectGetMaxY(label4.frame), 6, 6)];
    img4.image = [UIImage imageNamed:@"yellowstar"];
    [backView addSubview:img4];

    UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(label2.frame), CGRectGetMaxY(label4.frame)+24, CGRectGetWidth(label1.frame), CGRectGetHeight(label1.frame))];
    label5.text = @"需求描述";
    label5.textAlignment = NSTextAlignmentRight;
    label5.font = [UIFont systemFontOfSize:12.0];
    [backView addSubview:label5];
    
    self.issueTF = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(13*screenScale+CGRectGetMaxX(label4.frame), CGRectGetMaxY(self.phoneTF.frame)+11, 204*screenScale, 114)];
//    self.issueTF.placeholder = @"请输入手机号";
    self.issueTF.layer.borderWidth = 1;
    self.issueTF.layer.masksToBounds = YES;
    self.issueTF.layer.cornerRadius = 2;
    self.issueTF.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    self.issueTF.font = [UIFont systemFontOfSize:12.0];
    self.issueTF.delegate = self;
    self.issueTF.placeholder = @"请详细描述您的需求";
    self.issueTF.placeholderColor = [UIColor colorWithHexString:@"#cbcbcb"];
    [backView addSubview:self.issueTF];

    self.wordCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.issueTF.frame)-50,  CGRectGetMaxY(self.issueTF.frame)+6, 50, 12)];
    _wordCountLabel.font = [UIFont systemFontOfSize:10.f];
    _wordCountLabel.textColor = TEXT_GREY_COLOR;
    _wordCountLabel.alpha = 0.7;
    self.wordCountLabel.text = @"0/50";
    self.wordCountLabel.backgroundColor = [UIColor whiteColor];
    self.wordCountLabel.textAlignment = NSTextAlignmentRight;
    [backView addSubview:self.wordCountLabel];
    
    showList = NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.areasTF.frame), CGRectGetMaxY(self.areasTF.frame), CGRectGetWidth(self.areasTF.frame), 20*8) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.hidden = YES;
    [backView addSubview:_tableView];
    
}


//把回车键当做退出键盘的响应键  textView退出键盘的操作
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([@"\n" isEqualToString:text] == YES)
    {
        [textView resignFirstResponder];
        
        
        return NO;
    }
    
    return YES;
    

}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    if (self.areasTF == textField) {
        
//        [self showtableBtnClick];
        
        return NO;
    }
    return YES;
}
#pragma mark textField的字数限制

//在这个地方计算输入的字数
- (void)textViewDidChange:(UITextView *)textView
{
    NSInteger wordCount = textView.text.length;
    self.wordCountLabel.text = [NSString stringWithFormat:@"%ld/50",(long)wordCount];
    [self wordLimit:textView];
}
#pragma mark 超过50字不能输入
-(BOOL)wordLimit:(UITextView *)text{
    if (text.text.length < 50) {
        NSLog(@"%ld",(unsigned long)text.text.length);
        self.issueTF.editable = YES;
        
    }
    else{
        self.issueTF.editable = NO;
        
    }
    return nil;
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_areaArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [_areaArr objectAtIndex:[indexPath row]];
    cell.textLabel.font = [UIFont systemFontOfSize:16.0f];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.areasTF.text = [_areaArr objectAtIndex:[indexPath row]];
    showList = NO;
    _tableView.hidden = YES;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
