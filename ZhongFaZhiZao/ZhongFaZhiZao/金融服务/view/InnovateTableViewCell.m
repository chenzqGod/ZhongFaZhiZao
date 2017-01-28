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
//    self.iconImgView.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:self.iconImgView];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(18*screenScale+CGRectGetMaxX(self.iconImgView.frame), 13, 50, 20)];
    self.titleLabel.font = [UIFont systemFontOfSize:14.0];
//    self.titleLabel.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:self.titleLabel];
    
    self.recommondLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame), 2+CGRectGetMaxY(self.titleLabel.frame), screenWidth-CGRectGetMinX(self.titleLabel.frame)-12, 14)];
    self.recommondLabel.font = [UIFont systemFontOfSize:10.0];
//    self.recommondLabel.backgroundColor = [UIColor cyanColor];
    self.recommondLabel.textColor = TEXT_GREY_COLOR;

    [self.contentView addSubview:self.recommondLabel];
    
    self.suumaryLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.recommondLabel.frame), 6+CGRectGetMaxY(self.recommondLabel.frame), CGRectGetWidth(self.recommondLabel.frame), 34)];
    self.suumaryLabel.numberOfLines = 0;
    self.suumaryLabel.font = [UIFont systemFontOfSize:12.0];
    self.suumaryLabel.textColor = [UIColor colorWithHexString:@"#4a4a4a"];
//    self.suumaryLabel.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:self.suumaryLabel];
    
    UILabel *linelabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, screenWidth, 1)];
    linelabel.backgroundColor = BACK_COLOR;
    [self.contentView addSubview:linelabel];
    
    self.FirstImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLabel.frame)+7, CGRectGetMinY(self.titleLabel.frame)+4, 28, 11)];
//    self.FirstImg.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:self.FirstImg];
    
    self.SecondImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.FirstImg.frame)+5, CGRectGetMinY(self.FirstImg.frame), CGRectGetWidth(self.FirstImg.frame), CGRectGetHeight(self.FirstImg.frame))];
//    self.SecondImg.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:self.SecondImg];
    
    self.ThirdImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.SecondImg.frame)+5, CGRectGetMinY(self.FirstImg.frame), CGRectGetWidth(self.FirstImg.frame), CGRectGetHeight(self.FirstImg.frame))];
//    self.ThirdImg.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:self.ThirdImg];
    
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
