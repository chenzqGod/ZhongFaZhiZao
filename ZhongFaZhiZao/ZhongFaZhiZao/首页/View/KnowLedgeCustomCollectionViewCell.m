//
//  KnowLedgeCustomCollectionViewCell.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/17.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "KnowLedgeCustomCollectionViewCell.h"

@implementation KnowLedgeCustomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame: frame];
    
    if (self) {
        
        [self createCell];
    }
    
    return self;
}

- (void)createCell{

    self.iconImg = [[UIImageView alloc]initWithFrame:CGRectMake(45*screenScale, (self.contentView.frame.size.height-26)/2.0, 26, 26)];
    
    self.iconImg.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.iconImg];
    
    self.textLbl = [[UILabel alloc]initWithFrame:CGRectMake(12*screenScale+CGRectGetMaxX(self.iconImg.frame), (self.contentView.frame.size.height-16)/2.0, 80, 16)];
    [self.contentView addSubview:self.textLbl];
    
}

@end
