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


- (void)createNavgationView {

    self.navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64)];
    self.navigationView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bar"]];
//    self.navigationView.backgroundColor = [UIColor redColor];
        [self.view addSubview:self.navigationView];
    
//    UIImageView *searchImg = [[UIImageView alloc]initWithFrame:CGRectMake(59, 24, 539/2.0*screenScale, 30)];
//    searchImg.image = [UIImage imageNamed:@"搜索"];
////    searchImg.backgroundColor = [UIColor cyanColor];
//    [self.navigationView setMaskView:searchImg];
    
    self.pushSerchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.pushSerchBtn.frame = CGRectMake(59, 24, 539/2.0*screenScale, 59/2.0);
    self.pushSerchBtn.backgroundColor = [UIColor clearColor];
    [self.pushSerchBtn setBackgroundImage:[UIImage imageNamed:@"搜素"] forState:UIControlStateNormal];
//    self.pushSerchBtn.layer.cornerRadius = 3;
//    self.pushSerchBtn.layer.masksToBounds = YES;
    self.pushSerchBtn.imageView.frame = self.pushSerchBtn.bounds;
    self.pushSerchBtn.hidden = NO;
    [self.pushSerchBtn setEnabled:YES];
    [self.pushSerchBtn addTarget:self action:@selector(SearchButtonPush) forControlEvents:UIControlEventTouchUpInside];
    
//    [self.view setMaskView:self.pushSerchBtn];
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

    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 180+8+40+164+80+8)];
    self.headerView.backgroundColor = BACK_COLOR;
    [self.view addSubview:self.headerView];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 180)];
    self.scrollView.backgroundColor = [UIColor redColor];
    [self.headerView addSubview:self.scrollView];
    
    UIImageView *bannerimage = [[UIImageView alloc]initWithFrame:self.scrollView.bounds];
    bannerimage.image = [UIImage imageNamed:@"banner"];
    [self.headerView addSubview:bannerimage];
    
//    UILabel *textFieldLbl = [];
    
//    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(59, 26, 539/2.0*screenScale, 30)];
//    self.textField.placeholder = @"搜索产品名称或型号";
//    self.textField.font = [UIFont boldSystemFontOfSize:15.0];
//    self.textField.textColor = TEXT_GREY_COLOR;
//    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//    self.textField.background = [UIColor whiteColor];
//    self.textField.layer.masksToBounds = YES;
//    self.textField.layer.cornerRadius = 3;
    

//    UILabel *scrollLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scrollView.frame), screenWidth, 8)];
//    scrollLabel.backgroundColor = BACK_COLOR;
    
    self.adView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scrollView.frame)+8, screenWidth, 40)];
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

    self.mainBtnView = [[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.scrollView.frame)+40+8 , screenWidth, 164)];
    self.mainBtnView.backgroundColor = [UIColor whiteColor];
    [self.headerView addSubview:self.mainBtnView];

  
    NSArray *mainBtnImageArr = @[@"供应链icon",@"智能创新icon",@"科技成果icon",@"解决方案icon",@"产权专利icon",@"金融服务icon"];
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
    [self.headerView addSubview:firstImg];
    
}


#pragma mark - collectionView
-(void)createCollectionView
{
    _flowLayout= [[UICollectionViewFlowLayout alloc] init];
    //设置滚动方向
    _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置headerView尺寸大小
    _flowLayout.headerReferenceSize = CGSizeMake(screenWidth, 180+8+40+164);
    
//    _flowLayout.itemSize 
    
//    _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake( 0, 0, screenWidth, screenHeight-49) collectionViewLayout:_flowLayout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = BACK_COLOR;
    
    //注册cell
    [_collectionView registerClass:[SupplyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_collectionView registerClass:[KnowLedgeCustomCollectionViewCell class] forCellWithReuseIdentifier:@"knowcustomCell"];
    
    
    [_flowLayout setHeaderReferenceSize:CGSizeMake(screenWidth, _headerView.frame.size.height)];
    
    
    
    
    //注册header
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];

        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView1"];
    

    
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
    
    NSArray *collecHeaderArr = @[@"科技bar",@"产权专利bar",@"智能bar",@"解决方案bar",@"电子市场bar"];
    self.collectionHeaderView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 80)];
    self.collectionHeaderView.image = [UIImage imageNamed:collecHeaderArr[indexPath.section-1]];
    
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
        
        
        
//       UIImageView  *iconImg = [[UIImageView alloc]initWithFrame:CGRectMake(45*screenScale, (cell.frame.size.height-26)/2.0, 26, 26)];
//        
//        iconImg.backgroundColor = [UIColor cyanColor];
//        [cell addSubview:iconImg];
//        
//        UILabel *textLbl = [[UILabel alloc]initWithFrame:CGRectMake(12*screenScale+CGRectGetMaxX(iconImg.frame), (cell.frame.size.height-16)/2.0, 64, 16)];
//        textLbl.text = @"申请专利";
//        [cell addSubview:textLbl];
        
        return cell;
        
    }
    
    static NSString * CellIdentifier = @"cell";
    SupplyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    
    
    
    //    if(_sceniclist.spot.count>indexPath.row+1)
    //    {
    //        ABScenicSpot *model = (ABScenicSpot*)_sceniclist.spot[indexPath.row+1];
    //        [cell setcellmodel:model];
    //        return cell;
    //    }
//    ABScenicSpot *model = (ABScenicSpot*)_sceniclist.spot[indexPath.row];
    

//    [cell setcellmodel:model];
    
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
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//设置页头高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        
        return CGSizeMake(screenWidth, 180+8+40+164+80+8);
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
    
    KnowLedgeViewController *vc = [[KnowLedgeViewController alloc]init];
    
    switch (button.tag) {
        case Supply:
//            [self htmlJump:_scenicDetailModel.infourl withTitle:@"景区简介"];
            break;
        case Science:
//            [self htmlJump:_scenicDetailModel.triplineurl withTitle:@"路线"];
            
            break;
        case Knowledge:


            [self.navigationController pushViewController:vc animated:YES];
            
            break;
        case Intelligence:

            break;
        case Solve:
            
            break;
        case  Electronic:
            [WKProgressHUD popMessage:@"敬请期待" inView:self.view duration:HUD_DURATION animated:YES];

            break;
    }

}

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
