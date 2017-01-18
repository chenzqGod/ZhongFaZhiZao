//
//  SupplyScrollCollectionViewCell.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/24.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "SupplyScrollCollectionViewCell.h"
#import "WKWebViewViewController.h"

@interface SupplyScrollCollectionViewCell(){

    UIScrollView *_scrollView;
    UIImageView *_mainImgView1;
    UIImageView *_mainImgView2;
    UIImageView *_mainImgView3;
    UIImageView *_mainImgView4;
    UIImageView *_mainImgView5;
}

@end

@implementation SupplyScrollCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame: frame];
    
    if (self) {
        
    
//        [self createCell];
    }
    
    return self;
}

- (void)createCell{
    
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _scrollView.pagingEnabled = NO;
    _scrollView.bounces = NO;
    _scrollView.userInteractionEnabled = YES;
//    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.backgroundColor = BACK_COLOR;
    _scrollView.contentSize = CGSizeMake(8*6+5*(self.frame.size.width-24)/2.0, 0);
    [self.contentView addSubview:_scrollView];
    
//    UIView *bakView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth*2.5, self.frame.size.height)];
//    bakView.backgroundColor = [UIColor redColor];
//    [_scrollView addSubview:bakView];
    
    NSArray *section1 = @[@"Group 55",@"Group 54",@"Group 2",@"Group 4",@"Group 5"];
    
    
    
    for (int i = 0; i < 5; i++) {
       
        _mainImgView1 = [[UIImageView alloc]init];
        _mainImgView1.frame = CGRectMake(8*(i+1)+i*(self.frame.size.width-24)/2.0, 0, (self.frame.size.width-24)/2.0, self.frame.size.height);
        _mainImgView1.image = [UIImage imageNamed:section1[i]];
        _mainImgView1.userInteractionEnabled = YES;
        [_scrollView addSubview:_mainImgView1];
        
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame = CGRectMake(0, 6, CGRectGetWidth(_mainImgView1.frame), 30);
        btn1.tag = 10+i;
        btn1.backgroundColor = [UIColor redColor];
        [btn1 addTarget:section1 action:@selector(cellBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_mainImgView1 addSubview:btn1];
        
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn2.frame = CGRectMake(0, 78, CGRectGetWidth(_mainImgView1.frame)/2.0,self.frame.size.height-78);
        btn2.tag = 20+i;
        btn2.backgroundColor = [UIColor redColor];
        [_mainImgView1 addSubview:btn2];

        UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn3.frame = CGRectMake(CGRectGetWidth(_mainImgView1.frame)/2.0, 78, CGRectGetWidth(_mainImgView1.frame)/2.0, self.frame.size.height-78);
        btn3.tag = 30+i;
        btn3.backgroundColor = [UIColor blueColor];
        [_mainImgView1 addSubview:btn3];

        
        
    }
    


}


#pragma mark - 点击事件


//cellBtnClick

- (void)cellBtnClick:(UIButton *)button{
    
//    
//    if (button.tag == 10) {
//        
//        
//    }
//   else if (button.tag == 20) {
//        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://cectest.cecb2b.com/waps/corp/icInfo/10498233?corpId=200890"title:@"商品详情页"];
////        [self.navigationController pushViewController:vc animated:YES];
//       
//        
//    }
//    else if (button.tag == 30){
//        
//        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://cectest.cecb2b.com/waps/corp/icInfo/10498212?corpId=200890"title:@"商品详情页"];
////        [self.navigationController pushViewController:vc animated:YES];
//        
//    }
//    else if (button.tag == 11){
//    
//        
//    }
//    
//    else if (button.tag == 21){
//        
//        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://cectest.cecb2b.com/waps/corp/nicInfo/4717332?corpId=204505"title:@"商品详情页"];
////        [self.navigationController pushViewController:vc animated:YES];
//        
//        
//    }
//    else if (button.tag == 31){
//        
//        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://cectest.cecb2b.com/waps/corp/nicInfo/4717330?corpId=204505"title:@"商品详情页"];
////        [self.navigationController pushViewController:vc animated:YES];
//        
//    }
//    else if (button.tag == 12){
//        
//        
//    }
//    
//    else if (button.tag == 22){
//        
//        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://cectest.cecb2b.com/waps/corp/nicInfo/4717332?corpId=204505"title:@"商品详情页"];
//        //        [self.navigationController pushViewController:vc animated:YES];
//        
//        
//    }
//    else if (button.tag == 32){
//        
//        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://cectest.cecb2b.com/waps/corp/nicInfo/4717330?corpId=204505"title:@"商品详情页"];
//        //        [self.navigationController pushViewController:vc animated:YES];
//        
//    }
//
//    else if (button.tag == 13){
//        
//        
//    }
//    
//    else if (button.tag == 23){
//        
//        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://cectest.cecb2b.com/waps/corp/nicInfo/4717332?corpId=204505"title:@"商品详情页"];
//        //        [self.navigationController pushViewController:vc animated:YES];
//        
//        
//    }
//    else if (button.tag == 33){
//        
//        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://cectest.cecb2b.com/waps/corp/nicInfo/4717330?corpId=204505"title:@"商品详情页"];
//        //        [self.navigationController pushViewController:vc animated:YES];
//        
//    }
//    else if (button.tag == 14){
//        
//        
//    }
//    
//    else if (button.tag == 24){
//        
//        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://cectest.cecb2b.com/waps/corp/nicInfo/4717332?corpId=204505"title:@"商品详情页"];
//        //        [self.navigationController pushViewController:vc animated:YES];
//        
//        
//    }
//    else if (button.tag == 34){
//        
//        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://cectest.cecb2b.com/waps/corp/nicInfo/4717330?corpId=204505"title:@"商品详情页"];
//        //        [self.navigationController pushViewController:vc animated:YES];
//        
//    }
//
//    else if (button.tag == 15){
//        
//        
//    }
//    
//    else if (button.tag == 25){
//        
//        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://cectest.cecb2b.com/waps/corp/nicInfo/4717332?corpId=204505"title:@"商品详情页"];
//        //        [self.navigationController pushViewController:vc animated:YES];
//        
//        
//    }
//    else if (button.tag == 35){
//        
//        WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:@"http://cectest.cecb2b.com/waps/corp/nicInfo/4717330?corpId=204505"title:@"商品详情页"];
//        //        [self.navigationController pushViewController:vc animated:YES];
//        
//    }
 
}



@end
