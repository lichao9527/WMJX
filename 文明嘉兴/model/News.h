//
//  News.h
//  文明嘉兴
//
//  Created by dc003 on 16/6/8.
//  Copyright © 2016年 dc003. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
@property(nonatomic,strong)NSString *imageurl;

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSString *source;
@property(nonatomic,strong)NSNumber *praiseNum;
@property(nonatomic,strong)NSNumber *browseNum;
@property(nonatomic,strong)AFHTTPSessionManager *manager;

+(void)refreshNewsWithNum:(int)num;
-(void)getDataWithNum:(int)num;
@end
