//
//  JKREditViewController.h
//  JKRHTML
//
//  Created by tronsis_ios on 16/12/27.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMWordView.h"

@interface JKREditViewController : UIViewController

@property (weak, nonatomic) IBOutlet LMWordView *textView;
- (NSString *)exportHTML;
- (void)getNetworkHTMLStringSuccess:(void (^)(NSString *htmlString))success failure:(void (^)(NSError *error))failure;

@end
