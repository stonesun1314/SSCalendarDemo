//
//  SSCalendarViewController.h
//  SSCalendarDemo
//
//  Created by LazyCat-Stone on 2016/11/14.
//  Copyright © 2016年 LazyCat. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MSSCalendarViewControllerType)
{
    SSCalendarViewControllerLastType = 0,   // 只显示当前月之前
    SSCalendarViewControllerMiddleType,     // 前后各显示一半
    SSCalendarViewControllerNextType        // 只显示当前月之后
};

@interface SSCalendarViewController : UIViewController

@end
