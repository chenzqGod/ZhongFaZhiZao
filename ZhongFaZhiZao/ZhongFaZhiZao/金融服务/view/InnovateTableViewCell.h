//
//  InnovateTableViewCell.h
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/1/12.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InnovateTableViewCell : UITableViewCell

@property (nonatomic,strong)UIImageView *iconImgView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *recommondLabel;
@property (nonatomic,strong)UILabel *suumaryLabel;

//标签（最多三个）
@property (nonatomic,strong)UIImageView *FirstImg;
@property (nonatomic,strong)UIImageView *SecondImg;
@property (nonatomic,strong)UIImageView *ThirdImg;


@end
