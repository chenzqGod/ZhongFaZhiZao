//
//  CustomButton.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/20.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect{

    if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect, CGRectZero)) {
        
        return self.titleRect;
    }
    
    return [super titleRectForContentRect: contentRect];

}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{

    if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero)) {
        
        return self.imageRect;
    }
    
    return [super imageRectForContentRect:contentRect];
}

@end
