//
//  JKRHTTPHeader.h
//  XiaoZhuLi
//
//  Created by tronsis_ios on 16/12/19.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKRHTTPHeader : NSObject

@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) NSInteger result_count;

@end
