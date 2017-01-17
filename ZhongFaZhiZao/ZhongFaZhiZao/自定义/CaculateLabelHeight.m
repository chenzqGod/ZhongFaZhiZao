//
//  CaculateLabelHeight.m
//  NeiSha
//
//  Created by chenzhiqiang on 16/6/28.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "CaculateLabelHeight.h"

@implementation CaculateLabelHeight

#pragma mark 计算富文本的高度

+(CGFloat)getSpaceLabelHeight:(NSString *)str withWidth:(CGFloat)width andFont:(CGFloat)font andLines:(CGFloat)line{

    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc]init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = line;
    [paraStyle setLineSpacing:line];
//    paraStyle.hyphenationFactor = 1.0;
//    paraStyle.firstLineHeadIndent = 0.0;
//    paraStyle.paragraphSpacingBefore = 0.0;
//    paraStyle.headIndent = 0;
//    paraStyle.tailIndent = 0;
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:str];
    [attString addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, [str length])];
    
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:font],
                          NSParagraphStyleAttributeName:paraStyle//,
//                          NSKernAttributeName:@1.0f
                          };
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size.height;
}

@end
