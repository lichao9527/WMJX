//
//  NewsDetailViewController.m
//  文明嘉兴
//
//  Created by dc003 on 16/6/15.
//  Copyright © 2016年 dc003. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()
- (IBAction)back:(id)sender;

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%lu",self.num);
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
