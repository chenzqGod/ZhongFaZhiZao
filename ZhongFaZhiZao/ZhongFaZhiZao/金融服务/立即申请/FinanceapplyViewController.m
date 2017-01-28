//
//  FinanceapplyViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/1/17.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "FinanceapplyViewController.h"
#import "UIImageView+WebCache.h"
#import "WKWebViewViewController.h"
#import "PickViewTexttField.h"
#import "NSString+Mobile.h"

@interface FinanceapplyViewController ()<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>{

    UIScrollView *_scrollView;
    UILabel *_specialLabel;
    UIView *_specialView;
    UIView *_mainView;
    UITextField *_text1;
    UITextField *_text2;
    PickViewTexttField *_text3;
    PickViewTexttField *_text4;
    PickViewTexttField *_text5;
    PickViewTexttField *_text6;
    UITextField *_text7;
    PickViewTexttField *_text8;
    PickViewTexttField *_text9;
    UITextField *_text10;
    UITextField *_text11;
    UIButton *_adminBtn;
    UIPickerView *_pickerView;
    NSArray *_dataArr;
    NSArray *_arrPick3;
    NSArray *_arrPick4;
    NSArray *_arrPick5;
    NSArray *_arrPick6;
    NSArray *_arrPick8;
    NSArray *_arrPick9;
    UIView *_headView;
    UIButton *_applyBtn;
    UIButton *_tiaokuanBtn;
    
}

@property (nonatomic,assign)NSInteger adminBtnFlag;

@end

@implementation FinanceapplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _arrPick3 = [[NSArray alloc]init];
    _arrPick3 = @[@"请选择",@"1年内逾期超过3次或90天",@"1年内逾期少于3次且少于90天",@"无信用卡或贷款",@"信用良好无逾期"];
    
    _arrPick4 = [[NSArray alloc]init];
    _arrPick4 = @[@"请选择",@"不足3个月",@"3个月",@"半年",@"1年",@"2年以上"];
    
    _arrPick5 = [[NSArray alloc]init];
    _arrPick5 = @[@"请选择",@"无",@"2万以下",@"2万",@"3万",@"4万",@"5万",@"5万以上"];
    
    _arrPick6 = [[NSArray alloc]init];
    _arrPick6 = @[@"请选择",@"无",@"2万以下",@"2万",@"3万",@"4万",@"5万",@"5万以上"];

    
    _arrPick8 = [[NSArray alloc]init];
    _arrPick8 = @[@"请选择",@"无房产",@"小产权房",@"经适/限价房",@"房改/危改房",@"有房,但不缺人房产类型"];
    
    _arrPick9 = [[NSArray alloc]init];
    _arrPick9 = @[@"请选择",@"无",@"无车,准备买",@"有车"];

    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"提交申请"];
    navView.viewController = self;
    [self.view addSubview:navView];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64)];
    _scrollView.backgroundColor = BACK_COLOR;
    _scrollView.contentSize = CGSizeMake(screenWidth, 765+72*screenScale);
    [self.view addSubview:_scrollView];
    
    self.adminBtnFlag = 0;
    
    [self createUI];
}


