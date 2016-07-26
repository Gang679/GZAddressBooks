//
//  FollwTableViewCell.m
//  MeiChou
//
//  Created by xinshijie on 16/4/7.
//  Copyright © 2016年 Mr.quan. All rights reserved.
//
/*
 *********************************************************************************
 *
 *  QQ    : 3139726292
 * 新浪微博 : 轻斟浅醉17
 * Email  : 3139726292@qq.com
 * GitHub : https://github.com/Gang679
 * 博客园  : http://www.cnblogs.com/Gang679/
 * 博客    : http://gang679.blog.163.com
 *********************************************************************************
 */

#import "FollwTableViewCell.h"
#import "UIView+SDAutoLayout.h"
@implementation FollwTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self layoutSubviews];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _headerImage = [[UIImageView alloc]init];
    [self.contentView addSubview:_headerImage];
    
    _NameLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_NameLabel];
    
    _headerImage.sd_layout
    .leftSpaceToView(self.contentView , 10)
    .widthIs(30)
    .heightIs(30)
    .centerYEqualToView(self.contentView);
    
    _NameLabel.sd_layout
    .leftSpaceToView(_headerImage , 10)
    .widthIs(100)
    .heightIs(21)
    .centerYEqualToView(self.contentView);
    _NameLabel.textAlignment = NSTextAlignmentLeft;
    
    _headerImage.layer.cornerRadius = 15;
    _headerImage.layer.masksToBounds = YES;
}
@end
