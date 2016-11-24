//
//  SSCalendarCollectionViewCell.m
//  SSCalendarDemo
//
//  Created by LazyCat-Stone on 2016/11/24.
//  Copyright © 2016年 LazyCat. All rights reserved.
//

#import "SSCalendarCollectionViewCell.h"
#import "SSCalendarMacros.m"

@implementation SSCalendarCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createCell];
    }
    return self;
}

- (void)createCell{
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
    [self.contentView addSubview:_imageView];
    
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, SS_Iphone6Scale(10), self.contentView.frame.size.width, self.frame.size.height / 2 - SS_Iphone6Scale(10))];
    _dateLabel.textAlignment = NSTextAlignmentCenter;
    _dateLabel.font = [UIFont systemFontOfSize:13.0f];
    [self.contentView addSubview:_dateLabel];
    
    _subLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_dateLabel.frame), self.contentView.frame.size.width, _dateLabel.frame.size.height)];
    _subLabel.textAlignment = NSTextAlignmentCenter;
    _subLabel.font = [UIFont systemFontOfSize:10.0f];
    [self.contentView addSubview:_subLabel];
}

@end
