//
//  UserInfo.h
//  NeiSha
//
//  Created by paperclouds on 16/8/12.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

+ (UserInfo *)sharedUserInfo;

@property (nonatomic, copy) NSString *desId; // 用户加密ID
@property (nonatomic, copy) NSString *mob; // 用户手机号
@property (nonatomic, copy) NSString *nickName; // 用户昵称
@property (nonatomic, copy) NSString *photo; // 用户头像地址
@property (nonatomic, copy) NSString *createDate; // 注册时间
@property (nonatomic, copy) NSString *password; // 密码
@property (nonatomic, copy) NSString *uid; //uid
@property (nonatomic, assign) BOOL isLogin;

@end
