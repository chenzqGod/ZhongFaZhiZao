//
//  CaculateLabelHeight.h
//  NeiSha
//
//  Created by chenzhiqiang on 16/6/28.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaculateLabelHeight : NSObject

//类方法
+ (CGFloat)getSpaceLabelHeight:(NSString *)str withWidth:(CGFloat)width andFont:(CGFloat)font andLines:(CGFloat)line;

@end