- (void)createUI{
    
    _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 72)];
    _headView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_headView];
    
    UIImageView *iconView = [[UIImageView alloc]initWithFrame:CGRectMake(25*screenScale, 17, 80*screenScale, 32*screenScale)];
    //    _iconView.backgroundColor = [UIColor cyanColor];
    [iconView sd_setImageWithURL:[NSURL URLWithString:self.iconImg] placeholderImage:[UIImage imageNamed:@"占位图200-188"]];
    [_headView addSubview:iconView];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(iconView.frame), 13, screenWidth-(16*screenScale+CGRectGetMaxX(iconView.frame))-Margin, 20)];
    nameLabel.font = [UIFont systemFontOfSize:15.0];
    //    _nameLabel.backgroundColor = [UIColor cyanColor];
    nameLabel.text = self.name;
    [_headView addSubview:nameLabel];
    
    UILabel *rateLabel = [[UILabel alloc]init];
    if ([self.rate isEqualToString:@"NOEXIST"]) {
        
        rateLabel.frame = CGRectZero;
    }else{
    
        rateLabel.frame = CGRectMake(CGRectGetMinX(nameLabel.frame), 4+CGRectGetMaxY(nameLabel.frame), CGRectGetWidth(nameLabel.frame), 25);
        
        NSMutableAttributedString *renewAttributed = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"贷款利率：%@/月",self.rate]];
        [renewAttributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.0] range:NSMakeRange(0, 5)];
        [renewAttributed addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#000000"] range:NSMakeRange(0, 5)];
        
        [renewAttributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18.0] range:NSMakeRange(5, [self.rate length])];
        [renewAttributed addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#F6A623"] range:NSMakeRange(5, [self.rate length])];
        
        [renewAttributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.0] range:NSMakeRange(5+[self.rate length], 2)];
        [renewAttributed addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#000000"] range:NSMakeRange(5+[self.rate length], 2)];
        
        rateLabel.attributedText = renewAttributed;

    }
    [_headView addSubview:rateLabel];
    
//    特别说明
    _specialView = [[UIView alloc]initWithFrame:CGRectMake(0, 8+CGRectGetMaxY(_headView.frame), screenWidth, 164)];
    _specialView.backgroundColor = [UIColor colorWithHexString:@"#FFFDE3"];
    _specialView.userInteractionEnabled = YES;
    [_scrollView addSubview:_specialView];
    
    UILabel *specialTitle = [[UILabel alloc]initWithFrame:CGRectMake(20*screenScale, 13, 150, 20)];
    specialTitle.text = @"特别申明";
    specialTitle.font = [UIFont systemFontOfSize:15.0];
    [_specialView addSubview:specialTitle];
    
    UIButton *speciaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    speciaBtn.frame = CGRectMake(screenWidth-20*screenScale-15, 16, 15, 15);
    speciaBtn.layer.masksToBounds = YES;
    speciaBtn.layer.cornerRadius = 15/2.0;
//    speciaBtn.backgroundColor = [UIColor cyanColor];
    [speciaBtn setBackgroundImage:[UIImage imageNamed:@"Pagejr"] forState:UIControlStateNormal];
    [speciaBtn addTarget:self action:@selector(specialBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_specialView addSubview:speciaBtn];
    
    
    UILabel *specialHigLbl = [[UILabel alloc]initWithFrame:CGRectMake(20*screenScale, 6+CGRectGetMaxY(specialTitle.frame), screenWidth-20*screenScale*2, 35)];
    specialHigLbl.text = @"中发智造提供免费的贷款搜索和推荐服务，贷款过程中遇到的任何预先收费均为诈骗行为，请保持警惕避免损失。";
    specialHigLbl.font = [UIFont systemFontOfSize:12.0];
    specialHigLbl.numberOfLines = 0;
    specialHigLbl.textColor = TEXT_SUMMARY_COLOR;
    [_specialView addSubview:specialHigLbl];
    
    UILabel *specialDownLbl = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(specialHigLbl.frame), 10+CGRectGetMaxY(specialHigLbl.frame), CGRectGetWidth(specialHigLbl.frame), 66)];
    specialDownLbl.text = @"我们结合了您的基本情况和个人资产进行智能推荐，原则上如果您填写的信息越真实，我们推荐的产品也越精确。同时，填写虚假信息将对您办理贷款带来不利影响，建议您不要这么做。";
    specialDownLbl.font = [UIFont systemFontOfSize:12.0];
    specialDownLbl.numberOfLines = 0;
    specialDownLbl.textColor = TEXT_SUMMARY_COLOR;
    [_specialView addSubview:specialDownLbl];
    
