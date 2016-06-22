//
//  NewsViewController.m
//  文明嘉兴
//
//  Created by dc003 on 16/6/14.
//  Copyright © 2016年 dc003. All rights reserved.
//

#import "NewsViewController.h"
#import "ViewController.h"
#import "YcSegmentView.h"

#import "UIView+Reduce.h"

@interface ViewController ()<YcSegmentViewDelegate>
{
    NewsViewController *Controller;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titles=@[@"文明创建",@"文明播报",@"道德模范",@"主题活动",@"区县传真",@"未成年人",@"主题活动",@"我们的节日"];
//    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController *ctrl0=[story instantiateViewControllerWithIdentifier:@"NewsViewController"];
//    [self addChildViewController:ctrl0];
    NSArray *ctrlArr=@[@"NewsViewController",@"NewsViewController",@"NewsViewController",@"NewsViewController",@"NewsViewController",@"NewsViewController",@"NewsViewController",@"NewsViewController"];
    YcSegmentView * segmentView = [[YcSegmentView alloc]initWithFrame:CGRectMake(0, 20, SCREENW, SCREENH) andHeaderHeight:30.f andTitleArray:titles andShowControllerNameArray:ctrlArr];
    segmentView.delegate = self;
    [self.view addSubview:segmentView];
}
- (void)didSelectIndex:(NSInteger)index{
    NSLog(@"%ld",index);
}

@end
