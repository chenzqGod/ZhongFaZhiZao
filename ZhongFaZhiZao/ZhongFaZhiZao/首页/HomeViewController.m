//
//  HomeViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/7.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "UIImageView+WebCache.h"

#import "WKWebViewViewController.h"

#import "SearchViewController.h"
#import "AskViewController.h"
#import "KnowLedgeViewController.h"

#import "SupplyCollectionViewCell.h"
#import "ScienceCollectionViewCell.h"
#import "KnowledgeCollectionViewCell.h"
#import "IntelligenceCollectionViewCell.h"
#import "SolveCollectionViewCell.h"
#import "ElectronicCollectionViewCell.h"
#import "KnowLedgeCustomCollectionViewCell.h"
#import "SupplyScrollCollectionViewCell.h"
#import "CommitKnowledgeViewController.h"
#import "DCWebImageManager.h"

#import "ZYJHeadLineView.h"
#import "ZYJHeadLineModel.h"
#import "FinanceViewController.h"
#import "FinanceCollectionViewCell.h"
#import "FinanceDetailOneViewController.h"
#import "FinanceDetailTwoViewController.h"

#import "QRcodeViewController.h"
#import "ZBarcodeViewController.h"
#import "QRCodeReaderViewController.h"

#define margins 8

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate,QRCodeReaderDelegate>{

    UICollectionViewFlowLayout *_flowLayout;
    
    NSMutableArray *_adid41Arr;  //广告位41
    NSMutableArray *_adid44Arr;  //广告位44
    NSMutableArray *_scrollImg;
    NSMutableArray *_scrollTxt;
    NSMutableArray *_cityArray;
    NSMutableDictionary *_cityDict;
    
    CustomScrollView *_mainscrollView;
    
    UIButton *_fifButton;
    
    UIScrollView *_scrollView;
    
}

@property (nonatomic,assign) NSInteger cityNumber;
//上下滚动广告栏
@property (nonatomic,strong) ZYJHeadLineView *TopLineView;
@property(nonatomic,strong)NSMutableArray*dataArr;

@end

@implementation HomeViewController


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
   self.tabBarController.tabBar.hidden=NO;
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _dataArr=[[NSMutableArray alloc]init];
    self.cityNumber = 0;
    
    self.view.backgroundColor = BACK_COLOR;

    self.edgesForExtendedLayout = UIRectEdgeNone;

    _adid41Arr = [[NSMutableArray alloc]init];
    _adid44Arr = [[NSMutableArray alloc]init];
    _cityArray = [[NSMutableArray alloc]init];
    _cityDict = [[NSMutableDictionary alloc]init];
    
    [self createHeaderView];

    [self loadadData];
    
    _scrollImg = [[NSMutableArray alloc]init];
    _scrollTxt = [[NSMutableArray alloc]init];

//    [self createHeaderView];
    
//    [self createCollectionHeader];
    
    [self createCollectionView];
    
    [self createNavgationView];

    [self loadCityData];

}

#pragma mark-获取数据
- (void)getHotData
{
    NSArray *arr3 = [NSArray arrayWithArray:_scrollTxt];
    for (int i=0; i<arr3.count; i++) {
        ZYJHeadLineModel *model = [[ZYJHeadLineModel alloc]init];
        model.type = @"HOT";
        model.title = arr3[i];
        [_dataArr addObject:model];
    }
    [_TopLineView setVerticalShowDataArr:_dataArr];
}

#pragma mark - loadData
- (void)loadadData{
    
    [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,AD_API] parameters:nil success:^(id response) {
        
        if ([response[@"resultCode"]integerValue] == 1000) {
            
            _adid41Arr = [NSMutableArray arrayWithArray:response[@"data"][@"ad_id_41"]];
            
            _adid44Arr = [NSMutableArray arrayWithArray:response[@"data"][@"ad_id_44"]];
            
            for (int i = 0; i < _adid41Arr.count; i++) {
                
                [_scrollImg addObject:[NSString stringWithFormat:@"%@",_adid41Arr[i][@"img_path"]]];
                
            }

            [_mainscrollView setImageData:_scrollImg];
            
            for (int i = 0; i < _adid44Arr.count; i++) {
                
                [_scrollTxt addObject:[NSString stringWithFormat:@"%@",_adid44Arr[i][@"txt"]]];
            }
            
              [self getHotData];

        }
        else if ([response[@"resultCode"]integerValue] == 1001){
        
             [WKProgressHUD popMessage:@"广告位请求失败" inView:self.view duration:HUD_DURATION animated:YES];
        }
        
        
    } failure:^(NSString *error) {
        
        NSLog(@"error = %@",error);
        
        [WKProgressHUD popMessage:@"请检查网络连接" inView:self.view duration:HUD_DURATION animated:YES];

    }];
        
}


