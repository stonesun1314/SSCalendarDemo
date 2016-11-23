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
#define MSS_TextColor       [UIColor blackColor]
