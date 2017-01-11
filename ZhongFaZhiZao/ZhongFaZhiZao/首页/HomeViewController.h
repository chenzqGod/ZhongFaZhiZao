//
//  HomeViewController.h
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/7.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomScrollView.h"

typedef NS_ENUM(int,ZF){

    Supply = 0+1000,
    Intelligence,
    Science,
    Solve,
    Knowledge,
    Electronic
};

@interface HomeViewController : UIViewController

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UIImageView *collectionHeaderView;

//导航栏view
@property (nonatomic,strong) UIView *navigationView;
@property (nonatomic,strong) UIButton *pushSerchBtn;

//搜索框
//@property (nonatomic,strong) UITextField *textField;

//header里的内容
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UIView *adView;     //广告
@property (nonatomic,strong) UIButton *mainBtn;
@property (nonatomic,strong) UIView *mainBtnView;


@property (nonatomic,strong) UIButton *tmpbtn;

@end