- (void)loadCityData{
    
    [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,Electronic_API] parameters:nil success:^(id response) {
        
        if ([response[@"resultCode"]integerValue] == 1000) {
            
            _cityDict = [NSMutableDictionary dictionaryWithDictionary:response[@"data"]];
            
            if (self.cityNumber == 3) {
                _cityArray = [NSMutableArray arrayWithArray:_cityDict[@"深圳"]];
            }
            else if (self.cityNumber == 1){
            _cityArray = [NSMutableArray arrayWithArray:_cityDict[@"北京"]];
            }
            else if (self.cityNumber == 2){
            _cityArray = [NSMutableArray arrayWithArray:_cityDict[@"西安"]];
            }
            else{
            
                _cityArray = [NSMutableArray arrayWithArray:_cityDict[@"全部"]];
            }
            
            NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:6];
            
            [UIView performWithoutAnimation:^{
                
                [self.collectionView reloadSections:indexSet];

            }];
            
                    }
        else if ([response[@"resultCode"]integerValue] == 1001){
            
            [WKProgressHUD popMessage:@"电子市场请求失败" inView:self.view duration:HUD_DURATION animated:YES];
        }
        

        
        
    } failure:^(NSString *error) {
       
        
    }];
    
}

#pragma mark - 创建UI
- (void)createNavgationView {

    self.navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64)];
    self.navigationView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bar"]];

    [self.view addSubview:self.navigationView];
    
        UIButton *QRcode = [UIButton buttonWithType:UIButtonTypeCustom];
        QRcode.frame = CGRectMake(14, 24+(59/2.0-57/2.0)/2.0, 59/2.0, 57/2.0);
        QRcode.backgroundColor = [UIColor clearColor];
        [QRcode setBackgroundImage:[UIImage imageNamed:@"扫一扫"] forState:UIControlStateNormal];
        QRcode.imageView.frame = QRcode.bounds;
        QRcode.hidden = NO;
        [QRcode addTarget:self action:@selector(scanning) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:QRcode];
    
    self.pushSerchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.pushSerchBtn.frame = CGRectMake(59*screenScale, 24, 539/2.0*screenScale, 59/2.0);
    self.pushSerchBtn.backgroundColor = [UIColor clearColor];
    [self.pushSerchBtn setBackgroundImage:[UIImage imageNamed:@"搜素"] forState:UIControlStateNormal];

    self.pushSerchBtn.imageView.frame = self.pushSerchBtn.bounds;
    self.pushSerchBtn.hidden = NO;
    [self.pushSerchBtn setEnabled:YES];
    [self.pushSerchBtn addTarget:self action:@selector(SearchButtonPush) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.pushSerchBtn];
    
//    self.pushSerchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.pushSerchBtn.frame = CGRectMake(13*screenScale, 24, 630/2.0*screenScale, 59/2.0);
//    self.pushSerchBtn.backgroundColor = [UIColor clearColor];
//    [self.pushSerchBtn setBackgroundImage:[UIImage imageNamed:@"搜素img"] forState:UIControlStateNormal];
//    
//    self.pushSerchBtn.imageView.frame = self.pushSerchBtn.bounds;
//    self.pushSerchBtn.hidden = NO;
//    [self.pushSerchBtn setEnabled:YES];
//    [self.pushSerchBtn addTarget:self action:@selector(SearchButtonPush) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:self.pushSerchBtn];
    
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.frame = CGRectMake(screenWidth-20*screenScale-14*screenScale, 24+(59/2.0-24)/2.0, 20*screenScale, 27);
    pushBtn.backgroundColor = [UIColor clearColor];
    [pushBtn setBackgroundImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
    pushBtn.imageView.frame = pushBtn.bounds;
    pushBtn.hidden = NO;
    [pushBtn addTarget:self action:@selector(jPushButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pushBtn];
    
    
}

//collectionView最上面Header
- (void)createHeaderView{

    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 180*screenScale+8+40+164+80*screenScale+8)];
    self.headerView.backgroundColor = BACK_COLOR;
    [self.view addSubview:self.headerView];
    
    
    _mainscrollView = [[CustomScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 180*screenScale)];
    __weak HomeViewController *weakself = self;
    
    [_mainscrollView setImageViewDidTapAtIndex:^(NSInteger index) {
        
        [weakself turntoWebView:index];

        
    }];
    
    _mainscrollView.placeImage = [UIImage imageNamed:@"banner"];
    _mainscrollView.AutoScrollDelay = 5.0f;
    _mainscrollView.style = PageControlAtCenter;

    [self.headerView addSubview:_mainscrollView];
    
    [[DCWebImageManager shareManager] setDownloadImageRepeatCount:1];
    [[DCWebImageManager shareManager] setDownLoadImageError:^(NSError *error, NSString *url) {
        NSLog(@"%@",error);
    }];

    
    self.adView = [[UIView alloc]initWithFrame:CGRectMake(0, 8+CGRectGetMaxY(_mainscrollView.frame), screenWidth, 40)];
    self.adView.backgroundColor = [UIColor whiteColor];
    [self.headerView addSubview:self.adView];
    