//    申请栏
    _mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 8+CGRectGetMaxY(_specialView.frame), screenWidth, 465)];
    _mainView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_mainView];
    
    
//    贷款金额
    UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(30*screenScale, 28, 6, 6)];
    img1.image = [UIImage imageNamed:@"yellowstar"];
    [_mainView addSubview:img1];
    
    UILabel *lbl1 = [[UILabel alloc]initWithFrame:CGRectMake(2*screenScale+CGRectGetMaxX(img1.frame), 24, 48+6, 16)];
    lbl1.text = @"贷款金额";
    lbl1.textAlignment = NSTextAlignmentRight;
    lbl1.font = [UIFont systemFontOfSize:12.0];
    [_mainView addSubview:lbl1];
    
    _text1 = [[UITextField alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(lbl1.frame), 17, 204*screenScale, 29)];
    if ([self.moneyMax isEqualToString:@"NOEXIST"] || [self.moneyMin isEqualToString:@"NOEXIST"]) {
        
        _text1.placeholder = @"贷款金额";
    }else{
        
        _text1.placeholder = [NSString stringWithFormat:@"可填金额%@-%@万",self.moneyMin,self.moneyMax];
    }
    _text1.layer.borderWidth = 1;
    _text1.layer.masksToBounds = YES;
    _text1.layer.cornerRadius = 2;
    _text1.font = [UIFont systemFontOfSize:13.0];
    _text1.leftViewMode = UITextFieldViewModeAlways;
    _text1.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    _text1.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    _text1.delegate = self;
//    [_text1 addTarget:self action:@selector(text1BtnClick) forControlEvents:UIControlEventAllTouchEvents];
    [_mainView addSubview:_text1];
    
    UILabel *aftLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(8*screenScale+CGRectGetMaxX(_text1.frame), CGRectGetMinY(lbl1.frame), 25, 16)];
    aftLbl1.text = @"万元";
    aftLbl1.font = [UIFont systemFontOfSize:12.0];
    [_mainView addSubview:aftLbl1];

    
//    贷款期限
    UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(30*screenScale, 4+24+CGRectGetMaxY(lbl1.frame), 6, 6)];
    img2.image = [UIImage imageNamed:@"yellowstar"];
    [_mainView addSubview:img2];
    
    UILabel *lbl2 = [[UILabel alloc]initWithFrame:CGRectMake(2*screenScale+CGRectGetMaxX(img2.frame), 24+CGRectGetMaxY(lbl1.frame), 48+6, 16)];
    lbl2.text = @"贷款期限";
    lbl2.textAlignment = NSTextAlignmentRight;
    lbl2.font = [UIFont systemFontOfSize:12.0];
    [_mainView addSubview:lbl2];
    
    _text2 = [[UITextField alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(lbl2.frame), 11+CGRectGetMaxY(_text1.frame), 204*screenScale, 29)];
    
    if ([self.periodMax isEqualToString:@"NOEXIST"] || [self.periodMin isEqualToString:@"NOEXIST"]) {
        
        _text2.placeholder = @"贷款期限";
    }else{
    
        _text2.placeholder = [NSString stringWithFormat:@"可填期限%@-%@月",self.periodMin,self.periodMax];
    }
    
    _text2.layer.borderWidth = 1;
    _text2.layer.masksToBounds = YES;
    _text2.layer.cornerRadius = 2;
    _text2.font = [UIFont systemFontOfSize:13.0];
    _text2.leftViewMode = UITextFieldViewModeAlways;
    _text2.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    _text2.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    _text2.delegate = self;
//    [_text2 addTarget:self action:@selector(text2BtnClick) forControlEvents:UIControlEventAllTouchEvents];

    [_mainView addSubview:_text2];
    
    UILabel *aftLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(8*screenScale+CGRectGetMaxX(_text2.frame), CGRectGetMinY(lbl2.frame), 25, 16)];
    aftLbl2.text = @"个月";
    aftLbl2.font = [UIFont systemFontOfSize:12.0];
    [_mainView addSubview:aftLbl2];

    
    CGFloat otherW = CGRectGetMaxX(lbl1.frame);
