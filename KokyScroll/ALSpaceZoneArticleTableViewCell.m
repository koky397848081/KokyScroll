//
//  ALSpaceZoneArticleTableViewCell.m
//  ALApp
//
//  Created by xujing on 16/8/8.
//  Copyright © 2016年 AiLi. All rights reserved.
//

#import "ALSpaceZoneArticleTableViewCell.h"

@interface ALSpaceZoneArticleTableViewCell()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *autherLayoutX;

@end

@implementation ALSpaceZoneArticleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _autherNameL.text = @"评论：4";
    _titleL.text = @"华丽丽的标题文字";
    _upCountL.text = [NSString stringWithFormat:@"阅读 %d",100] ;
    _thumbPathImg.image = [UIImage imageNamed:@"img"];
}

@end
