//
//  JKRHTTPClient.m
//  XiaoZhuLi
//
//  Created by tronsis_ios on 16/12/19.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import "JKRHTTPClient.h"

static NSString *const DPHTTPClientBaseURL = @"http://192.168.31.185:8080/xiaozhuli/";

@implementation JKRHTTPClient

+ (instancetype)sharedClient {
    static JKRHTTPClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[JKRHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:DPHTTPClientBaseURL]];
        [_sharedClient.requestSerializer setTimeoutInterval:30];
        [_sharedClient.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil]];
        [_sharedClient.requestSerializer setValue:@"$@!m@^l!49k58z10203$@!m@^l!49k58z10203" forHTTPHeaderField:@"Authorization"];
        AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
        [securityPolicy setAllowInvalidCertificates:YES];
        [_sharedClient setSecurityPolicy:securityPolicy];
    });
    return _sharedClient;
}

@end
