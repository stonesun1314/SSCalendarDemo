//
//  SSCalendarViewController.m
//  SSCalendarDemo
//
//  Created by LazyCat-Stone on 2016/11/14.
//  Copyright © 2016年 LazyCat. All rights reserved.
//

#import "SSCalendarViewController.h"
#import "SSCalendarPopView.h"
#import "SSCalendarMacros.m"
#import "SSCalendarCollectionViewCell.h"
#import "SSCalendarCollectionReusableView.h"
#import "SSChineseCalendarManager.h"
#import "SSCalendarManager.h"


@interface SSCalendarViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

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
        _dataArray = [[NSMutableArray alloc]init];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)initDataSource
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        /*
        SSCalendarManager *manager = [[SSCalendarManager alloc]initWithShowChineseHoliday:_showChineseHoliday showChineseCalendar:_showChineseCalendar startDate:_startDate];
        NSArray *tempDataArray = [manager getCalendarDataSoruceWithLimitMonth:_limitMonth type:_type];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_dataArray addObjectsFromArray:tempDataArray];
            [self showCollectionViewWithStartIndexPath:manager.startIndexPath];
        });
         */
    });
}

- (void)createUI{
    NSInteger width = SS_Iphone6Scale(50);
    NSInteger height = SS_Iphone6Scale(50);
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(width, height);
    flowLayout.headerReferenceSize = CGSizeMake(SS_SCREEN_WIDTH, SS_HeaderViewHeight);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64 + SS_WeekViewHeight, width * 7, SS_SCREEN_HEIGHT - 64 - SS_WeekViewHeight) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[SSCalendarCollectionViewCell class] forCellWithReuseIdentifier:@"SSCalendarCollectionViewCell"];
    [_collectionView registerClass:[SSCalendarCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SSCalendarCollectionReusableView"];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SSCalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSCalendarCollectionViewCell" forIndexPath:indexPath];
    if (cell) {
        
        cell.dateLabel.text = [NSString stringWithFormat:@"%ld",indexPath.item];
    }
    return cell;
    
}


@end
