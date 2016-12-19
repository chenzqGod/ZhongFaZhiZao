//
//  KnowLedgeTableViewCell.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/19.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "KnowLedgeTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation KnowLedgeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self createCell];
    }

    return self;
}

- (void)createCell{
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(17*screenScale, 16, 80, 66)];
//    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:self.imgUrl] placeholderImage:[UIImage imageNamed:@""]];
    self.iconImageView.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:self.iconImageView];
    
    self.sumLabel = [[UILabel alloc]initWithFrame:CGRectMake(Margin*screenScale+CGRectGetMaxX(self.iconImageView.frame), 16, screenWidth-16-(Margin*screenScale+CGRectGetMaxX(self.iconImageView.frame)), 41)];
    self.sumLabel.backgroundColor = [UIColor cyanColor];
    self.sumLabel.numberOfLines = 2;
    self.sumLabel.text = @"大大塑料袋啊大师的卡号的拉升多大的和大大塑料袋大大和四大范德萨发熟练度发的说法是电风扇拉大放松放松";
    self.sumLabel.font = [UIFont systemFontOfSize:14.0];
    [self.contentView addSubview:self.sumLabel];
    
    self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.sumLabel.frame), CGRectGetMaxY(self.iconImageView.frame)-17, 50, 17)];
    self.priceLabel.text = @"价格面议";
    self.priceLabel.textColor = RED_COLOR;
    self.priceLabel.font = [UIFont systemFontOfSize:12.0];
    [self.contentView addSubview:self.priceLabel];
    
    UILabel *linelabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, screenWidth, 1)];
    linelabel.backgroundColor = BACK_COLOR;
    [self.contentView addSubview:linelabel];
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
