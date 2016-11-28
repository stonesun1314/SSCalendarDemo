//
//  SSCalendarCollectionViewCell.h
//  SSCalendarDemo
//
//  Created by LazyCat-Stone on 2016/11/24.
//  Copyright © 2016年 LazyCat. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SSCalendarItemState)
{
    SSCalendarItemStateDefault = 0,              // 默认没选中
    SSCalendarItemStateSelected,                 // 日历选中态
    SSCalendarViewStateBetweenSelected           // 在两个选中日期之间
};

@interface SSCalendarCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *subLabel;
@property (nonatomic, assign) BOOL hiddenSeparatorLine;
@property (nonatomic, assign) SSCalendarItemState selectedState;

@end
