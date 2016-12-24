//
//  HomeViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/7.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "ABWebViewViewController.h"
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

#import "CommitKnowledgeViewController.h"
#import "DCWebImageManager.h"
#define margins 8

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>{

    NSArray *_imageArr;
    UICollectionViewFlowLayout *_flowLayout;

}



@end

@implementation HomeViewController

- (NSArray *)imageArr{

    if (!_imageArr){
    
        _imageArr = [[NSArray alloc]init];
    }
    return _imageArr;
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:NO];
   self.tabBarController.tabBar.hidden=NO;
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];

    [self loadadData];

    [self loadCityData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.navigationController setNavigationBarHidden:YES];
    
    
    self.view.backgroundColor = BACK_COLOR;

    self.edgesForExtendedLayout = UIRectEdgeNone;

    
    [self createHeaderView];
    
//    [self createCollectionHeader];
    
    [self createCollectionView];
    
     [self createNavgationView];
}


#pragma mark - loadData
- (void)loadadData{

    [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,AD_API] parameters:nil success:^(id response) {
        
        if ([response[@"resultCode"]integerValue] == 1000) {
            
            NSArray *adid41Arr = response[@"ad_id_41"];
            
            NSArray *adid44Arr = response[@"ad_id_44"];

        }
        else if ([response[@"resultCode"]integerValue] == 1001){
        
             [WKProgressHUD popMessage:@"广告位请求失败" inView:self.view duration:HUD_DURATION animated:YES];
        }
        
        
    } failure:^(NSString *error) {
        
        [WKProgressHUD popMessage:@"请检查网络连接" inView:self.view duration:HUD_DURATION animated:YES];

    }];
        
}


