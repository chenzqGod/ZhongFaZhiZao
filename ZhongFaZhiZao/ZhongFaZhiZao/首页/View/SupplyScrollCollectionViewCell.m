//
//  SupplyScrollCollectionViewCell.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/24.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "SupplyScrollCollectionViewCell.h"

@interface SupplyScrollCollectionViewCell(){

    UIScrollView *_scrollView;
    UIImageView *_mainImgView;
}

@end

@implementation SupplyScrollCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame: frame];
    
    if (self) {
        
        [self createCell];
    }
    
    return self;
}

- (void)createCell{
    
    
//    _scrollView = [UIScrollView alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
//    _mainImgView = [[UIImageView alloc]init];
//    _mainImgView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//    [_scrollView addSubview:_mainImgView];

}

- (void)setDictionary:(NSMutableArray *)dataArr{

    
    
}

@end
