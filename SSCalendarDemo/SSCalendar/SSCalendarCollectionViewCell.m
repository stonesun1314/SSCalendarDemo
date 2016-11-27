//
//  SSCalendarCollectionViewCell.m
//  SSCalendarDemo
//
//  Created by LazyCat-Stone on 2016/11/24.
//  Copyright © 2016年 LazyCat. All rights reserved.
//

#import "SSCalendarCollectionViewCell.h"
#import "SSCalendarMacros.h"

@interface SSCalendarCollectionViewCell ()

@property (nonatomic, strong) UIView *rightLine;
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation SSCalendarCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self createCell];
    
        
        /*
        int r = arc4random() % 255;
        int g = arc4random() % 255;
        int b = arc4random() % 255;
        self.backgroundColor = [UIColor colorWithRed:r/255.0f green:g/255.f blue:b/255.f alpha:1.0];
         */
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
    
    _rightLine = [[UIView alloc] initWithFrame:CGRectMake(self.contentView.bounds.size.width-1, 0, 1, self.contentView.bounds.size.height)];
    _rightLine.backgroundColor = SS_CalendarSeparatorLineColor;
    [self addSubview:_rightLine];
    
    _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.contentView.bounds.size.height-1, self.contentView.bounds.size.width, 1)];
    _bottomLine.backgroundColor = SS_CalendarSeparatorLineColor;
    [self addSubview:_bottomLine];
    
}

- (void)setHiddenSeparatorLine:(BOOL)hiddenSeparatorLine{
    _hiddenSeparatorLine = hiddenSeparatorLine;
    _rightLine.hidden = hiddenSeparatorLine;
    _bottomLine.hidden = hiddenSeparatorLine;
}

@end