//    您的信用情况
    UILabel *lbl3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 24+CGRectGetMaxY(lbl2.frame), otherW, 16)];
    lbl3.text = @"您的信用情况";
    lbl3.textAlignment = NSTextAlignmentRight;
    lbl3.font = [UIFont systemFontOfSize:12.0];
    [_mainView addSubview:lbl3];
    
    _text3 = [[PickViewTexttField alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(lbl3.frame), 11+CGRectGetMaxY(_text2.frame), 204*screenScale, 29)];
    _text3.placeholder = @"请选择";
    _text3.layer.borderWidth = 1;
    _text3.layer.masksToBounds = YES;
    _text3.layer.cornerRadius = 2;
    _text3.font = [UIFont systemFontOfSize:13.0];
    _text3.leftViewMode = UITextFieldViewModeAlways;
    _text3.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    _text3.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    _text3.delegate = self;
    _text3.dataArray = _arrPick3;
//    [_text3 addTarget:self action:@selector(text3BtnClick:) forControlEvents:UIControlEventAllEvents];
    [_mainView addSubview:_text3];

    
//    经营年限
    UILabel *lbl4 = [[UILabel alloc]initWithFrame:CGRectMake(0, 24+CGRectGetMaxY(lbl3.frame), otherW, 16)];
    lbl4.text = @"经营年限";
    lbl4.textAlignment = NSTextAlignmentRight;
    lbl4.font = [UIFont systemFontOfSize:12.0];
    [_mainView addSubview:lbl4];
    
    _text4 = [[PickViewTexttField alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(lbl4.frame), 11+CGRectGetMaxY(_text3.frame), 204*screenScale, 29)];
    _text4.placeholder = @"请选择";
    _text4.layer.borderWidth = 1;
    _text4.layer.masksToBounds = YES;
    _text4.layer.cornerRadius = 2;
    _text4.font = [UIFont systemFontOfSize:13.0];
    _text4.leftViewMode = UITextFieldViewModeAlways;
    _text4.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    _text4.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    _text4.delegate = self;
    _text4.dataArray = _arrPick4;
    
    [_mainView addSubview:_text4];

    
//    总经营流水/月
    UILabel *lbl5 = [[UILabel alloc]initWithFrame:CGRectMake(0, 24+CGRectGetMaxY(lbl4.frame), otherW, 16)];
    lbl5.text = @"总经营流水/月";
    lbl5.textAlignment = NSTextAlignmentRight;
    lbl5.font = [UIFont systemFontOfSize:12.0];
    [_mainView addSubview:lbl5];
    
    _text5 = [[PickViewTexttField alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(lbl5.frame), 11+CGRectGetMaxY(_text4.frame), 204*screenScale, 29)];
    _text5.placeholder = @"请选择";
    _text5.layer.borderWidth = 1;
    _text5.layer.masksToBounds = YES;
    _text5.layer.cornerRadius = 2;
    _text5.font = [UIFont systemFontOfSize:13.0];
    _text5.leftViewMode = UITextFieldViewModeAlways;
    _text5.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    _text5.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    _text5.delegate = self;
    _text5.dataArray = _arrPick5;
    
    [_mainView addSubview:_text5];

    
