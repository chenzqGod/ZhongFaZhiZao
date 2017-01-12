//
//  SupplyTableViewCell.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/1/12.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "SupplyTableViewCell.h"

@implementation SupplyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self createUI];
    }
    
    return self;
}

- (void)createUI{

    self.iconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(23*screenScale, (101-35)/2, 81, 35)];
    [self.contentView addSubview:self.iconImgView];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15*screenScale+CGRectGetMaxX(self.iconImgView.frame), 13, screenWidth-Margin-CGRectGetMaxX(self.iconImgView.frame), 20)];
    [self.contentView addSubview:self.titleLabel];
    
    self.recommondLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame), 2+CGRectGetMaxY(self.titleLabel.frame), 140, 14)];
    [self.contentView addSubview:self.recommondLabel];
    
    self.moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.recommondLabel.frame), 6+CGRectGetMaxY(self.recommondLabel.frame), 140, 12)];
    [self.contentView addSubview:self.moneyLabel];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.moneyLabel.frame), 2+CGRectGetMaxY(self.moneyLabel.frame)+2, CGRectGetWidth(self.moneyLabel.frame), CGRectGetHeight(self.moneyLabel.frame))];
    [self.contentView addSubview:self.titleLabel];
    
    self.rateLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenWidth-Margin-50, 36, 50, 25)];
    [self.contentView addSubview:self.rateLabel];
    
    UILabel *yueLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.rateLabel.frame), 10+CGRectGetMaxY(self.rateLabel.frame), CGRectGetWidth(self.rateLabel.frame), 13)];
    yueLabel.text = @"月利率";
    yueLabel.font = [UIFont systemFontOfSize:12.0];
    yueLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:yueLabel];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
