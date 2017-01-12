//
//  InnovateTableViewCell.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/1/12.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "InnovateTableViewCell.h"

@implementation InnovateTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createUI];
    }
    
    return self;
    
}

- (void)createUI{

    self.iconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(20*screenScale, (101-31)/2.0, 80, 31)];
    [self.contentView addSubview:self.iconImgView];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(18*screenScale+CGRectGetMaxX(self.iconImgView.frame), 13, 100, 40)];
    [self.contentView addSubview:self.titleLabel];
    
    self.recommondLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame), 2+CGRectGetMaxY(self.titleLabel.frame), screenWidth-CGRectGetMinX(self.titleLabel.frame)-12, 14)];
    [self.contentView addSubview:self.recommondLabel];
    
    self.suumaryLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.recommondLabel.frame), 6+CGRectGetMaxY(self.recommondLabel.frame), CGRectGetWidth(self.recommondLabel.frame), 34)];
    [self.contentView addSubview:self.suumaryLabel];
    
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
