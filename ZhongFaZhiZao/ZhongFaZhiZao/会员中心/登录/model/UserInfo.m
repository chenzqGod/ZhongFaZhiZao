//
//  UserInfo.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/6.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

+ (UserInfo *)sharedUserInfo {

    static UserInfo *userInfo = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
       
        userInfo = [[UserInfo alloc]init];
        
        userInfo.isLogin = NO;
        
    });

    return userInfo;
}

@end
