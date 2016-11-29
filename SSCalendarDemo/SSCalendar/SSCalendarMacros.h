//
//  SSCalendarMacros.h
//  SSCalendarDemo
//
//  Created by LazyCat-Stone on 2016/11/27.
//  Copyright © 2016年 LazyCat. All rights reserved.
//




#define SS_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SS_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SS_UTILS_COLORRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define SS_Iphone6Scale(x) ((x) * SS_SCREEN_WIDTH / 375.0f)
#define SS_ONE_PIXEL (1.0f / [[UIScreen mainScreen] scale])
#define SS_UIColorWithHEXandAlpha(hexValue,alphaValue) [UIColor colorWithRed:(((hexValue) & 0xFF0000) >> 16)/255.0 green:(((hexValue) & 0xFF00) >> 8)/255.0 blue:(((hexValue) & 0xFF))/255.0 alpha:(float)(alphaValue)]


/**
 定义属性
 */
//主题背景色
#define SS_MainBackgroundColor  SS_UTILS_COLORRGB(247,247,247)
// DateLabel默认文字颜色
#define SS_TextColor SS_UIColorWithHEXandAlpha(0x424242,1.0)
// DateLabel选中时的背景色
#define SS_SelectBackgroundColor SS_CalendarSelectedItemBackgroundColor
// DateLabel选中后文字颜色
#define SS_SelectTextColor [UIColor whiteColor]
// SubLabel文字颜色
#define SS_SubLabelTextColor  SS_UIColorWithHEXandAlpha(0xFC5D7B,1.0)
// SubLabel选中时文字颜色
#define SS_SelectSubLabelTextColor  [UIColor whiteColor]

// SubLabel选中开始文字
#define SS_SelectStateColor     [UIColor whiteColor]
// SubLabel选中开始文字
#define SS_SelectBeginText @"入住"
// SubLabel选中结束文字
#define SS_SelectEndText @"离店"
// 节日颜色
#define SS_HolidayTextColor SS_UIColorWithHEXandAlpha(0x424242,1.0)
// 周末颜色
#define SS_WeekEndTextColor SS_UIColorWithHEXandAlpha(0x424242,1.0)
// 不可点击文字颜色
#define SS_TouchUnableTextColor SS_UIColorWithHEXandAlpha(0x424242,1.0)
// 周视图高度
#define SS_WeekViewHeight 64
// headerView线颜色
#define SS_HeaderViewLineColor [UIColor lightGrayColor]
// headerView文字颜色
#define SS_HeaderViewTextColor SS_UTILS_COLORRGB(66, 66, 66)
// headerView高度
#define SS_HeaderViewHeight 50
// 弹出层文字颜色
#define SS_CalendarPopViewTextColor [UIColor whiteColor]
// 弹出层背景颜色
#define SS_CalendarPopViewBackgroundColor [UIColor blackColor]

// 分割线颜色
#define SS_CalendarSeparatorLineColor     SS_UTILS_COLORRGB(219,219,219)

#define LCColorMainContentColor     SS_UIColorWithHEXandAlpha(0x424242,1.0)    //主要内容(主标题、正文、内容描述)
//入住、离店日期选中背景色
#define SS_CalendarSelectedItemBackgroundColor      SS_UIColorWithHEXandAlpha(0xFC5D7B,1.0)
#define SS_CalendarBetweenSelectedItemBackgroundColor    SS_UIColorWithHEXandAlpha(0xFC5D7B,0.5)    //提示内容高亮状态(收藏、删除等警示性内容)
