//
//  AppDelegate.h
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/3.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RongIMLib/RongIMLib.h>
#import <RongIMKit/RongIMKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,RCIMConnectionStatusDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (copy,nonatomic) NSMutableDictionary *pushDic;

@end

