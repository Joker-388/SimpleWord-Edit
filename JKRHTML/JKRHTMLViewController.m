//
//  JKRHTMLViewController.m
//  JKRHTML
//
//  Created by tronsis_ios on 16/12/27.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import "JKRHTMLViewController.h"

@interface JKRHTMLViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation JKRHTMLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)setHTMLString:(NSString *)HTMLString {
    _HTMLString = HTMLString;
    
    [self.webView loadHTMLString:self.HTMLString baseURL:nil];
}

@end
