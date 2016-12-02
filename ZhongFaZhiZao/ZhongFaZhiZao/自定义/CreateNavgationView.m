//
//  CreateNavgationView.m
//  NeiSha
//
//  Created by chenzhiqiang on 16/6/28.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "CreateNavgationView.h"

@implementation CreateNavgationView

- (instancetype)initWithFrame:(CGRect)frame andBgd:(NSString *)background andtitle:(NSString *)title andtitleColor:(NSString *)titleColor{

    if (self = [super initWithFrame:frame]) {
        
        UIView *navView = [[UIView alloc]initWithFrame:frame];
        navView.backgroundColor = [UIColor colorWithHexString:background];
        [self addSubview:navView];
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton addTarget:self action:@selector(leftBarButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
        leftButton.titleLabel.font = [UIFont fontWithName:IconFont size:22.0];
        [leftButton setTitle:@"\U0000e61f" forState:UIControlStateNormal];
        [leftButton sizeToFit];
//        leftButton.width = leftButton.width + 30;
//        CGFloat centeXX = leftButton.width * 0.25;
//        leftButton.center = CGPointMake(centeXX, 44);
        [leftButton setTitleColor:[UIColor colorWithHexString:titleColor] forState:UIControlStateNormal];
        [navView addSubview:leftButton];
        
        UILabel *midLabel = [[UILabel alloc]init];
        midLabel.frame = CGRectMake(0, 0, 180, 18);
        midLabel.center = CGPointMake(screenWidth/2.0, 42);
        midLabel.text = title;
        midLabel.textColor = [UIColor colorWithHexString:titleColor];
        midLabel.textAlignment = NSTextAlignmentCenter;
        midLabel.font = [UIFont systemFontOfSize:18.0];
        [self addSubview:midLabel];

        
    }
    
    return self;
    
}

#pragma mark - nav leftbutton点击事件
- (void)leftBarButtonItemClick{
    
    //    pop
    
//    NeiShaLog(@"----返回上级----");
    
    if (self.viewController) {
        
        [self.viewController.navigationController popViewControllerAnimated:YES];
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
