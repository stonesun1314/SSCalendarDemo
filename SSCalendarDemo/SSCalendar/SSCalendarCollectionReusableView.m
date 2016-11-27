//
//  SSCalendarCollectionReusableView.m
//  SSCalendarDemo
//
//  Created by LazyCat-Stone on 2016/11/24.
//  Copyright © 2016年 LazyCat. All rights reserved.
//

#import "SSCalendarCollectionReusableView.h"
#import "SSCalendarMacros.h"

@implementation SSCalendarCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createReusableView];
        
        
    }
    return self;
}

- (void)createReusableView
{
    UIView *headerView = [[UIView alloc]init];
    headerView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:headerView];
    
    _headerLabel = [[UILabel alloc]init];
    _headerLabel.frame = CGRectMake(10, 0, self.frame.size.width - 10, self.frame.size.height);
    _headerLabel.textAlignment = NSTextAlignmentCenter;
    _headerLabel.backgroundColor = [UIColor clearColor];
    _headerLabel.textColor = SS_HeaderViewTextColor;
    [headerView addSubview:_headerLabel];
    
}

@end
