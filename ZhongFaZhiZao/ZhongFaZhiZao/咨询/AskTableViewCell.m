//
//  AskTableViewCell.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/7.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "AskTableViewCell.h"

@implementation AskTableViewCell{

    UIView *_lowbgdView;
    
    UILabel *_yueLabel;
    UIImageView *_pimageView;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self createUI];
    }
    
    return self;
}




- (void)createUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth-2*Margin, 240)];
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.masksToBounds = YES;
    backView.layer.borderWidth = 0.5;
    backView.layer.borderColor = [UIColor blackColor].CGColor;
    backView.layer.cornerRadius = 4;
    [self.contentView addSubview:backView];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, 8, CGRectGetWidth(backView.frame)-14-Margin, 24)];
    self.titleLabel.font = [UIFont systemFontOfSize:17.0];
    self.titleLabel.text = @"默认标题";
    [backView addSubview:self.titleLabel];

    self.mainImgView = [[UIImageView alloc]initWithFrame:CGRectMake(Margin, 8+CGRectGetMaxY(self.titleLabel.frame), CGRectGetWidth(backView.frame)-2*Margin, 272/2.0)];
    self.mainImgView.image = [UIImage imageNamed:@"占位图-消息"];
    [backView addSubview:self.mainImgView];
    
    self.sumLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, 6+CGRectGetMaxY(self.mainImgView.frame), CGRectGetWidth(self.titleLabel.frame), 16)];
    
    self.sumLabel.font = [UIFont systemFontOfSize:12.0];
    self.sumLabel.textColor = [UIColor colorWithHexString:@"#9B9B9B"];
    self.sumLabel.text = @"我祈祷拥有一颗透明的心灵，和会流泪的眼睛，给我再去相信的勇气，越过谎言去拥抱你";
    [backView addSubview:self.sumLabel];
    
    _lowbgdView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.sumLabel.frame)+6,screenWidth-2*Margin, 34)];
    
    
//    _lowbgdView.backgroundColor = [UIColor colorWithHexString:@"#244356"];
    _lowbgdView.backgroundColor = [UIColor colorWithRed:36/255.0 green:67/255.0 blue:86/255.0 alpha:0.1];

    [backView addSubview:_lowbgdView];
    
    _yueLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, (34-17)/2.0, 50, 17)];
    _yueLabel.text = @"阅读全文";
    _yueLabel.textColor = [UIColor blackColor];
    _yueLabel.alpha = 1;
    _yueLabel.font = [UIFont systemFontOfSize:12.0];
    [_lowbgdView addSubview:_yueLabel];
    
    _pimageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(backView.frame)-Margin-8, (CGRectGetHeight(_lowbgdView.frame)-15)/2.0, 8, 15)];
    _pimageView.image = [UIImage imageNamed:@"Shape"];
    _pimageView.hidden = NO;
    _pimageView.backgroundColor = [UIColor clearColor];
    [_lowbgdView addSubview:_pimageView];
    
}

//- (void)layoutSubviews {
//
//    [super layoutSubviews];
//    
//    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.left.mas_equalTo(@14);
//        make.width.mas_equalTo(@(self.frame.size.width-14*2));
////        make.width.mas_equalTo(self.mas_width-14*2);
//        make.height.mas_equalTo(@(24*screenH));
//        make.top.mas_equalTo(@(8*screenH));
//        
//    }];
//    
//    [self.mainImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.left.mas_equalTo(@10);
//        make.width.mas_equalTo(@(self.frame.size.width-10*2));
//        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(8*screenH);
//        make.height.mas_equalTo(@100);
//        
//    }];
//    
//    [self.sumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.left.mas_equalTo(self.titleLabel.mas_left);
//        make.width.mas_equalTo(self.titleLabel.mas_width);
//        make.top.mas_equalTo(self.mainImgView.mas_bottom).offset(8*screenH);
//        make.height.mas_equalTo(@(16.5*screenH));
//        
//    }];
//    
//    [_lowbgdView mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.bottom.mas_equalTo(self.mas_bottom);
//        make.left.mas_equalTo(self.mas_left);
//        make.right.mas_equalTo(self.mas_right);
//        make.height.mas_equalTo(@(screenH*35));
//        
//    }];
//
//    [_yueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.left.mas_equalTo(self.sumLabel.mas_left);
//        make.width.mas_equalTo(@50);
//        make.height.mas_equalTo(screenH*16.5);
//        make.centerY.mas_equalTo(_lowbgdView.mas_centerY);
//        
//    }];
//
//    [_pimageView mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.right.mas_equalTo(self.titleLabel.mas_right);
//        make.width.mas_equalTo(@8);
//        make.height.mas_equalTo(@15);
//        make.centerY.mas_equalTo(_lowbgdView.mas_centerY);
//        
//    }];
//    
//}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
