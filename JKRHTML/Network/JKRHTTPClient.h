//
//  JKRHTTPClient.h
//  XiaoZhuLi
//
//  Created by tronsis_ios on 16/12/19.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface JKRHTTPClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
