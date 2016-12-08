//
//  SetMeTableViewCell.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/8.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "SetMeTableViewCell.h"


@implementation SetMeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self createSetMe];
    }
    
    return self;
}


- (void)createSetMe {

//    直接去UITableViewCell 方法中创建
    
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