//    对公账户银行流水/月
    UILabel *lbl61 = [[UILabel alloc]initWithFrame:CGRectMake(0, 15+CGRectGetMaxY(lbl5.frame), otherW, 16)];
    lbl61.text = @"对公账户银行";
    lbl61.textAlignment = NSTextAlignmentRight;
    lbl61.font = [UIFont systemFontOfSize:12.0];
    [_mainView addSubview:lbl61];

    UILabel *lbl62 = [[UILabel alloc]initWithFrame:CGRectMake(0, 1+CGRectGetMaxY(lbl61.frame), otherW, 16)];
    lbl62.text = @"流水/月";
    lbl62.textAlignment = NSTextAlignmentRight;
    lbl62.font = [UIFont systemFontOfSize:12.0];
    [_mainView addSubview:lbl62];
    
    _text6 = [[PickViewTexttField alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(lbl5.frame), 11+CGRectGetMaxY(_text5.frame), 204*screenScale, 29)];
    _text6.placeholder = @"请选择";
    _text6.layer.borderWidth = 1;
    _text6.layer.masksToBounds = YES;
    _text6.layer.cornerRadius = 2;
    _text6.font = [UIFont systemFontOfSize:13.0];
    _text6.leftViewMode = UITextFieldViewModeAlways;
    _text6.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    _text6.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    _text6.delegate = self;
    _text6.dataArray = _arrPick6;
    [_mainView addSubview:_text6];
    
//    经营注册地
    UILabel *lbl7 = [[UILabel alloc]initWithFrame:CGRectMake(0, 15+CGRectGetMaxY(lbl62.frame), otherW, 16)];
    lbl7.text = @"经营注册地";
    lbl7.textAlignment = NSTextAlignmentRight;
    lbl7.font = [UIFont systemFontOfSize:12.0];
    [_mainView addSubview:lbl7];
    
    _text7 = [[UITextField alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(lbl5.frame), 11+CGRectGetMaxY(_text6.frame), 204*screenScale, 29)];
    _text7.placeholder = @"北京";
    _text7.layer.borderWidth = 1;
    _text7.layer.masksToBounds = YES;
    _text7.layer.cornerRadius = 2;
    _text7.font = [UIFont systemFontOfSize:13.0];
    _text7.leftViewMode = UITextFieldViewModeAlways;
    _text7.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    _text7.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    _text7.delegate = self;
//    [_text7 addTarget:self action:@selector(text7BtnClick) forControlEvents:UIControlEventAllTouchEvents];

    [_mainView addSubview:_text7];

    
//    名下房产类型
    UILabel *lbl8 = [[UILabel alloc]initWithFrame:CGRectMake(0, 24+CGRectGetMaxY(lbl7.frame), otherW, 16)];
    lbl8.text = @"名下房产类型";
    lbl8.textAlignment = NSTextAlignmentRight;
    lbl8.font = [UIFont systemFontOfSize:12.0];
    [_mainView addSubview:lbl8];
    
    _text8 = [[PickViewTexttField alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(lbl5.frame), 11+CGRectGetMaxY(_text7.frame), 204*screenScale, 29)];
    _text8.placeholder = @"请选择";
    _text8.layer.borderWidth = 1;
    _text8.layer.masksToBounds = YES;
    _text8.layer.cornerRadius = 2;
    _text8.font = [UIFont systemFontOfSize:13.0];
    _text8.leftViewMode = UITextFieldViewModeAlways;
    _text8.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    _text8.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    _text8.delegate = self;
    _text8.dataArray = _arrPick8;
    [_mainView addSubview:_text8];

    
//    名下是否有车
    UILabel *lbl9 = [[UILabel alloc]initWithFrame:CGRectMake(0, 24+CGRectGetMaxY(lbl8.frame), otherW, 16)];
    lbl9.text = @"名下是否有车";
    lbl9.textAlignment = NSTextAlignmentRight;
    lbl9.font = [UIFont systemFontOfSize:12.0];
    [_mainView addSubview:lbl9];
    
    _text9 = [[PickViewTexttField alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(lbl5.frame), 11+CGRectGetMaxY(_text8.frame), 204*screenScale, 29)];
    _text9.placeholder = @"请选择";
    _text9.layer.borderWidth = 1;
    _text9.layer.masksToBounds = YES;
    _text9.layer.cornerRadius = 2;
    _text9.font = [UIFont systemFontOfSize:13.0];
    _text9.leftViewMode = UITextFieldViewModeAlways;
    _text9.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    _text9.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    _text9.delegate = self;
    _text9.dataArray = _arrPick9;
    [_mainView addSubview:_text9];

    
