//
//  SupplyCollectionViewCell.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/15.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "SupplyCollectionViewCell.h"
#define SupplyMargin 8

@implementation SupplyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame: frame];
    
    if (self) {
        
        [self createCell];
    }
    
    return self;
}

- (void)createCell{

    self.backgroundColor = [UIColor whiteColor];
    self.SupplyImg = [[UIImageView alloc]init];
    self.SupplyImg.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.contentView addSubview:self.SupplyImg];
}

@end
