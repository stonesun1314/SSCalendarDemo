//
//  SSCalendarManager.h
//  SSCalendarDemo
//
//  Created by LazyCat-Stone on 2016/11/24.
//  Copyright © 2016年 LazyCat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSCalendarViewController.h"

@interface SSCalendarManager : NSObject

- (instancetype)initWithShowChineseHoliday:(BOOL)showChineseHoliday showChineseCalendar:(BOOL)showChineseCalendar startDate:(NSInteger)startDate;

//获取数据源
- (NSArray *)getCalendarDataSourceWithLimitMonth:(NSInteger)limitMonth type:(SSCalendarViewControllerType)type;

@property (nonatomic, strong) NSIndexPath *startIndexPath;


@end