//    行业热点logo
    UIImageView *hotDianImg = [[UIImageView alloc]initWithFrame:CGRectMake(margins, (40-25)/2.0+1, 91, 25)];
    hotDianImg.image = [UIImage imageNamed:@"行业热点logo"];
    [self.adView addSubview:hotDianImg];
   
    UILabel *hangyeLine = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(hotDianImg.frame)+7, (40 - 25)/2.0, 1.5, 25)];
    hangyeLine.backgroundColor = TEXT_LINE_COLOR;
    [self.adView addSubview:hangyeLine];
    
    _TopLineView = [[ZYJHeadLineView alloc]initWithFrame:CGRectMake(2+CGRectGetMaxX(hangyeLine.frame), 0, screenWidth-margins-(7+CGRectGetMaxX(hangyeLine.frame)), 40)];
//    _TopLineView.center = CGPointMake(ScreenWidth/2.0, ScreenHeight/2.0-150);
    _TopLineView.backgroundColor = [UIColor whiteColor];
    __weak __typeof(self)weakSelf = self;
    _TopLineView.clickBlock = ^(NSInteger index){
        ZYJHeadLineModel *model = weakSelf.dataArr[index];
        NSLog(@"%@,%@",model.type,model.title);
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@",_adid44Arr[index][@"url"]] title:@"广告"];
        
        [self.navigationController pushViewController:vc animated:YES];
    };
    [self.adView addSubview:_TopLineView];
    
    UILabel *lineLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.adView.frame)-1, screenWidth, 1)];
    lineLabel1.backgroundColor = TEXT_LINE_COLOR;
    [self.headerView addSubview:lineLabel1];

    self.mainBtnView = [[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(_mainscrollView.frame)+40+8 , screenWidth, 164)];
    self.mainBtnView.backgroundColor = [UIColor whiteColor];
    [self.headerView addSubview:self.mainBtnView];

  
    NSArray *mainBtnImageArr = @[@"供应链icon",@"智能创新icon",@"科技成果icon",@"解决方案icon",@"产权专利icon",@"金融icon"];
    NSArray *mainBtnArr = @[@"供应链采购",@"智能创新",@"科技成果",@"解决方案",@"知识产权专利",@"金融服务"];
    
    int flag = 0;
    
    for (int i = 0; i < 3; i++) {
        
        for (int j = 0; j < 2; j++) {
            
            self.mainBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.mainBtn.frame = CGRectMake(i*48+(i*2+1.0)*(screenWidth-48*3)/6.0, 48*j+10+j*30.0, 48, 48);
            [self.mainBtn setImage:[UIImage imageNamed:mainBtnImageArr[flag]] forState:UIControlStateNormal];
            self.mainBtn.tag = flag+1000;
            self.mainBtn.layer.masksToBounds = YES;
            self.mainBtn.layer.cornerRadius = 48/2.0;
            self.mainBtn.backgroundColor = [UIColor whiteColor];
            [self.mainBtn addTarget:self action:@selector(mainButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.mainBtnView addSubview:self.mainBtn];
            
            
            UILabel *mainLbl = [[UILabel alloc]initWithFrame:CGRectMake(i*screenWidth/3.0, CGRectGetMaxY(self.mainBtn.frame)+4, screenWidth/3.0, 14)];
            mainLbl.text = mainBtnArr[flag];
            mainLbl.textAlignment = NSTextAlignmentCenter;
            mainLbl.font = [UIFont systemFontOfSize:11.0];
            [self.mainBtnView addSubview:mainLbl];
            
            flag++;
            
        }
        
    }
    
    
    UIImageView *firstImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.mainBtnView.frame)+8, screenWidth, 80*screenScale)];
    firstImg.image = [UIImage imageNamed:@"供bar"];
    firstImg.userInteractionEnabled = YES;
    [firstImg addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GongbuttonClick)]];
    
    [self.headerView addSubview:firstImg];
    
}

