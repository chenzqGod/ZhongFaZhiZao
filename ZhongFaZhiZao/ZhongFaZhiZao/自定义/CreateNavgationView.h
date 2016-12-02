//
//  CreateNavgationView.h
//  NeiSha
//
//  Created by chenzhiqiang on 16/6/28.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateNavgationView : UIView

@property (weak,nonatomic)UIViewController *viewController;

- (instancetype)initWithFrame:(CGRect)frame andBgd:(NSString *)background andtitle:(NSString *)title andtitleColor:(NSString *)titleColor;

@end
