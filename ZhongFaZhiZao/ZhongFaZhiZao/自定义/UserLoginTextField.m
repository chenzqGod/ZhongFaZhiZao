//
//  UserLoginTextField.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/13.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "UserLoginTextField.h"

@implementation UserLoginTextField

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 15; //像右边偏15
    return iconRect;
}

- (CGRect)textRectForBounds:(CGRect)bounds {

    return CGRectInset(bounds, 45, 0);

}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    
    return CGRectInset(bounds, 45, 0);

}

@end