//    联系人
    UIImageView *img10 = [[UIImageView alloc]initWithFrame:CGRectMake(30*screenScale, 4+24+CGRectGetMaxY(lbl9.frame), 6, 6)];
    img10.image = [UIImage imageNamed:@"yellowstar"];
    [_mainView addSubview:img10];
    
    UILabel *lbl10 = [[UILabel alloc]initWithFrame:CGRectMake(2*screenScale+CGRectGetMaxX(img10.frame), 24+CGRectGetMaxY(lbl9.frame), 48+6, 16)];
    lbl10.text = @"联系人";
    lbl10.textAlignment = NSTextAlignmentRight;
    lbl10.font = [UIFont systemFontOfSize:12.0];
    [_mainView addSubview:lbl10];
    
    _text10 = [[UITextField alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(lbl2.frame), 11+CGRectGetMaxY(_text9.frame), 204*screenScale, 29)];
    
    if ([[USER_DEFAULTS objectForKey:@"contacts"]isEqualToString:@""] || ![USER_DEFAULTS objectForKey:@"contacts"]) {
        
//        _text10.text = [NSString stringWithFormat:@"%@",[USER_DEFAULTS objectForKey:@"contacts"]];
        _text10.placeholder = @"联系人";
    }else{
//    _text10.placeholder = @"联系人";
        _text10.text = [NSString stringWithFormat:@"%@",[USER_DEFAULTS objectForKey:@"contacts"]];

    }
    _text10.layer.borderWidth = 1;
    _text10.layer.masksToBounds = YES;
    _text10.layer.cornerRadius = 2;
    _text10.font = [UIFont systemFontOfSize:13.0];
    _text10.leftViewMode = UITextFieldViewModeAlways;
    _text10.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    _text10.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    _text10.delegate = self;

    [_mainView addSubview:_text10];

    
//    手机号码
    UIImageView *img11 = [[UIImageView alloc]initWithFrame:CGRectMake(30*screenScale, 4+24+CGRectGetMaxY(lbl10.frame), 6, 6)];
    img11.image = [UIImage imageNamed:@"yellowstar"];
    [_mainView addSubview:img11];
    
    UILabel *lbl11 = [[UILabel alloc]initWithFrame:CGRectMake(2*screenScale+CGRectGetMaxX(img10.frame), 24+CGRectGetMaxY(lbl10.frame), 48+6, 16)];
    lbl11.text = @"手机号码";
    lbl11.textAlignment = NSTextAlignmentRight;
    lbl11.font = [UIFont systemFontOfSize:12.0];
    [_mainView addSubview:lbl11];
    
    _text11 = [[UITextField alloc]initWithFrame:CGRectMake(16*screenScale+CGRectGetMaxX(lbl2.frame), 11+CGRectGetMaxY(_text10.frame), 204*screenScale, 29)];
    
    if ([[USER_DEFAULTS objectForKey:@"mobile"]isEqualToString:@""] || ![USER_DEFAULTS objectForKey:@"mobile"]) {
        
        _text11.placeholder = @"请输入手机号";
//        _text11.text = [NSString stringWithFormat:@"%@",[USER_DEFAULTS objectForKey:@"mobile"]];
    }else{

        _text11.text = [NSString stringWithFormat:@"%@",[USER_DEFAULTS objectForKey:@"mobile"]];
//        _text11.placeholder = @"请输入手机号";
    }
    
    _text11.layer.borderWidth = 1;
    _text11.layer.masksToBounds = YES;
    _text11.layer.cornerRadius = 2;
    _text11.font = [UIFont systemFontOfSize:13.0];
    _text11.leftViewMode = UITextFieldViewModeAlways;
    _text11.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    _text11.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    _text11.delegate = self;

    [_mainView addSubview:_text11];

    
    
    