- (void) turntoWebView:(NSInteger )index {
    WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@",_adid41Arr[index][@"url"]] title:@"广告"];
    
    [self.navigationController pushViewController:vc animated:YES];

}
#pragma mark - collectionView
-(void)createCollectionView
{
    _flowLayout= [[UICollectionViewFlowLayout alloc] init];
    //设置滚动方向
    _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置headerView尺寸大小
    _flowLayout.headerReferenceSize = CGSizeMake(screenWidth, 180*screenScale+8+40+164);
    
//    _flowLayout.itemSize 
    
//    _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake( 0, 0, screenWidth, screenHeight-49) collectionViewLayout:_flowLayout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = BACK_COLOR;
    
    //    下拉刷新、上拉加载
//    _collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        //Call this Block When enter the refresh status automatically
//        
//        self.pageIndex = 1;
//        [self loadData];
//        
//        [_collectionView.header endRefreshing];
//        
//    }];
//    
//    _collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        //Call this Block When enter the refresh status automatically
//        
//        self.pageIndex++;
//        [self loadData];
//        
//        [_collectionView.footer endRefreshing];
//        
//    }];

    
    //注册cell
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_collectionView registerClass:[SupplyScrollCollectionViewCell class] forCellWithReuseIdentifier:@"supplyScrcell"];
    [_collectionView registerClass:[SupplyCollectionViewCell class] forCellWithReuseIdentifier:@"supplycell"];
    [_collectionView registerClass:[KnowLedgeCustomCollectionViewCell class] forCellWithReuseIdentifier:@"knowcustomCell"];
     [_collectionView registerClass:[ScienceCollectionViewCell class] forCellWithReuseIdentifier:@"scienceCell"];
     [_collectionView registerClass:[IntelligenceCollectionViewCell class] forCellWithReuseIdentifier:@"intelligenceCell"];
     [_collectionView registerClass:[SolveCollectionViewCell class] forCellWithReuseIdentifier:@"solveCell"];
     [_collectionView registerClass:[ElectronicCollectionViewCell class] forCellWithReuseIdentifier:@"eletronicCell"];
    [_collectionView registerClass:[FinanceCollectionViewCell class] forCellWithReuseIdentifier:@"financeCell"];
    
    [_flowLayout setHeaderReferenceSize:CGSizeMake(screenWidth, _headerView.frame.size.height)];
    
    
    
    //注册header
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];

    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView1"];
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView2"];
    
        [self.view addSubview:_collectionView];
    
    
}


//collectionHeaderView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader &&indexPath.section == 0)
    {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        [headerView addSubview: self.headerView];
        
        reusableview = headerView;
    
        return reusableview;
    }
    
   else if (kind == UICollectionElementKindSectionHeader &&indexPath.section == 6 ) {
       
       UIView *fifView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 80*screenScale+53)];
       fifView.backgroundColor = BACK_COLOR;
       fifView.userInteractionEnabled = YES;
       
       UIImageView *fifImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 80*screenScale)];
       fifImg.image = [UIImage imageNamed:@"电子市场bar"];
       fifImg.userInteractionEnabled = YES;
       [fifView addSubview:fifImg];
     
       CGFloat fifBtnX = (screenWidth-78*4)/5.0;
       
       NSArray *fifArr = @[@"全部",@"北京",@"西安",@"深圳"];
       
       for (NSInteger i = 0; i < 4; i++) {
           
            _fifButton = [UIButton buttonWithType:UIButtonTypeCustom];
           
           _fifButton.frame = CGRectMake(78*i+(i+1)*fifBtnX, (53-25)/2.0+CGRectGetMaxY(fifImg.frame), 78, 25);
           [_fifButton setTitle:fifArr[i] forState:UIControlStateNormal];
           [_fifButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
//           [fifButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

           
           [_fifButton setTitleColor:TEXT_GREY_COLOR forState:UIControlStateNormal];
           
//           fifButton setBackgroundImage:[UIImage imwithco] forState:<#(UIControlState)#>
           _fifButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
           _fifButton.layer.masksToBounds = YES;
           _fifButton.layer.cornerRadius = 12;
           _fifButton.tag = 3000+i;
           [_fifButton addTarget:self action:@selector(fifBtnClick:) forControlEvents:UIControlEventTouchUpInside];
           
           
           
           [fifView addSubview:_fifButton];

           if (i == self.cityNumber ) {
               
               _fifButton.backgroundColor = BLUE_COLOR;
               self.tmpbtn = _fifButton;
               _fifButton.selected = YES;
               _fifButton.layer.borderWidth = 0;
               
           }else{
           
           _fifButton.backgroundColor = [UIColor whiteColor];
           _fifButton.layer.borderWidth = 1;
            _fifButton.layer.borderColor = TEXT_LINE_COLOR.CGColor;
           }

       }
       
       UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView2" forIndexPath:indexPath];
       
       [headerView addSubview: fifView];
       
       reusableview = headerView;
       
       return reusableview;
       
    }
    
    NSArray *collecHeaderArr = @[@"jrtitle",@"科技bar",@"产权专利bar",@"智能bar",@"解决方案bar",@"电子市场bar"];
    self.collectionHeaderView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 80*screenScale)];
    self.collectionHeaderView.image = [UIImage imageNamed:collecHeaderArr[indexPath.section-1]];
    self.collectionHeaderView.userInteractionEnabled = YES;
//    self.collectionHeaderView.tag = 50000+indexPath.section;
//    [self.collectionHeaderView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonClick:)]];
//    collectionView header 点击
    UIButton *collectHeaderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    collectHeaderBtn.frame = self.collectionView.frame;
    collectHeaderBtn.tag = 2000+indexPath.section;
    [collectHeaderBtn addTarget:self action:@selector(mainButtonClick2:) forControlEvents:UIControlEventTouchUpInside];
    
    collectHeaderBtn.enabled = YES;
    collectHeaderBtn.hidden = NO;
    [self.collectionHeaderView addSubview:collectHeaderBtn];
    
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView1" forIndexPath:indexPath];
    
    [headerView addSubview: self.collectionHeaderView];
    
    reusableview = headerView;
    
    return reusableview;
}



