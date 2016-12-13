//
//  UserLoginTextField.h
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/13.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserLoginTextField : UITextField
- (CGRect)leftViewRectForBounds:(CGRect)bounds;
- (CGRect)textRectForBounds:(CGRect)bounds;
- (CGRect)editingRectForBounds:(CGRect)bounds;

@end
