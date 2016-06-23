//
//  NewDetail.m
//  文明嘉兴
//
//  Created by dc003 on 16/6/23.
//  Copyright © 2016年 dc003. All rights reserved.
//

#import "NewDetail.h"

@implementation NewDetail
+(void)refreshNewsWithDict:(NSDictionary *)detail{
    [[self alloc]getDataWithDict:detail];
}
-(void)getDataWithDict:(NSDictionary *)detail{
//    NSDictionary *newsDict=@{
//                             @"newsId":news.newsId,
//                             @"categoryFk":@1,
//                             @"pageNum":@(detail)
//                             };
    //获取新闻详情
    [self.manager POST:HTTP_news
            parameters:detail
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