#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
 
    if (section == 0) {
        
        return 1;
        
    }
    else if (section == 1){
    
        return 3;
    }
    else if (section == 2){
    
        return 4;
    }
    else if (section == 3){
        
        return 8;
    
    }
    else if (section == 4){
        
        return 4;
    
    }
    else if (section == 5){
    
        return 3;
        
    }
    else if (section == 6){
    
        return _cityArray.count;
        
    }
    
    return 0;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 7;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    if (indexPath.section == 3 && indexPath.row < 6) {
        
        NSArray *knowCustomIcon = @[@"申请icon",@"分析icon",@"挖掘icon",@"数据库icon",@"预警icon",@"交易icon"];
        NSArray *konwCustomLabel = @[@"专利申请",@"专利分析",@"专利挖掘",@"数据库定制",@"专利预警",@"专利交易"];
        
        static NSString *knowCellIdent = @"knowcustomCell";
        
        KnowLedgeCustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:knowCellIdent forIndexPath:indexPath];
        
        cell.textLbl.text = konwCustomLabel[indexPath.row];
        cell.textLbl.font = [UIFont systemFontOfSize:13.0];
        
        cell.iconImg.image = [UIImage imageNamed:knowCustomIcon[indexPath.row]];
        
        cell.backgroundColor = [UIColor whiteColor];
        

        
        return cell;
        
    }
    
    else if (indexPath.section == 2){
    
        NSArray *section1Arr = @[@"Group 42",@"Group 43",@"Group 47",@"Group 46"];
        
        static NSString * CellIdentifier = @"scienceCell";
        ScienceCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        
        cell.ScienceImg.image = [UIImage imageNamed:section1Arr[indexPath.row]];
        
        return cell;

        
    }
    
  else  if (indexPath.section == 4) {
        
        static NSString * CellIdentifier = @"intelligenceCell";
        IntelligenceCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
      
        NSArray *section3Arr = @[@"智能1",@"智能2",@"智能3",@"智能4"];
        
        cell.IntelligenceImg.image =  [UIImage imageNamed:section3Arr[indexPath.row]];
        
        return cell;
        
    }
    
else if (indexPath.section == 3 && indexPath.row >= 6){
       
       static NSString * CellIdentifier = @"supplycell";
       SupplyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
        NSArray *section36Arr = @[@"Group 41",@"Group 40"];
        
        cell.SupplyImg.image = [UIImage imageNamed:section36Arr[indexPath.row-6]];
        
        return cell;
    }
    
