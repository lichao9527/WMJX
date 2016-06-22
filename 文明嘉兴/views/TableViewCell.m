//
//  TableViewCell.m
//  文明嘉兴
//
//  Created by dc003 on 16/6/4.
//  Copyright © 2016年 dc003. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *arr=[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil];
        self=arr[0];
    }
    self.newsImage.layer.cornerRadius=37;
    self.newsImage.layer.masksToBounds=YES;
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
