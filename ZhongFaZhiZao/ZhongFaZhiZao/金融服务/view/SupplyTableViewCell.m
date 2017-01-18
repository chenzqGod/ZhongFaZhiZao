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

    self.iconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(21*screenScale, (101-35)/2, 82, 35)];
    [self.contentView addSubview:self.iconImgView];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15*screenScale+CGRectGetMaxX(self.iconImgView.frame), 13, 145*screenScale, 20)];
    self.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [self.contentView addSubview:self.titleLabel];
    
    self.recommondLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame), 2+CGRectGetMaxY(self.titleLabel.frame), 140, 14)];
    self.recommondLabel.font = [UIFont systemFontOfSize:10.0];
    self.recommondLabel.textColor = TEXT_GREY_COLOR;
    [self.contentView addSubview:self.recommondLabel];
    
    self.moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.recommondLabel.frame), 6+CGRectGetMaxY(self.recommondLabel.frame), 140, 12)];
    self.moneyLabel.font = [UIFont systemFontOfSize:12.0];
    [self.contentView addSubview:self.moneyLabel];
    
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.moneyLabel.frame), 2+CGRectGetMaxY(self.moneyLabel.frame)+2, CGRectGetWidth(self.moneyLabel.frame), CGRectGetHeight(self.moneyLabel.frame))];
    self.timeLabel.font = [UIFont systemFontOfSize:12.0];
    [self.contentView addSubview:self.timeLabel];
    
    self.rateLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLabel.frame)+1, 36, 106*screenScale, 25)];
    self.rateLabel.font = [UIFont systemFontOfSize:18.0];
    self.rateLabel.textColor = [UIColor colorWithHexString:@"#F6A623"];
    self.rateLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.rateLabel];
    
    UILabel *yueLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.rateLabel.frame), 10+CGRectGetMaxY(self.rateLabel.frame), CGRectGetWidth(self.rateLabel.frame), 13)];
    yueLabel.text = @"月利率";
    yueLabel.font = [UIFont systemFontOfSize:12.0];
    yueLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:yueLabel];
 
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