else if (indexPath.section == 0){

    NSArray *section1 = @[@"Group 55",@"Group 54",@"Group 2",@"Group 4",@"Group 5"];
    
    static NSString * CellIdentifier = @"supplyScrcell";
    SupplyScrollCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];

    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 197*screenScale)];
    _scrollView.pagingEnabled = NO;
    _scrollView.bounces = NO;
    _scrollView.userInteractionEnabled = YES;
    //    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.backgroundColor = BACK_COLOR;
    _scrollView.contentSize = CGSizeMake(8*6+5*(screenWidth-24)/2.0, 0);
    [cell addSubview:_scrollView];

    
    for (int i = 0; i < 5; i++) {
        
        UIImageView *imageViewS = [[UIImageView alloc]init];
        imageViewS.frame = CGRectMake(8*(i+1)+i*(screenWidth-24)/2.0, 0, (screenWidth-24)/2.0, 197*screenScale);
        imageViewS.image = [UIImage imageNamed:section1[i]];
        imageViewS.userInteractionEnabled = YES;
        [_scrollView addSubview:imageViewS];
        
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame = CGRectMake(0, 6, CGRectGetWidth(imageViewS.frame), 30);
        btn1.tag = 10+i;
//        btn1.backgroundColor = [UIColor redColor];
        [btn1 addTarget:section1 action:@selector(cellBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [imageViewS addSubview:btn1];
        
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn2.frame = CGRectMake(0, 78, CGRectGetWidth(imageViewS.frame)/2.0,197*screenScale-78);
        btn2.tag = 20+i;
//        btn2.backgroundColor = [UIColor redColor];
        [btn2 addTarget:section1 action:@selector(cellBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [imageViewS addSubview:btn2];
        
        UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn3.frame = CGRectMake(CGRectGetWidth(imageViewS.frame)/2.0, 78, CGRectGetWidth(imageViewS.frame)/2.0, 197*screenScale-78);
        btn3.tag = 30+i;
//        btn3.backgroundColor = [UIColor blueColor];
        [btn3 addTarget:section1 action:@selector(cellBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [imageViewS addSubview:btn3];
        
    }


    return cell;

}
else if (indexPath.section == 5){
    
    
    static NSString * CellIdentifier = @"solveCell";
    SolveCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSArray *section4Arr = @[@"Group 51",@"Group 52",@"Group 50"];
    
    cell.SolveImg.image = [UIImage imageNamed:section4Arr[indexPath.row]];
    
    
    return cell;


}
else if (indexPath.section == 6){
    
    static NSString * CellIdentifier = @"eletronicCell";
    ElectronicCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
   
    [cell.ElectronicImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_cityArray[indexPath.row][@"small_pic"]]] placeholderImage:[UIImage imageNamed:@"默认图750"]];
    
    cell.mengbanLabel.text = [NSString stringWithFormat:@"%@",_cityArray[indexPath.row][@"center_name"]];

    cell.cityLabel.text = [NSString stringWithFormat:@"%@",_cityArray[indexPath.row][@"city"]];
    
   
    return cell;
}
    
else if (indexPath.section == 1){

    static NSString *CellIdentifier = @"financeCell";
    FinanceCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSArray *section4Arr = @[@"jrsumm1",@"jrsumm2",@"jrsumm3"];
    
    cell.FinanceImg.image = [UIImage imageNamed:section4Arr[indexPath.row]];
    
    
    return cell;
    

}
    
    static NSString * CellIdentifier = @"cell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];

    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return CGSizeMake(screenWidth, 197*screenScale);
    }
    else if (indexPath.section == 1){
        
        return CGSizeMake(screenWidth, 89*screenScale);
    }
    else if (indexPath.section == 2){
    
        return CGSizeMake((screenWidth-1)/2.0, 175*screenScale);
    }
    else if (indexPath.section == 3){
        
        if (indexPath.row <= 5){
            
        return CGSizeMake((screenWidth-1)/2.0, 45*screenScale);

        }
        
        return CGSizeMake((screenWidth-1)/2.0, 72*screenScale);
    }
    else if (indexPath.section == 4){
        
        return CGSizeMake((screenWidth-1)/2.0, 187*screenScale);
    }
    else if (indexPath.section == 5){
        
        return CGSizeMake(screenWidth, 113*screenScale);
    
    }
    else if (indexPath.section == 6){
        
        return CGSizeMake(screenWidth, 141*screenScale);
    
    }
    
    return CGSizeZero;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        
//      return UIEdgeInsetsMake(margins, margins, margins, margins);
        
        return UIEdgeInsetsMake(margins, 0, margins, 0);
        
    }
    else if (section == 1){
        
        return UIEdgeInsetsMake(0, 0, margins, 0);
    }
    else if (section == 2){
        
        return UIEdgeInsetsMake(0, 0, margins, 0);
    }
    else if (section == 3){
        
        return UIEdgeInsetsMake(0, 0, margins, 0);
        
    }
    else if (section == 4){
        
        return UIEdgeInsetsMake(0, 0, margins, 0);
        
    }
    else if (section == 5){
        
        return UIEdgeInsetsMake(0, 0, margins, 0);
        
    }
    else if (section == 6){
        
        return UIEdgeInsetsMake(0, 0, margins, 0);
        
        
    }

    return UIEdgeInsetsZero;


//     UIEdgeInsets insets = {top, left, bottom, right};
}

