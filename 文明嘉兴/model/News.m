//
//  News.m
//  文明嘉兴
//
//  Created by dc003 on 16/6/8.
//  Copyright © 2016年 dc003. All rights reserved.
//

#import "News.h"

@implementation News

+(void)refreshNewsWithNum:(int)num{
    [[self alloc]getDataWithNum:num];
}
-(void)getDataWithNum:(int)num{
    NSDictionary *bannerDict=@{
                         @"categoryId":@1,
                         };
    NSDictionary *newsDict=@{
                             @"categoryId":@1,
                             @"pageNum":@(num)
                             };
    //获取tableView新闻数据
    [self.manager POST:HTTP_news
            parameters:newsDict
              progress:nil
               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"result"] isEqualToNumber:@0]) {
            NSArray *arrDate= responseObject[@"data"];
            NSArray *news=[News mj_objectArrayWithKeyValuesArray:arrDate];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"notification" object:news];
        }else{
            NSLog(@"请求失败：%@",responseObject[@"message"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求错误：%@",error);
    }];
    //获取banner新闻数据
    [self.manager POST:HTTP_banner
            parameters:bannerDict
              progress:nil
               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                   if ([responseObject[@"result"] isEqualToNumber:@0]) {
                       NSArray *bannerDate= responseObject[@"data"];
                       NSArray *banner=[News mj_objectArrayWithKeyValuesArray:bannerDate];
                       [[NSNotificationCenter defaultCenter]postNotificationName:@"bannerNotification" object:banner];
                   }else{
                       NSLog(@"请求失败：%@",responseObject[@"message"]);
                   }
               } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                   NSLog(@"请求错误：%@",error);
               }];
}

- (AFHTTPSessionManager *)manager{
    if (_manager) {
        return  _manager;
    }
    _manager = [AFHTTPSessionManager manager];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    return _manager;
}
@end
