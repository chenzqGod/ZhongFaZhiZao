//
//  NSString+Time.m
//  NeiSha
//
//  Created by paperclouds on 16/7/31.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "NSString+Time.h"

@implementation NSString (Time)
- (NSString *)calculateTimeInterVal
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *nowDate = [NSDate date];
    NSDate *needFormateDate = [dateFormatter dateFromString:self];
    
    // 获取时间间隔.
    NSTimeInterval timeInterval = [nowDate timeIntervalSinceDate:needFormateDate];
    NSString *dateStr = nil;
    
    if (timeInterval <= 60) // 一分钟以内
        dateStr = @"刚刚";
    else if (timeInterval <= 60*60) // 一小时内
    {
        int mins = timeInterval / 60;
        dateStr = [NSString stringWithFormat:@"%d分钟前", mins];
    }
    else if (timeInterval <= 60*60*24) // 在两天内的
    {
        [dateFormatter setDateFormat:@"YYYY-MM-dd"];
        NSString *need_yMd = [dateFormatter stringFromDate:needFormateDate];
        NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
        
        [dateFormatter setDateFormat:@"HH:mm"];
        
        if ([need_yMd isEqualToString:now_yMd]) // 同一天
        {
            dateStr = [NSString stringWithFormat:@"今天%@", [dateFormatter stringFromDate:needFormateDate]];
        }
        else // 昨天
        {
            dateStr = [NSString stringWithFormat:@"昨天%@", [dateFormatter stringFromDate:needFormateDate]];
        }
    }
    else
    {
        [dateFormatter setDateFormat:@"yyyy"];
        NSString *yearStr = [dateFormatter stringFromDate:needFormateDate];
        NSString *nowYear = [dateFormatter stringFromDate:nowDate];
        
        if ([yearStr isEqualToString:nowYear]) // 同一年
        {
            [dateFormatter setDateFormat:@"MM-dd"];
            dateStr = [dateFormatter stringFromDate:needFormateDate];
        }
        else
        {
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            dateStr = [dateFormatter stringFromDate:needFormateDate];
        }
    }
    return dateStr;
}
@end
