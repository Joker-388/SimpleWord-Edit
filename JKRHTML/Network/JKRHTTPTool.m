//
//  JKRHTTPTool.m
//  XiaoZhuLi
//
//  Created by tronsis_ios on 16/12/19.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import "JKRHTTPTool.h"
#import "JKRHTTPClient.h"

@implementation JKRHTTPTool

+ (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    return [[JKRHTTPClient sharedClient] GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    return [[JKRHTTPClient sharedClient] POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters datas:(NSArray<NSData *> *)datas fileName:(NSString *)fileName success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    return [[JKRHTTPClient sharedClient] POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (NSData *data in datas) {
            [formData appendPartWithFileData:data name:fileName fileName:@"file.png" mimeType:@"image/png"];
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end
