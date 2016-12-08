//
//  AskTableViewCell.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/7.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "AskTableViewCell.h"

#define AskCellW    351.0
#define AskCellH    240.0




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


- (void)setFrame:(CGRect)frame {

    CGRect newFrame = frame;
    
    newFrame.size.width = frame.size.width - Margin*2;
    
    newFrame.origin.x = Margin;
    
    newFrame.size.height = newFrame.size.width / AskCellW * AskCellH;
    
    [super setFrame:newFrame];
}


- (void)createUI {
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:17.0];
    [self addSubview:self.titleLabel];

    self.mainImgView = [[UIImageView alloc]init];
    [self addSubview:self.mainImgView];
    
    self.sumLabel = [[UILabel alloc]init];
    
    self.sumLabel.font = [UIFont systemFontOfSize:12.0];
    self.sumLabel.textColor = [UIColor colorWithHexString:@"#9B9B9B"];
    [self addSubview:self.sumLabel];
    
    _lowbgdView = [[UIView alloc]init];
    _lowbgdView.backgroundColor = [UIColor colorWithHexString:@"#244356"];
    [self addSubview:_lowbgdView];
    
    _yueLabel = [[UILabel alloc]init];
    _yueLabel.text = @"阅读全文";
    _yueLabel.textColor = [UIColor colorWithHexString:@"#4A4A4A"];
    _yueLabel.font = [UIFont systemFontOfSize:12.0];
    [_lowbgdView addSubview:_yueLabel];
    
    _pimageView = [[UIImageView alloc]init];
    _pimageView.image = [UIImage imageNamed:@""];
    [_lowbgdView addSubview:_pimageView];
    
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(@14);
        make.width.mas_equalTo(@(self.frame.size.width-14*2));
//        make.width.mas_equalTo(self.mas_width-14*2);
        make.height.mas_equalTo(@(24*screenH));
        make.top.mas_equalTo(@(8*screenH));
        
    }];
    
    [self.mainImgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(@10);
        make.width.mas_equalTo(@(self.frame.size.width-10*2));
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(8*screenH);
        make.height.mas_equalTo(@100);
        
    }];
    
    [self.sumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.width.mas_equalTo(self.titleLabel.mas_width);
        make.top.mas_equalTo(self.mainImgView.mas_bottom).offset(8*screenH);
        make.height.mas_equalTo(@(16.5*screenH));
        
    }];
    
    [_lowbgdView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.bottom.mas_equalTo(self.mas_bottom);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_equalTo(@(screenH*35));
        
    }];

    [_yueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.sumLabel.mas_left);
        make.width.mas_equalTo(@50);
        make.height.mas_equalTo(screenH*16.5);
        make.centerY.mas_equalTo(_lowbgdView.mas_centerY);
        
    }];

    [_pimageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.mas_equalTo(self.titleLabel.mas_right);
        make.width.mas_equalTo(@8);
        make.height.mas_equalTo(@15);
        make.centerY.mas_equalTo(_lowbgdView.mas_centerY);
        
    }];
    
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
