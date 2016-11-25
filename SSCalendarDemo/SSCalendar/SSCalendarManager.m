//
//  SSCalendarManager.m
//  SSCalendarDemo
//
//  Created by LazyCat-Stone on 2016/11/24.
//  Copyright © 2016年 LazyCat. All rights reserved.
//

#import "SSCalendarManager.h"
#import "SSChineseCalendarManager.h"

@interface SSCalendarManager ()

@property (nonatomic, strong) NSDate *todayDate;
@property (nonatomic, strong) NSDateComponents *todayCompontents;
@property (nonatomic, strong) NSCalendar *greCalendar;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) SSChineseCalendarManager *chineseCalendarManager;
@property (nonatomic, assign) BOOL showChineseHoliday;
@property (nonatomic, assign) BOOL showChineseCalendar;
@property (nonatomic, assign) NSInteger startDate;

@end

@implementation SSCalendarManager

- (instancetype)initWithShowChineseHoliday:(BOOL)showChineseHoliday showChineseCalendar:(BOOL)showChineseCalendar startDate:(NSInteger)startDate{
    
    self = [super init];
    if (self) {
        _greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        _todayDate = [NSDate date];
        _todayCompontents = [self dateToComponents:_todayDate];
        _chineseCalendarManager = [[SSChineseCalendarManager alloc]init];
        _showChineseHoliday = showChineseHoliday;
        _showChineseCalendar = showChineseCalendar;
        _startDate = startDate;
    }
    
    return self;
}

- (NSArray *)getCalendarDataSourceWithLimitMonth:(NSInteger)limitMonth type:(SSCalendarViewControllerType)type{
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    
    NSDateComponents *components = [self dateToComponents:_todayDate];
    components.day = 1;
    if (type == SSCalendarViewControllerNextType)   //当前月之前的月份
    {
        components.month -= 1;
    }
    else if (type == SSCalendarViewControllerLastType)
    {
        components.month -= limitMonth;
    }
    else if (type == SSCalendarViewControllerMiddleType)
    {
        components.month -= (limitMonth + 1) / 2;
    }
    NSInteger i = 0;
    for (i = 0; i < limitMonth; i++)
    {
        components.month++;
        SSCalendarHeaderModel *headerItem = [[SSCalendarHeaderModel alloc]init];
        NSDate *date = [self componentsToDate:components];
        [_dateFormatter setDateFormat:@"yyyy年MM月"];
        NSString *dateString = [_dateFormatter stringFromDate:date];
        headerItem.headerText = dateString;
        headerItem.calendarItemArray = [self getCalendarItemArrayWithDate:date section:i];
        [resultArray addObject:headerItem];
    }
    
    return resultArray;
}

// 得到每一天的数据源
- (NSArray *)getCalendarItemArrayWithDate:(NSDate *)date section:(NSInteger)section{
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    NSInteger tatalDay = [self numberOfDaysInCurrentMonth:date];
    NSInteger firstDay = [self startDayOfWeek:date];
    
    NSDateComponents *components = [self dateToComponents:date];
    
    //判断日历有多少列
    NSInteger tempDay = tatalDay + (firstDay - 1);
    NSInteger column = 0;
    if (tempDay % 7 == 0) {
        column = tempDay / 7;
    }
    else
    {
        column = tempDay / 7 +1;
    }
    
    NSInteger i = 0;
    NSInteger j = 0;
    components.day = 0;
    for (i = 0; i < column; i++) {
        for (j = 0; j < 7; j++) {
            if (i == 0 && j < firstDay - 1) {
                SSCalendarModel *calendarItem = [[SSCalendarModel alloc] init];
                calendarItem.year = 0;
                calendarItem.month = 0;
                calendarItem.day = 0;
                calendarItem.chineseCalendar = @"";
                calendarItem.holiday = @"";
                calendarItem.week = -1;
                calendarItem.dateInterval = -1;
                [resultArray addObject:calendarItem];
                
                continue;
            }
            components.day += 1;
            if (components.day == tatalDay + 1) {
                i = column;     //结束外层循环
                break;
            }
            
            SSCalendarModel *calendarItem = [[SSCalendarModel alloc] init];
            calendarItem.year = components.year;
            calendarItem.month = components.month;
            calendarItem.day = components.day;
            calendarItem.week = j;
            NSDate *date = [self componentsToDate:components];
            //时间戳
            calendarItem.dateInterval = [self dateToInterval:date];
            if (_startDate == calendarItem.dateInterval) {
                _startIndexPath = [NSIndexPath indexPathForRow:0 inSection:section];
            }
            
            [self setChineseCalendarAndHolidayWithDate:components date:date calendarItem:calendarItem];
            
            [resultArray addObject:calendarItem];
        }
    }
    
    return nil;
}

// 一个月有多少天
- (NSUInteger)numberOfDaysInCurrentMonth:(NSDate *)date
{
    return [_greCalendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date].length;
}

// 确定这个月的第一天是星期几
- (NSUInteger)startDayOfWeek:(NSDate *)date{
    NSDate *startDate = nil;
    BOOL result = [_greCalendar rangeOfUnit:NSMonthCalendarUnit startDate:&startDate interval:NULL forDate:date];
    if (result) {
        return [_greCalendar ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:startDate];
    }
    return 0;
}

// 日期转时间戳
- (NSInteger)dateToInterval:(NSDate *)date
{
    return (long)[date timeIntervalSince1970];
}

#pragma mark 农历和节假日  待定
- (void)setChineseCalendarAndHolidayWithDate:(NSDateComponents *)components date:(NSDate *)date calendarItem:(SSCalendarModel *)calendarItem{
    
}

#pragma mark NSDate和NSCompontents转换
- (NSDateComponents *)dateToComponents:(NSDate *)date
{
    NSDateComponents *components = [_greCalendar components:(kCFCalendarUnitEra | kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay | kCFCalendarUnitHour | kCFCalendarUnitMinute | kCFCalendarUnitSecond) fromDate:date];
    return components;
}

- (NSDate *)componentsToDate:(NSDateComponents *)components
{
    // 不区分时分秒
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    NSDate *date = [_greCalendar dateFromComponents:components];
    return date;
}

@end
