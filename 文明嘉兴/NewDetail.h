//
//  NewDetail.h
//  文明嘉兴
//
//  Created by dc003 on 16/6/23.
//  Copyright © 2016年 dc003. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewDetail : NSObject

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *source;
@property(nonatomic,strong)AFHTTPSessionManager *manager;
@property(nonatomic,strong)NSString *issuestime;
+(void)refreshNewsWithDict:(NSDictionary *)detail;
-(void)getDataWithDict:(NSDictionary *)detail;

@end