//    申请按钮
    _applyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _applyBtn.frame = CGRectMake((screenWidth-340*screenScale)/2.0, 18*screenScale+CGRectGetMaxY(_mainView.frame), 340*screenScale, 35*screenScale);
    _applyBtn.backgroundColor = BLUE_COLOR;
    [_applyBtn setTitle:@"提交申请" forState:UIControlStateNormal];
    _applyBtn.layer.masksToBounds = YES;
    _applyBtn.layer.cornerRadius = 2;
    [_applyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_applyBtn addTarget:self action:@selector(applyjrBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _applyBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_scrollView addSubview:_applyBtn];
    
    _adminBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _adminBtn.frame = CGRectMake(124*screenScale, 17*screenScale+CGRectGetMaxY(_applyBtn.frame), 18, 18);
    _adminBtn.layer.masksToBounds = YES;
    _adminBtn.layer.cornerRadius = 18/2.0;
    _adminBtn.backgroundColor = [UIColor cyanColor];
    self.adminBtnFlag = 0;
    [_adminBtn setBackgroundImage:[UIImage imageNamed:@"对jr"] forState:UIControlStateNormal];
    [_adminBtn addTarget:self action:@selector(adminBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_adminBtn];
    
//    查看条款
    _tiaokuanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _tiaokuanBtn.frame = CGRectMake(6*screenScale+CGRectGetMaxX(_adminBtn.frame), 19*screenScale+CGRectGetMaxY(_applyBtn.frame), 120, 14);
    [_tiaokuanBtn setTitle:@"同意中发智造服务条款" forState:UIControlStateNormal];
    [_tiaokuanBtn setTitleColor:[UIColor colorWithHexString:@"#4A4A4A"] forState:UIControlStateNormal];
    _tiaokuanBtn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    [_tiaokuanBtn addTarget:self action:@selector(tiaokuanBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_tiaokuanBtn];
    
    
}

#pragma mark - 点击事件


- (void)applyjrBtnClick{

    if (self.adminBtnFlag == 1) {
        
        [WKProgressHUD popMessage:@"请同意服务条款" inView:self.view duration:HUD_DURATION animated:YES];
    }
    
   else if ([_text1.text isEqualToString:@""]) {
        [WKProgressHUD popMessage:@"请输入贷款金额" inView:self.view duration:HUD_DURATION animated:YES];
    }
   else if ([_text2.text isEqualToString:@""]){
   
       [WKProgressHUD popMessage:@"请输入贷款期限" inView:self.view duration:HUD_DURATION animated:YES];
   }
   else if ([_text10.text isEqualToString:@""]){
   
       [WKProgressHUD popMessage:@"请输入联系人" inView:self.view duration:HUD_DURATION animated:YES];
   }
   else if ([_text11.text isEqualToString:@""]){
   
    [WKProgressHUD popMessage:@"请输入手机号码" inView:self.view duration:HUD_DURATION animated:YES];
   }
   else if (![_text11.text isMobileNumber] ){
   
       [WKProgressHUD popMessage:@"请输入正确手机号码" inView:self.view duration:HUD_DURATION animated:YES];
       
   }
   else if ([_text1.text compare:@"0"]<=0 || [self isPureInt:_text1.text]==NO){
   
       [WKProgressHUD popMessage:@"请输入正确贷款金额" inView:self.view duration:HUD_DURATION animated:YES];
   }

   else if (![self.moneyMin isEqualToString:@"NOEXIST"]  && [_text1.text compare:self.moneyMin options:NSNumericSearch]<0){


           [WKProgressHUD popMessage:@"贷款金额低于范围" inView:self.view duration:HUD_DURATION animated:YES];
       
   }
   else if (![self.moneyMax isEqualToString:@"NOEXIST"] && [_text1.text compare:self.moneyMax options:NSNumericSearch]>0){
       
       [WKProgressHUD popMessage:@"贷款金额超出范围" inView:self.view duration:HUD_DURATION animated:YES];
       
   }
    
       
   else if ([_text2.text compare:@"0"]<=0 || [self isPureInt:_text2.text]==NO){
       
           [WKProgressHUD popMessage:@"请输入正确贷款期限" inView:self.view duration:HUD_DURATION animated:YES];
       
   }
   else if (![self.periodMin isEqualToString:@"NOEXIST"] &&[_text2.text compare:self.periodMin options:NSNumericSearch]<0){

           [WKProgressHUD popMessage:@"贷款期限小于范围" inView:self.view duration:HUD_DURATION animated:YES];
       
   }
   else if (![self.periodMax isEqualToString:@"NOEXIST"] && [_text2.text compare:self.periodMax options:NSNumericSearch]>0){
       
           [WKProgressHUD popMessage:@"贷款期限超出范围" inView:self.view duration:HUD_DURATION animated:YES];
       
   }


    else{
        
        if ([_text3.text isEqualToString:@"请选择"]) {
            
            _text3.text = @"";
        }
        
        if ([_text4.text isEqualToString:@"请选择"]) {
            
            _text4.text = @"";
        }
        
        if ([_text5.text isEqualToString:@"请选择"]) {
            
            _text5.text = @"";
        }
        
        if ([_text6.text isEqualToString:@"请选择"]) {
            
            _text6.text = @"";
        }
        
        if ([_text8.text isEqualToString:@"请选择"]) {
            
            _text8.text = @"";
        }
        
        if ([_text9.text isEqualToString:@"请选择"]) {
            
            _text9.text = @"";
        }
        
        NSDictionary *parameters = @{@"dkje":_text1.text,@"dkqx":_text2.text,@"credit":_text3.text,@"jynx":_text4.text,@"zjyls":_text5.text,@"dgyhls":_text6.text,@"address":_text7.text,@"sffc":_text8.text,@"sfyc":_text9.text,@"contacts":_text10.text,@"mobile":_text11.text,@"fid":self.fid};
        
        
        [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,FINANCE_APPLY] parameters:parameters success:^(id response) {
            
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

- (void)specialBtnClick{

//    _specialView.frame = CGRectZero;
    _specialView.hidden = YES;
//    _specialView.clipsToBounds = YES;
    
    _mainView.mj_y = CGRectGetMaxY(_headView.frame)+8;
    
    _scrollView.contentSize = CGSizeMake(screenWidth, 765+72*screenScale-CGRectGetHeight(_specialView.frame));
    _applyBtn.frame = CGRectMake((screenWidth-340*screenScale)/2.0, 18*screenScale+CGRectGetMaxY(_mainView.frame), 340*screenScale, 35*screenScale);
    _adminBtn.frame = CGRectMake(124*screenScale, 17*screenScale+CGRectGetMaxY(_applyBtn.frame), 18, 18);
    _tiaokuanBtn.frame = CGRectMake(6*screenScale+CGRectGetMaxX(_adminBtn.frame), 19*screenScale+CGRectGetMaxY(_applyBtn.frame), 120, 14);
    
}

- (void)adminBtnClick{

    if (self.adminBtnFlag == 0) {
        
        [_adminBtn setBackgroundImage:[UIImage imageNamed:@"关闭jr"] forState:UIControlStateNormal];
        
        self.adminBtnFlag = 1;
    }else{
        
       [_adminBtn setBackgroundImage:[UIImage imageNamed:@"对jr"] forState:UIControlStateNormal];
        self.adminBtnFlag = 0;
    }
}

- (void)tiaokuanBtnClick{

    NSString *str = @"http://www.cecb2b.com/zt/register/FinanceAgree.html";
    WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:str title:@"金融平台服务条款与隐私政策"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


//判断string是否全为数字
- (BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
