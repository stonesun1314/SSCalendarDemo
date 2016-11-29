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
    
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, self.contentView.frame.size.width-5, 14)];
    _dateLabel.textAlignment = NSTextAlignmentLeft;
    _dateLabel.font = [UIFont systemFontOfSize:12.0f];
    [self.contentView addSubview:_dateLabel];
    
    _stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_dateLabel.frame), self.contentView.frame.size.width-5, 14)];
    _stateLabel.textAlignment = NSTextAlignmentRight;
    _stateLabel.textColor = [UIColor whiteColor];
    _stateLabel.font = [UIFont boldSystemFontOfSize:12.f];
    [self.contentView addSubview:_stateLabel];
    
    _subLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_stateLabel.frame), self.contentView.frame.size.width-5, 12)];
    _subLabel.textAlignment = NSTextAlignmentRight;
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

- (void)setSelectedState:(SSCalendarItemState)selectedState{
    _selectedState = selectedState;
    self.dateLabel.textColor = [UIColor whiteColor];
    self.stateLabel.text = @"";
    self.subLabel.text = @"￥223";
    switch (_selectedState) {
        case SSCalendarItemStateInSelected:{
            self.backgroundColor = SS_CalendarSelectedItemBackgroundColor;
            self.stateLabel.text = @"入住";
            self.subLabel.textColor = [UIColor whiteColor];
        }
            break;
        case SSCalendarItemStateLeaveSelected:
        {
            self.backgroundColor = SS_CalendarSelectedItemBackgroundColor;
            self.subLabel.text = @"";
            self.stateLabel.text = @"离店";
            self.subLabel.textColor = [UIColor whiteColor];
        }
            break;
        case SSCalendarViewStateBetweenSelected:
        {
            self.backgroundColor = SS_CalendarBetweenSelectedItemBackgroundColor;
            self.stateLabel.text = @"";
            self.subLabel.textColor = [UIColor whiteColor];
        }
            break;
        case SSCalendarItemStateDefault:
        default:
        {
            self.backgroundColor = [UIColor whiteColor];
            self.dateLabel.textColor = SS_TextColor;
            self.stateLabel.text = @"";
            self.subLabel.textColor = SS_CalendarSelectedItemBackgroundColor;
            
        }
            break;
    }
    
}

@end
