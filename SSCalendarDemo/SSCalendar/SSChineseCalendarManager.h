//
//  SSChineseCalendarManager.h
//  SSCalendarDemo
//
//  Created by LazyCat-Stone on 2016/11/14.
//  Copyright © 2016年 LazyCat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSCalendarHeaderModel.h"

@interface SSChineseCalendarManager : NSObject

- (void)getChineseCalendarWithDate:(NSDate *)date calendarItem:(SSCalendarModel *)calendarItem;

- (BOOL)isQingMingholidayWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;


@end
