//
//  RuleMacros.h
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/9.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//


//  常用颜色
#define MAIN_BGD_COLOR   [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1]]


//iphone6适配
#define WIDTH [UIScreen mainScreen].bounds.size.width/375
#define HEIGHT [UIScreen mainScreen].bounds.size.height/667


#define IconFont  @"宋体"

#define HUD_DURATION         1.0
#define USER_DEFAULTS        [NSUserDefaults standardUserDefaults]

//缓存
#define USER_DEFAULTS        [NSUserDefaults standardUserDefaults]
#define isTemp               ![USER_DEFAULTS objectForKey:@"token"]
//屏幕尺寸
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height


//屏幕比例
#define screenScale   screenWidth/375.0

#define screenH       screenWidth/667.0

//数据库表名字
#define PUSH_DATA    @"pushdata"

//间距
#define Margin 12

//红色
#define RED_COLOR   [UIColor colorWithHexString:@"#F35833"]

//蓝色
#define BLUE_COLOR  [UIColor colorWithHexString:@"#31B3EF"]

//灰字颜色
#define TEXT_GREY_COLOR  [UIColor colorWithHexString:@"#9B9B9B"]

#define TEXT_SUMMARY_COLOR [UIColor colorWithHexString:@"#4a4a4a"]

//下划线颜色
#define TEXT_LINE_COLOR  [UIColor colorWithHexString:@"#EBEBEB"]


// 主颜色
#define MAIN_COLOR [UIColor colorWithHexString:@"23aBec"]


// 横线颜色
#define LINE_COLOR [UIColor colorWithHexString:@"#e5e5e5"]

// 背景颜色
#define BACK_COLOR [UIColor colorWithHexString:@"#F5F5F5"]

#define BACK2_COLOR  [UIColor colorWithHexString:@"#F1F1F1"]
