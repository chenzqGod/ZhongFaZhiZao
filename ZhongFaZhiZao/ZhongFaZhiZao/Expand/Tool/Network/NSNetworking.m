//
//  NSNetworking.m
//  NeiSha
//
//  Created by paperclouds on 16/7/29.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "NSNetworking.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@implementation NSNetworking

+(NSNetworking *)sharedManager
{
    static NSNetworking *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NSNetworking alloc]init];
    });
    
    return manager;
}

- (AFHTTPSessionManager *)baseSessionManager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableLeaves];
    //    [manager.requestSerializer setTimeoutInterval:20.0f];
    
    NSString *token = [USER_DEFAULTS objectForKey:@"token"];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"zfa_token"];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html", @"application/javascript", @"application/json", @"text/json", @"text/javascript", nil];
    
    return manager;
}

- (void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure
{
    AFHTTPSessionManager *manager = [self baseSessionManager];
    
//    NSString *token = [USER_DEFAULTS objectForKey:@"token"];
//    [manager.requestSerializer setValue:token forHTTPHeaderField:@"zfa_token"];

    NSString *UTF8_URL = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager GET:UTF8_URL parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
        failure(errorStr);
    }];
}

- (void)post:(NSString *)url parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure
{
    AFHTTPSessionManager *manager = [self baseSessionManager];
    NSString *token = @"";
    if ([USER_DEFAULTS objectForKey:@"token"]) {
       
        token = [NSString stringWithFormat:@"%@",[USER_DEFAULTS objectForKey:@"token"]];
    }
    
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"zfa_token"];
    NSString *UTF8_URL = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager POST:UTF8_URL parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
        failure(errorStr);
    }];
}


#pragma mark - 用法
//- (void)requestData{
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    [[NSNetworking sharedManager]get:[NSString stringWithFormat:@"%@%@",HOST_URL,COMMUNITY_HOT_SEARCH] parameters:nil success:^(id response) {
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        for (NSDictionary *dict in response[@"items"]) {
//            [self.hotSearchArray addObject:@{@"content_name":dict[@"name"]}];
//        }
//        [self prepareData];
//        [self.searchCollectionView reloadData];
//    } failure:^(NSString *error) {
//        
//    }];
//}


@end
