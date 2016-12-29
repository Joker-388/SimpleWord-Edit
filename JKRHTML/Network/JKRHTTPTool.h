//
//  JKRHTTPTool.h
//  XiaoZhuLi
//
//  Created by tronsis_ios on 16/12/19.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKRHTTPTool : NSObject

+ (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters datas:(NSArray<NSData *> *)datas fileName:(NSString *)fileName success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;


@end
