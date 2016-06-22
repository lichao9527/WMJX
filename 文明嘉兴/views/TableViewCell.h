//
//  TableViewCell.h
//  文明嘉兴
//
//  Created by dc003 on 16/6/4.
//  Copyright © 2016年 dc003. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *source;
@property (weak, nonatomic) IBOutlet UILabel *zan;
@property (weak, nonatomic) IBOutlet UILabel *browseNum;

@end
