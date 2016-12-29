//
//  LMHTMLHelper.m
//  JKRHTML
//
//  Created by tronsis_ios on 16/12/29.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import "LMHTMLHelper.h"

@implementation LMHTMLHelper

+ (NSRegularExpression *)regexImage {
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [NSRegularExpression regularExpressionWithPattern:@"<img src=\"[\\/:+.\%-_a-zA-Z0-9\u4E00-\u9FA5]+?\" width" options:kNilOptions error:NULL];
    });
    return regex;
}

@end
