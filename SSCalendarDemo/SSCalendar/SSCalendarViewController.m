//
//  SSCalendarViewController.m
//  SSCalendarDemo
//
//  Created by LazyCat-Stone on 2016/11/14.
//  Copyright © 2016年 LazyCat. All rights reserved.
//

#import "SSCalendarViewController.h"
#import "SSCalendarPopView.h"
#import "SSCalendarMacros.h"
#import "SSCalendarCollectionViewCell.h"
#import "SSCalendarCollectionReusableView.h"
#import "SSChineseCalendarManager.h"
#import "SSCalendarManager.h"


@interface SSCalendarViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    CGFloat itemWidth;
    CGFloat itemHeight;
    CGFloat offsetX;
}

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) SSCalendarPopView *popView;

@end

@implementation SSCalendarViewController


-(instancetype)init
{
    self = [super init];
    if(self)
    {
        _afterTodayCanTouch = YES;
        _beforeTodayCanTouch = YES;
        _dataArray = [[NSMutableArray alloc]init];
        _showChineseCalendar = YES;
        _showChineseHoliday = NO;
        _showHolidayDifferentColor = NO;
        _showAlertView = NO;
        _startDate = 0;
        
        itemWidth = (SS_SCREEN_WIDTH - 20)/7;
        itemHeight = itemWidth;
        offsetX = 12.f;

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initDataSource];
    
    [self createUI];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)initDataSource
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        SSCalendarManager *manager = [[SSCalendarManager alloc]initWithShowChineseHoliday:_showChineseHoliday showChineseCalendar:_showChineseCalendar startDate:_startDate];//getCalendarDataSourceWithLimitMonth
        NSArray *tempDataArray = [manager getCalendarDataSourceWithLimitMonth:_limitMonth type:_type];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_dataArray addObjectsFromArray:tempDataArray];
            [self showCollectionViewWithStartIndexPath:manager.startIndexPath];
        });
         
    });
}

- (void)addWeekView{
    
    UIView *weekView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SS_SCREEN_WIDTH, SS_WeekViewHeight)];
    weekView.backgroundColor = SS_SelectBackgroundColor;
    [self.view addSubview:weekView];
    
    NSArray *weekArray = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    int i = 0;
    NSInteger width = itemWidth;
    for(i = 0; i < 7;i++)
    {
        UILabel *weekLabel = [[UILabel alloc]initWithFrame:CGRectMake(i * width, 0, width, SS_WeekViewHeight)];
        weekLabel.backgroundColor = [UIColor clearColor];
        weekLabel.text = weekArray[i];
        weekLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        weekLabel.textAlignment = NSTextAlignmentCenter;
        if(i == 0 || i == 6)
        {
            weekLabel.textColor = SS_WeekEndTextColor;
        }
        else
        {
            weekLabel.textColor = SS_SelectTextColor;
        }
        [weekView addSubview:weekLabel];
    }
    
}

- (void)showCollectionViewWithStartIndexPath:(NSIndexPath *)startIndexPath{
    [self addWeekView];
    [_collectionView reloadData];
    
    //滚动到上次选中的位置
}

- (void)createUI{
    NSInteger width = itemWidth;
    NSInteger height = itemHeight;
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(width, height);
    flowLayout.headerReferenceSize = CGSizeMake(SS_SCREEN_WIDTH, SS_HeaderViewHeight);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64 + SS_WeekViewHeight, self.view.bounds.size.width, SS_SCREEN_HEIGHT - 64 - SS_WeekViewHeight) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = SS_MainBackgroundColor;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[SSCalendarCollectionViewCell class] forCellWithReuseIdentifier:@"SSCalendarCollectionViewCell"];
    [_collectionView registerClass:[SSCalendarCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SSCalendarCollectionReusableView"];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [_dataArray count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    SSCalendarHeaderModel *headerItem = _dataArray[section];
    
    return headerItem.calendarItemArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SSCalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSCalendarCollectionViewCell" forIndexPath:indexPath];
    if (cell) {
        SSCalendarHeaderModel *headerItem = _dataArray[indexPath.section];
        SSCalendarModel *calendarItem = headerItem.calendarItemArray[indexPath.row];
        cell.dateLabel.text = @"";
        cell.subLabel.text = @"";
        if(calendarItem.day > 0)
        {
            cell.dateLabel.text = [NSString stringWithFormat:@"%ld",(long)calendarItem.day];
            cell.userInteractionEnabled = YES;
            cell.hiddenSeparatorLine = NO;
            cell.backgroundColor = [UIColor whiteColor];
            
        }else{
            
            cell.backgroundColor = SS_MainBackgroundColor;
            cell.hiddenSeparatorLine = YES;
        }
        
        if(_showChineseCalendar)
        {
            cell.subLabel.text = calendarItem.chineseCalendar;
        }
    }
    return cell;
    
}


// 添加header
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        SSCalendarCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SSCalendarCollectionReusableView" forIndexPath:indexPath];
        SSCalendarHeaderModel *headerItem = _dataArray[indexPath.section];
        headerView.headerLabel.text = headerItem.headerText;
        return headerView;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //SSCalendarHeaderModel *headerItem =
}


@end
