//
//  SSChineseCalendarManager.m
//  SSCalendarDemo
//
//  Created by LazyCat-Stone on 2016/11/14.
//  Copyright © 2016年 LazyCat. All rights reserved.
//

#import "SSChineseCalendarManager.h"

@interface SSChineseCalendarManager ()

@property (nonatomic, strong) NSCalendar *chineseCalendar;
@property (nonatomic, strong) NSArray *chineseYearArray;
@property (nonatomic, strong) NSArray *chineseMonthArray;
@property (nonatomic, strong) NSArray *chineseDayArray;

@end

@implementation SSChineseCalendarManager

- (instancetype)init{
    self = [super init];
    if (self) {
        _chineseCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
        
        _chineseMonthArray = [NSArray arrayWithObjects:@"正月",@"二月",@"三月",@"四月",@"五月",@"六月", @"七月",@"八月",
                              @"九月",@"十月",@"十一月",@"十二月",nil];
        _chineseDayArray = [NSArray arrayWithObjects:
                            @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                            @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                            @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    }
    return self;
}

- (void)getChineseCalendarWithDate:(NSDate *)date calendarItem:(SSCalendarModel *)calendarItem{
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents *localComp = [_chineseCalendar components:unitFlags fromDate:date];
    NSInteger tempDay = localComp.day;
    // 系统日历类在 2057-09-28计算有bug结果为0（应该为30）
    if (tempDay == 0) {
        tempDay = 30;
    }
    NSString *chineseMonth = [_chineseMonthArray objectAtIndex:localComp.month - 1];
    NSString *chineseDay = [_chineseDayArray objectAtIndex:tempDay - 1];
    calendarItem.chineseCalendar = chineseDay;
}

/*
 清明节日期的计算 [Y*D+C]-L
 公式解读：Y=年数后2位，D=0.2422，L=闰年数，21世纪C=4.81，20世纪=5.59。
 */
- (BOOL)isQingMingholidayWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    if(month == 4)
    {
        NSInteger pre = year / 100;
        float c = 4.81;
        if(pre == 19)
        {
            c = 5.59;
        }
        NSInteger y = year % 100;
        NSInteger qingMingDay = (y * 0.2422 + c) - y / 4;
        if(day == qingMingDay)
        {
            return YES;
        }
    }
    return NO;
}


@end