- (void)loadCityData{
    
    [[NSNetworking sharedManager]post:[NSString stringWithFormat:@"%@%@",HOST_URL,Electronic_API] parameters:nil success:^(id response) {
        
        if ([response[@"resultCode"]integerValue] == 1000) {
            
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
    
    self.pushSerchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.pushSerchBtn.frame = CGRectMake(59, 24, 539/2.0*screenScale, 59/2.0);
    self.pushSerchBtn.backgroundColor = [UIColor clearColor];
    [self.pushSerchBtn setBackgroundImage:[UIImage imageNamed:@"搜素"] forState:UIControlStateNormal];

    self.pushSerchBtn.imageView.frame = self.pushSerchBtn.bounds;
    self.pushSerchBtn.hidden = NO;
    [self.pushSerchBtn setEnabled:YES];
    [self.pushSerchBtn addTarget:self action:@selector(SearchButtonPush) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.pushSerchBtn];
    
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.frame = CGRectMake(screenWidth-20-14, 24+(59/2.0-24)/2.0, 20, 27);
    pushBtn.backgroundColor = [UIColor clearColor];
    [pushBtn setBackgroundImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
    pushBtn.imageView.frame = pushBtn.bounds;
    pushBtn.hidden = NO;
    [pushBtn addTarget:self action:@selector(jPushButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pushBtn];
    
    UIButton *QRcode = [UIButton buttonWithType:UIButtonTypeCustom];
    QRcode.frame = CGRectMake(14, 24+(59/2.0-57/2.0)/2.0, 59/2.0, 57/2.0);
    QRcode.backgroundColor = [UIColor clearColor];
    [QRcode setBackgroundImage:[UIImage imageNamed:@"扫一扫"] forState:UIControlStateNormal];
    QRcode.imageView.frame = QRcode.bounds;
    QRcode.hidden = NO;
    [self.view addSubview:QRcode];
    
}

//每个cell页头
- (void)createCollectionHeader {

//    self.collectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 80)];
//    self.collectionHeaderView.backgroundColor = [UIColor blueColor];
    
}


//collectionView最上面Header
- (void)createHeaderView{

    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 180*screenScale+8+40+164+80+8)];
    self.headerView.backgroundColor = BACK_COLOR;
    [self.view addSubview:self.headerView];
    
    NSArray *scrollImg = @[@"banner",@"banner",@"banner"];
    
    CustomScrollView *mainscrollView = [[CustomScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 180*screenScale)WithImageNames:scrollImg];
    
    [mainscrollView setImageViewDidTapAtIndex:^(NSInteger index) {
        
    }];
    mainscrollView.placeImage = [UIImage imageNamed:@"banner"];
    mainscrollView.AutoScrollDelay = 5.0f;
    
    mainscrollView.backgroundColor = [UIColor redColor];
    [self.headerView addSubview:mainscrollView];
    
    [[DCWebImageManager shareManager] setDownloadImageRepeatCount:1];
    [[DCWebImageManager shareManager] setDownLoadImageError:^(NSError *error, NSString *url) {
        NSLog(@"%@",error);
    }];

    
    self.adView = [[UIView alloc]initWithFrame:CGRectMake(0, 8+CGRectGetMaxY(mainscrollView.frame), screenWidth, 40)];
    self.adView.backgroundColor = [UIColor whiteColor];
    [self.headerView addSubview:self.adView];
    
//    行业热点logo
    UIImageView *hotDianImg = [[UIImageView alloc]initWithFrame:CGRectMake(margins, (40-25)/2.0, 91, 25)];
    hotDianImg.image = [UIImage imageNamed:@"行业热点logo"];
    [self.adView addSubview:hotDianImg];
   
    UILabel *hangyeLine = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(hotDianImg.frame)+7, (40 - 25)/2.0, 1.5, 25)];
    hangyeLine.backgroundColor = TEXT_LINE_COLOR;
    [self.adView addSubview:hangyeLine];
    
    UILabel *hotLabel = [[UILabel alloc]initWithFrame:CGRectMake(7+CGRectGetMaxX(hangyeLine.frame), (40-12)/2.0, 20, 12)];
    hotLabel.backgroundColor = [UIColor blackColor];
    hotLabel.text = @"HOT";
    hotLabel.textAlignment = NSTextAlignmentCenter;
    hotLabel.font = [UIFont systemFontOfSize:8.0];
    hotLabel.textColor = [UIColor whiteColor];
    hotLabel.layer.cornerRadius = 1.5;
    hotLabel.layer.masksToBounds = YES;
    [self.adView addSubview:hotLabel];
//
    UILabel *hotSumLabel = [[UILabel alloc]initWithFrame:CGRectMake(5+CGRectGetMaxX(hotLabel.frame), (40-15)/2.0, screenWidth-margins-(5+CGRectGetMaxX(hotLabel.frame)), 15)];
    hotSumLabel.numberOfLines = 1;
    hotSumLabel.text= @"想回到过去，试着让故事继续，至少不再让你离我而去，想看你看的世界,想在你梦的画面";
    hotSumLabel.textAlignment = NSTextAlignmentLeft;
    hotSumLabel.font = [UIFont systemFontOfSize:13.0];
    [self.adView addSubview:hotSumLabel];
    
    UILabel *lineLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.adView.frame)-1, screenWidth, 1)];
    lineLabel1.backgroundColor = TEXT_LINE_COLOR;
    [self.headerView addSubview:lineLabel1];

    self.mainBtnView = [[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(mainscrollView.frame)+40+8 , screenWidth, 164)];
    self.mainBtnView.backgroundColor = [UIColor whiteColor];
    [self.headerView addSubview:self.mainBtnView];

  
    NSArray *mainBtnImageArr = @[@"供应链icon",@"智能创新icon",@"科技成果icon",@"解决方案icon",@"产权专利icon",@"金融"];
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
    
    
    UIImageView *firstImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.mainBtnView.frame)+8, screenWidth, 80)];
    firstImg.image = [UIImage imageNamed:@"供bar"];
    firstImg.userInteractionEnabled = YES;
    [firstImg addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GongbuttonClick)]];
    
    [self.headerView addSubview:firstImg];
    
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
    
    //注册cell
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_collectionView registerClass:[SupplyCollectionViewCell class] forCellWithReuseIdentifier:@"supplycell"];
    [_collectionView registerClass:[KnowLedgeCustomCollectionViewCell class] forCellWithReuseIdentifier:@"knowcustomCell"];
     [_collectionView registerClass:[ScienceCollectionViewCell class] forCellWithReuseIdentifier:@"scienceCell"];
     [_collectionView registerClass:[IntelligenceCollectionViewCell class] forCellWithReuseIdentifier:@"intelligenceCell"];
     [_collectionView registerClass:[SolveCollectionViewCell class] forCellWithReuseIdentifier:@"solveCell"];
     [_collectionView registerClass:[ElectronicCollectionViewCell class] forCellWithReuseIdentifier:@"eletronicCell"];
    
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
    
   else if (kind == UICollectionElementKindSectionHeader &&indexPath.section == 5 ) {
       
       UIView *fifView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 80+53)];
       fifView.backgroundColor = BACK_COLOR;
       fifView.userInteractionEnabled = YES;
       
       UIImageView *fifImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 80)];
       fifImg.image = [UIImage imageNamed:@"电子市场bar"];
       fifImg.userInteractionEnabled = YES;
       [fifView addSubview:fifImg];
     
       CGFloat fifBtnX = (screenWidth-78*4)/5.0;
       
       NSArray *fifArr = @[@"全部",@"北京",@"西安",@"深圳"];
       
       for (NSInteger i = 0; i < 4; i++) {
           
            UIButton *fifButton = [UIButton buttonWithType:UIButtonTypeCustom];
           
           fifButton.frame = CGRectMake(78*i+(i+1)*fifBtnX, (53-25)/2.0+CGRectGetMaxY(fifImg.frame), 78, 25);
           [fifButton setTitle:fifArr[i] forState:UIControlStateNormal];
           [fifButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
//           [fifButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

           
           [fifButton setTitleColor:TEXT_GREY_COLOR forState:UIControlStateNormal];
           fifButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
           fifButton.layer.masksToBounds = YES;
           fifButton.layer.cornerRadius = 10;
           fifButton.tag = 3000+i;
           [fifButton addTarget:self action:@selector(fifBtnClick:) forControlEvents:UIControlEventTouchUpInside];
           
           fifButton.backgroundColor = BLUE_COLOR;
           
           [fifView addSubview:fifButton];

           if (i == 0) {
               self.tmpbtn = fifButton;
               fifButton.selected = YES;
           }

       }
       
       UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView2" forIndexPath:indexPath];
       
       [headerView addSubview: fifView];
       
       reusableview = headerView;
       
       return reusableview;
       
    }
    
    NSArray *collecHeaderArr = @[@"科技bar",@"产权专利bar",@"智能bar",@"解决方案bar",@"电子市场bar"];
    self.collectionHeaderView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 80)];
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
        
        return 2;
        
    }
    else if (section == 1){
    
        return 4;
    }
    else if (section == 2){
        
        return 8;
    
    }
    else if (section == 3){
        
        return 4;
    
    }
    else if (section == 4){
    
        return 3;
        
    }
    else if (section == 5){
    
        return 3;
        
    }
    
    return 0;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 6;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    if (indexPath.section == 2 && indexPath.row < 6) {
        
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
    
    else if (indexPath.section == 1){
    
        static NSString * CellIdentifier = @"scienceCell";
        ScienceCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        
        
        cell.backgroundColor = [UIColor redColor];
        
        return cell;

        
    }
    
    
    
  else  if (indexPath.section == 3) {
        
        static NSString * CellIdentifier = @"intelligenceCell";
        IntelligenceCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
      
        NSArray *section3Arr = @[@"智能1",@"智能2",@"智能3",@"智能4"];
        
        cell.IntelligenceImg.image =  [UIImage imageNamed:section3Arr[indexPath.row]];
        
        return cell;
        
    }
    
else if (indexPath.section == 2 && indexPath.row >= 6){
       
       static NSString * CellIdentifier = @"supplycell";
       SupplyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
        NSArray *section36Arr = @[@"Group 41",@"Group 40"];
        
        cell.SupplyImg.image = [UIImage imageNamed:section36Arr[indexPath.row-6]];
        
        return cell;
    }
    
else if (indexPath.section == 0){

    static NSString * CellIdentifier = @"supplycell";
    SupplyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];

    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;


}
else if (indexPath.section == 4){
    
    static NSString * CellIdentifier = @"solveCell";
    SolveCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;


}
else if (indexPath.section == 5){
    
    static NSString * CellIdentifier = @"eletronicCell";
    ElectronicCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
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
        
        return CGSizeMake(175*screenScale, 197*screenScale);
    }
    else if (indexPath.section == 1){
    
        return CGSizeMake(374/2.0*screenScale, 175*screenScale);
    }
    else if (indexPath.section == 2){
        
        if (indexPath.row <= 5){
        
        return CGSizeMake(374/2.0*screenScale, 45*screenScale);
        
        }
        
        return CGSizeMake(374/2.0*screenScale, 72*screenScale);
    }
    else if (indexPath.section == 3){
        
        return CGSizeMake(374/2.0*screenScale, 187*screenScale);
    }
    else if (indexPath.section == 4){
        
        return CGSizeMake(screenWidth*screenScale, 113*screenScale);
    
    }
    else if (indexPath.section == 5){
        
        return CGSizeMake(screenWidth, 141*screenScale);
    
    }
    
    return CGSizeZero;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        
      return UIEdgeInsetsMake(margins, margins, margins, margins);
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

    return UIEdgeInsetsZero;


