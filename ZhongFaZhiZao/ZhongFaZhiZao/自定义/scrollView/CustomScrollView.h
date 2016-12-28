//
//  CustomScrollView.h
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/21.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,PageControlStyle){

    PageControlAtCenter,
    PageControlAtRight,
    PageControlAtLeft,
};

@interface CustomScrollView : UIView

- (void)setImageData:(NSArray *)ImageNames ;
//占位图
@property (nonatomic,strong) UIImage *placeImage;

//轮播时间
@property (nonatomic,assign) NSTimeInterval AutoScrollDelay;

//设置pageControl位置
@property (nonatomic,assign) PageControlStyle style;
@property (nonatomic,strong) NSArray<NSString *> *titleData; //设置后显示label,自动设置PageControlAtRight

//图片被点击会调用该block
@property (nonatomic,copy) void(^imageViewDidTapAtIndex)(NSInteger index); //index从0开始



//网络加载urlsring必须为http:// 开头,
//如有特需修改284行代码
//本地加载只需图片名字数组


@end
