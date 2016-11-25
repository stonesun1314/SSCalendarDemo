//
//  SSCalendarHeaderModel.h
//  SSCalendarDemo
//
//  Created by LazyCat-Stone on 2016/11/25.
//  Copyright © 2016年 LazyCat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSCalendarHeaderModel : NSObject

@property (nonatomic, copy) NSString *headerText;
@property (nonatomic, strong) NSArray *calendarItemArray;

@end

typedef NS_ENUM(NSInteger, SSCalendarType)
{
    SSCalendarTodayType = 0,
    SSCalendarLastType,
    SSCalendarNextType
};

@interface SSCalendarModel : NSObject

@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger day;
@property (nonatomic, copy) NSString *chineseCalendar;  //农历
@property (nonatomic, copy) NSString *holiday;          //节日
@property (nonatomic, assign) SSCalendarType type;
@property (nonatomic, assign) NSInteger dateInterval;   //日期的时间戳
@property (nonatomic, assign) NSInteger week;           //星期

@end
