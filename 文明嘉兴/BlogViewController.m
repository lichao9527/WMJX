//
//  BlogViewController.m
//  文明嘉兴
//
//  Created by dc003 on 16/6/22.
//  Copyright © 2016年 dc003. All rights reserved.
//

#import "BlogViewController.h"

@interface BlogViewController ()

@end

@implementation BlogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView=[[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://weibo.com/u/2852517300?is_hot=1"]];
    [webView loadRequest:request];
    MBProgressHUD *hub=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hub.labelText=@"数据加载中...";
    [hub hide:YES afterDelay:3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