#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0){
    
        if (indexPath.row == 0) {
            
        }
        else if (indexPath.row == 1){
        
        }
        else if (indexPath.row == 2){
        
        }
        else if (indexPath.row == 3){
        
        }
        else if (indexPath.row == 4){
        
        }
        
    }
    
    else if (indexPath.section == 1){
    
        if (indexPath.row == 0) {
            
            FinanceDetailTwoViewController *vc = [[FinanceDetailTwoViewController alloc]init];
            vc.fid = @"5644084";
            [self.navigationController pushViewController:vc animated:YES];

        }
        else if (indexPath.row == 1){
        
            FinanceDetailOneViewController *vc = [[FinanceDetailOneViewController alloc]init];
            vc.fid = @"5643684";
            [self.navigationController pushViewController:vc animated:YES];

        }
        
        else if (indexPath.row == 2){
        
            FinanceDetailOneViewController *vc = [[FinanceDetailOneViewController alloc]init];
            vc.fid = @"5537071";
            [self.navigationController pushViewController:vc animated:YES];

        }
    }
    else if (indexPath.section == 2){
        
        if (indexPath.row == 0) {
            
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/5644790?corpId="title:@"商品详情页"];
            
            
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 1){
        
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/5644784?corpId=123"title:@"商品详情页"];
            [self.navigationController pushViewController:vc animated:YES];

            
        }
        else if (indexPath.row == 2){
           
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/5644765?corpId=123"title:@"商品详情页"];
            [self.navigationController pushViewController:vc animated:YES];

            
        }
        else if (indexPath.row == 3){
        
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/5644788?corpId=123"title:@"商品详情页"];
            [self.navigationController pushViewController:vc animated:YES];

            
        }
        
    }
    else if (indexPath.section == 3 && indexPath.row <= 5) {
        
        NSArray *typeID = @[@"80004010",@"80004070",@"80004020",@"80004090",@"80004060",@"80004080"];
        
        CommitKnowledgeViewController *vc = [[CommitKnowledgeViewController alloc]init];
        vc.typeId = typeID[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }

    else if (indexPath.section == 3 && indexPath.row >5){
        
        if (indexPath.row == 6) {
            
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/5644823?corpId=123"title:@"商品详情页"];
            [self.navigationController pushViewController:vc animated:YES];

        }
        else if (indexPath.row == 7){
        
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/5644825?corpId=123"title:@"商品详情页"];
            [self.navigationController pushViewController:vc animated:YES];

        }
    
    }
    else if (indexPath.section == 4){
        
        if (indexPath.row == 0) {
            
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/5644276?corpId=444820"title:@"商品详情页"];
            
            
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 1){
            
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/5644271?corpId=444820"title:@"商品详情页"];
            [self.navigationController pushViewController:vc animated:YES];
            
            
        }
        else if (indexPath.row == 2){
            
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/5644284?corpId=444820"title:@"商品详情页"];
            [self.navigationController pushViewController:vc animated:YES];
            
            
        }
        else if (indexPath.row == 3){
            
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/5644277?corpId=444820"title:@"商品详情页"];
            [self.navigationController pushViewController:vc animated:YES];
            
            
        }

    
    }
    else if (indexPath.section == 5){
        
        if (indexPath.row == 0) {
            
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/5534283?corpId=444064"title:@"商品详情页"];
            
            
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 1){
            
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/5534303?corpId=444078"title:@"商品详情页"];
            [self.navigationController pushViewController:vc animated:YES];
            
            
        }
        else if (indexPath.row == 2){
            
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/5534387?corpId=444166"title:@"商品详情页"];
            [self.navigationController pushViewController:vc animated:YES];
            
            
        }
    
    }
    else if (indexPath.section == 6){
    
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@",_cityArray[indexPath.row][@"url"]] title:@"商品详情页"];
        [self.navigationController pushViewController:vc animated:YES];

        
    }
    
}


-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//设置页头高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        
        return CGSizeMake(screenWidth, 180*screenScale+8+40+164+80*screenScale+8);
    }
    else if (section == 6){
    
        return CGSizeMake(screenWidth, 80*screenScale+53);
    }
    return CGSizeMake(screenWidth, 80*screenScale);
}

//设置页尾高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{

    return CGSizeMake(0, 0);
}


//设置每个item水平间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 10;
//}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}


//ayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 0.0f;
//}


//设置collectionView间距最小值
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0f;
}



#pragma mark - 点击事件


//cellBtnClick

