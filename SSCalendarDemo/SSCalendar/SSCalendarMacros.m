//
//  SSCalendarMacros.m
//  SSCalendarDemo
//
//  Created by LazyCat-Stone on 2016/11/14.
//  Copyright © 2016年 LazyCat. All rights reserved.
//

#define SS_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SS_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SS_UTILS_COLORRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define SS_Iphone6Scale(x) ((x) * SS_SCREEN_WIDTH / 375.0f)
#define SS_ONE_PIXEL (1.0f / [[UIScreen mainScreen] scale])


/**
    定义属性
 */
// DateLabel默认文字颜色
#define SS_TextColor [UIColor blackColor]
// DateLabel选中时的背景色
#define SS_SelectBackgroundColor MSS_UTILS_COLORRGB(29, 154, 72)
// DateLabel选中后文字颜色
#define SS_SelectTextColor [UIColor whiteColor]
// SubLabel文字颜色
#define SS_SelectSubLabelTextColor MSS_UTILS_COLORRGB(29, 154, 180);
// SubLabel选中开始文字
#define SS_SelectBeginText @"开始"
// SubLabel选中结束文字
#define SS_SelectEndText @"结束"
// 节日颜色
#define SS_HolidayTextColor [UIColor purpleColor]
// 周末颜色
#define SS_WeekEndTextColor [UIColor redColor]
// 不可点击文字颜色
#define SS_TouchUnableTextColor MSS_UTILS_COLORRGB(150, 150, 150)
// 周视图高度
#define SS_WeekViewHeight 40
// headerView线颜色
#define SS_HeaderViewLineColor [UIColor lightGrayColor]
// headerView文字颜色
#define SS_HeaderViewTextColor [UIColor blackColor]
// headerView高度
#define SS_HeaderViewHeight 50
// 弹出层文字颜色
#define SS_CalendarPopViewTextColor [UIColor whiteColor]
// 弹出层背景颜色
#define SS_CalendarPopViewBackgroundColor [UIColor blackColor]
