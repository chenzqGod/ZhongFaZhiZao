//
//  FinanceCollectionViewCell.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/1/20.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "FinanceCollectionViewCell.h"

@implementation FinanceCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self createCell];
    }
    
    return self;
}

- (void)createCell{
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.FinanceImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    [self.contentView addSubview:self.FinanceImg];
}


@end