- (void)cellBtnClick:(UIButton *)button{

    
    if (button.tag == 10) {
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/200890/index"title:@"商品详情页"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (button.tag == 20) {
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/icInfo/10498233?corpId=200890"title:@"商品详情页"];
                [self.navigationController pushViewController:vc animated:YES];
        
        
    }
    else if (button.tag == 30){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/icInfo/10498212?corpId=200890"title:@"商品详情页"];
                [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if (button.tag == 11){
       
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/204505/index"title:@"商品详情页"];
        [self.navigationController pushViewController:vc animated:YES];

        
    }
    
    else if (button.tag == 21){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/4717332?corpId=204505"title:@"商品详情页"];
                [self.navigationController pushViewController:vc animated:YES];
        
        
    }
    else if (button.tag == 31){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/4717330?corpId=204505"title:@"商品详情页"];
                [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if (button.tag == 12){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/344123/index"title:@"商品详情页"];
        [self.navigationController pushViewController:vc animated:YES];

    }
    
    else if (button.tag == 22){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/4860411?corpId=344123"title:@"商品详情页"];
                [self.navigationController pushViewController:vc animated:YES];
        
        
    }
    else if (button.tag == 32){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/icInfo/174637559?corpId=344123"title:@"商品详情页"];
                [self.navigationController pushViewController:vc animated:YES];
        
    }
    
    else if (button.tag == 13){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/312281/index"title:@"商品详情页"];
        [self.navigationController pushViewController:vc animated:YES];

        
    }
    
    else if (button.tag == 23){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/4803560?corpId=312281"title:@"商品详情页"];
                [self.navigationController pushViewController:vc animated:YES];
        
        
    }
    else if (button.tag == 33){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/4837211?corpId=312281"title:@"商品详情页"];
                [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if (button.tag == 14){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/205170/index"title:@"商品详情页"];
        [self.navigationController pushViewController:vc animated:YES];

    }
    
    else if (button.tag == 24){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/4993916?corpId=205170"title:@"商品详情页"];
                [self.navigationController pushViewController:vc animated:YES];
        
        
    }
    else if (button.tag == 34){
        
        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://wap.cecb2b.com/corp/nicInfo/4993348?corpId=205170"title:@"商品详情页"];
                [self.navigationController pushViewController:vc animated:YES];
        
    }

}

//扫一扫
- (void)scanning{
    
//    QRcodeViewController *QRvc = [[QRcodeViewController alloc]init];
//    [self.navigationController pushViewController:QRvc animated:YES];
    
//    [WKProgressHUD popMessage:@"敬请期待" inView:self.view duration:HUD_DURATION animated:YES];

    QRCodeReaderViewController *reader = [QRCodeReaderViewController new];\
    reader.modalPresentationStyle = UIModalPresentationFormSheet;
    reader.delegate = self;
    
    __weak typeof (self) wSelf = self;
    [reader setCompletionWithBlock:^(NSString *resultAsString) {
        [wSelf.navigationController popViewControllerAnimated:YES];
        [[[UIAlertView alloc] initWithTitle:@"" message:resultAsString delegate:self cancelButtonTitle:@"好的" otherButtonTitles: nil] show];
    }];
    
    //[self presentViewController:reader animated:YES completion:NULL];
    [self.navigationController pushViewController:reader animated:YES];
}

#pragma mark - QRCodeReader Delegate Methods

- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result
{
    [self dismissViewControllerAnimated:YES completion:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"QRCodeReader" message:result delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }];
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader
{
    [self.navigationController popViewControllerAnimated:YES];
}

//jpush消息
- (void)jPushButton{

    AskViewController *vc = [[AskViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

//6个圆形按钮点击事件
- (void)mainButtonClick:(UIButton *)button{
    
    
    if (button.tag == Supply ) {
        
        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SUPPLY_LIST] title:@"供应链采购"];
//        wkvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:wkvc animated:YES];
        
    }
    else if (button.tag == Science){
        
        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SCIENCE_LIST] title:@"科技成果"];
//        wkvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:wkvc animated:YES];
    
    }
    else if (button.tag == Knowledge){
        
        KnowLedgeViewController *vc = [[KnowLedgeViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if (button.tag == Intelligence){
    
        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,Intelligence_LIST] title:@"智能创新"];
//        wkvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:wkvc animated:YES];
        
    }
    else if (button.tag == Solve){
        
        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SOLVE_LIST] title:@"解决方案"];
        
//        wkvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:wkvc animated:YES];
    
    }
    else{
    
//        [WKProgressHUD popMessage:@"敬请期待" inView:self.view duration:HUD_DURATION animated:YES];
        
        FinanceViewController *vc = [[FinanceViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }

}

- (void)mainButtonClick2:(UIButton *)button{
    
    if (button.tag == 2001) {
        
        FinanceViewController *vc = [[FinanceViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (button.tag == 2002){
        
        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SCIENCE_LIST] title:@"供应链采购"];
        [self.navigationController pushViewController:wkvc animated:YES];
        
    }
    
    else if (button.tag == 2003){
        
        KnowLedgeViewController *vc = [[KnowLedgeViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if (button.tag == 2004){
        
        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,Intelligence_LIST] title:@"供应链采购"];
        [self.navigationController pushViewController:wkvc animated:YES];
        
    }
    else if (button.tag == 2005){
        
        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SOLVE_LIST] title:@"供应链采购"];
        [self.navigationController pushViewController:wkvc animated:YES];
        
    }
    else{
        
    }
    
}


- (void)fifBtnClick:(UIButton *)button{

    self.cityNumber = (NSInteger)button.tag-3000;
    
    [self loadCityData];
    
    for(int i = 0 ; i < 4 ;i ++) {
        
        UIButton *btn = (UIButton *)[self.view viewWithTag:i + 3000];
        if(button.tag == btn.tag) {
            
            [btn setBackgroundColor:BLUE_COLOR];
            btn.layer.borderWidth = 0;
            btn.selected = YES;
        }else {
            
            [btn setBackgroundColor:[UIColor whiteColor]];
            btn.layer.borderWidth = 1;
            btn.selected = NO;
        }
    }
//    self.tmpbtn.selected  = NO;
//    button.selected = YES;
//    self.tmpbtn = button;
    
}


//供应链header点击事件
- (void)GongbuttonClick{

    WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SUPPLY_LIST] title:@"供应链采购"];
    [self.navigationController pushViewController:wkvc animated:YES];

}


//跳转到搜索页
- (void)SearchButtonPush{

//    SearchViewController *vc = [[SearchViewController alloc]init];
//    
//    [self.navigationController pushViewController:vc animated:YES];
  
    
    WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SEARCH_API] title:@"搜索"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


#pragma mark - scrollView滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    
    float y = scrollView.contentOffset.y;
    
    
    if(y<70){
        self.navigationView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bar"]];
        
        self.navigationView.alpha = 1;

    }
    else{
        self.navigationView.backgroundColor = BLUE_COLOR;

           [UIView animateWithDuration:0.1 animations:^{
               
               CGFloat alphas = (scrollView.contentOffset.y / 135 < 1)?scrollView.contentOffset.y/135:1;
               
               self.navigationView.backgroundColor = BLUE_COLOR;
               
               self.navigationView.alpha = alphas;
               
               
           } completion:^(BOOL finished) {
               
               
           }];
}

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