//     UIEdgeInsets insets = {top, left, bottom, right};
}

#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"%ld",(long)indexPath.row);
//    ABScenicSpotDetailsViewController *vc = [[ABScenicSpotDetailsViewController alloc]init];
    //    if(_sceniclist.spot.count>indexPath.row+1)
    //    {
    //        ABScenicSpot *model = (ABScenicSpot*)_sceniclist.spot[indexPath.row+1];
    //        vc.scenic=_scenic;
    //        vc.scenicSpot = model;
    //        vc.name = model.name;
    //        [self.navigationController pushViewController:vc animated:YES];
    //    }else{
//    ABScenicSpot *model =(ABScenicSpot*) _sceniclist.spot[indexPath.row];
    //    vc.currentSid = model.sid;
    //    vc.currentId = model.spotIdentifier;
//    vc.scenic=_scenic;
//    vc.scenicSpot = model;
//    vc.name = model.name;
//    [self.navigationController pushViewController:vc animated:YES];
    
    //    }
    
    
    if (indexPath.section == 2 && indexPath.row <= 5) {
        
        CommitKnowledgeViewController *vc = [[CommitKnowledgeViewController alloc]init];
        
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
        
        return CGSizeMake(screenWidth, 180*screenScale+8+40+164+80+8);
    }
    else if (section == 5){
    
        return CGSizeMake(screenWidth, 80+53);
    }
    return CGSizeMake(screenWidth, 80);
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

