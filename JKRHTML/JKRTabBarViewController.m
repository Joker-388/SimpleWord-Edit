//
//  JKRTabBarViewController.m
//  JKRHTML
//
//  Created by tronsis_ios on 16/12/27.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import "JKRTabBarViewController.h"
#import "JKREditViewController.h"

@interface JKRTabBarViewController ()

@end

@implementation JKRTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    JKREditViewController *sourceViewController = self.childViewControllers[0];
    UIViewController *destinationViewController = self.childViewControllers[1];
    
    [sourceViewController getNetworkHTMLStringSuccess:^(NSString *htmlString) {
        [destinationViewController setValue:htmlString forKeyPath:@"HTMLString"];
    } failure:^(NSError *error) {
        
    }];
}

@end
