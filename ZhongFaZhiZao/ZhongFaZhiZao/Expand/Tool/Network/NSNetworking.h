//
//  NSNetworking.h
//  NeiSha
//
//  Created by paperclouds on 16/7/29.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Success)(id response);

typedef void(^Failure)(NSString *error);

@interface NSNetworking : NSObject

+ (NSNetworking *)sharedManager;
/**
 *  GET上传
 *
 *  @param url        API地址
 *  @param parameters 参数字典
 *  @param success    成功block
 *  @param failure    失败block
 */
- (void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;
/**
 *  POST上传
 *
 *  @param url        API地址
 *  @param parameters 参数字典
 *  @param success    成功block
 *  @param failure    失败block
 */
- (void)post:(NSString *)url parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

@end