//jpush消息
- (void)jPushButton{

    AskViewController *vc = [[AskViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

//6个圆形按钮点击事件
- (void)mainButtonClick:(UIButton *)button{

    NSLog(@"%ld",button.tag);
    
    
    if (button.tag == Supply ) {
        
        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SUPPLY_LIST] title:@"供应链采购"];
        [self.navigationController pushViewController:wkvc animated:YES];
        
    }
    else if (button.tag == Science){
        
        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SCIENCE_LIST] title:@"供应链采购"];
        [self.navigationController pushViewController:wkvc animated:YES];
    
    }
    else if (button.tag == Knowledge){
        
        KnowLedgeViewController *vc = [[KnowLedgeViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if (button.tag == Intelligence){
    
        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,Intelligence_LIST] title:@"供应链采购"];
        [self.navigationController pushViewController:wkvc animated:YES];
        
    }
    else if (button.tag == Solve){
        
        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SOLVE_LIST] title:@"供应链采购"];
        [self.navigationController pushViewController:wkvc animated:YES];
    
    }
    else{
    
        [WKProgressHUD popMessage:@"敬请期待" inView:self.view duration:HUD_DURATION animated:YES];
        
    }

}

- (void)mainButtonClick2:(UIButton *)button{
    
    NSLog(@"%ld",button.tag);
    
    
    if (button.tag == 2001){
        
        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SCIENCE_LIST] title:@"供应链采购"];
        [self.navigationController pushViewController:wkvc animated:YES];
        
    }
    else if (button.tag == 2002){
        
        KnowLedgeViewController *vc = [[KnowLedgeViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if (button.tag == 2003){
        
        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,Intelligence_LIST] title:@"供应链采购"];
        [self.navigationController pushViewController:wkvc animated:YES];
        
    }
    else if (button.tag == 2004){
        
        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SOLVE_LIST] title:@"供应链采购"];
        [self.navigationController pushViewController:wkvc animated:YES];
        
    }
    else{
        
//        [WKProgressHUD popMessage:@"敬请期待" inView:self.view duration:HUD_DURATION animated:YES];
        
    }
    
}


- (void)fifBtnClick:(UIButton *)button{

//    if (!self.tmpbtn.selected) {
//        
//        self.tmpbtn = button;
//        self.tmpbtn.selected = YES;
//    }
}



//供应链header点击事件
- (void)GongbuttonClick{

    WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SUPPLY_LIST] title:@"供应链采购"];
    [self.navigationController pushViewController:wkvc animated:YES];

}

////其他header点击事件
//- (void)buttonClick:(UIImageView *)i{
//    
//    if (i.tag == 1+50000) {
//        
//        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SCIENCE_LIST] title:@"供应链采购"];
//        [self.navigationController pushViewController:wkvc animated:YES];
//
//    }
//    else if (i.tag == 2+50000){
//    
//        KnowLedgeViewController *vc = [[KnowLedgeViewController alloc]init];
//        [self.navigationController pushViewController:vc animated:YES];
//
//        
//    }
//    else if (i.tag == 3+50000){
//        
//        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,Intelligence_LIST] title:@"供应链采购"];
//        [self.navigationController pushViewController:wkvc animated:YES];
//
//        
//    }
//    else if (i.tag == 4+50000){
//        
//        WKWebViewViewController *wkvc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",HOST_URL,SOLVE_LIST] title:@"供应链采购"];
//        [self.navigationController pushViewController:wkvc animated:YES];
//
//    
//    }
//    else{
//    
//    }
//    
//}



//跳转到搜索页
- (void)SearchButtonPush{

    SearchViewController *vc = [[SearchViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}




#pragma mark - scrollView滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if (scrollView.contentOffset.y > 0) {
        
//        self.navigationView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"NavBack"]];
       
//        [self.navigationView removeFromSuperview];
        
        
        self.navigationView.backgroundColor = [UIColor redColor];
        
        CGFloat alphas = (scrollView.contentOffset.y / 58.0 < 1)?scrollView.contentOffset.y/58.0:1;
        
        self.navigationView.alpha = alphas;
        
    }
    
    self.navigationView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bar"]];
    
    self.navigationView.alpha = 1;
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
