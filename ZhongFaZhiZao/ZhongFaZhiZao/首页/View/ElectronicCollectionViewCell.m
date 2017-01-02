//
//  ElectronicCollectionViewCell.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/15.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "ElectronicCollectionViewCell.h"

@implementation ElectronicCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self createCell];
    }
    
    return self;
}

- (void)createCell{

    self.backgroundColor = [UIColor whiteColor];
    self.ElectronicImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.contentView addSubview:self.ElectronicImg];
    
    self.mengbanImg = [[UIImageView alloc]init];
    self.mengbanImg.frame = self.ElectronicImg.frame;
    self.mengbanImg.image = [UIImage imageNamed:@"蒙版"];
    self.mengbanImg.userInteractionEnabled = YES;
    [self.contentView addSubview:self.mengbanImg];
    
    self.mengbanLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 51*screenScale, screenWidth, 17)];
    self.mengbanLabel.textColor = [UIColor whiteColor];
    self.mengbanLabel.font = [UIFont boldSystemFontOfSize:13.0];
    self.mengbanLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.mengbanLabel];

    
    UILabel *leftLbl = [[UILabel alloc]initWithFrame:CGRectMake(100*screenScale, 81*screenScale, 56*screenScale, 1.5)];
    leftLbl.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:leftLbl];
    
    UILabel *rightLbl = [[UILabel alloc]initWithFrame:CGRectMake(screenWidth - 100*screenScale- 56*screenScale, 81*screenScale, 56*screenScale, 1.5)];
    rightLbl.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:rightLbl];
    
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(12*screenScale+CGRectGetMaxX(leftLbl.frame), 77*screenScale, 10*screenScale, 12*screenScale)];
    icon.image = [UIImage imageNamed:@"位置icon"];
    [self.contentView addSubview:icon];
    
    
    self.cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(5*screenScale+CGRectGetMaxX(icon.frame), 76*screenScale, 26*screenScale, 14*screenScale)];
    self.cityLabel.font = [UIFont boldSystemFontOfSize:10.0];
    self.cityLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:self.cityLabel];
    
    
    
    
}

@end
