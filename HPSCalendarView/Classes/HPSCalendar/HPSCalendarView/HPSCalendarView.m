//
//  HPSCalendarView.m
//  HPSCalendar
//
//  Created by Quinto Technologies Pvt. Ltd. on 08/09/16.
//  Copyright © 2016 Quinto Technologies Pvt. Ltd. All rights reserved.
//

#import "HPSCalendarView.h"
#import "HPSDayCell.h"
#import "HPSCalendarHelper.h"
#define DEFAULT_WIDTH 320.0
@implementation HPSCalendarView
{
    UICollectionView *collectionview;
    CGFloat widthOfCell;
    NSArray *daysArray;
    UILabel *monthLabel;
    HPSCalendarHelper *calendarHelper;
    NSDate *today;
}
- (id) init {
    widthOfCell = DEFAULT_WIDTH / 7.2;
    CGRect newFrame = CGRectMake(0, 0, DEFAULT_WIDTH, (5 * widthOfCell) + 60 );
    if ((self = [super init])) {
        [self setFrame:newFrame];
        [self setupCalendarView];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame {
    CGFloat width = frame.size.width < DEFAULT_WIDTH ? DEFAULT_WIDTH : frame.size.width;
    widthOfCell = width / 7.2;
    CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y, width, (5 * widthOfCell) + 60 );
    if ((self = [super initWithFrame:newFrame])) {
        [self setupCalendarView];
    }
    return self;
}

- (CGSize) intrinsicContentSize {
    return CGSizeMake(UIViewNoIntrinsicMetric, (5 * widthOfCell) + 60);
}

- (void) layoutSubviews {
    [super layoutSubviews];
    for (UIView *subview in [self subviews]) {
        [subview removeFromSuperview];
    }
    widthOfCell = self.frame.size.width / 7.2;
    [self setupCalendarView];
    [self invalidateIntrinsicContentSize];
}

#pragma mark Private methods

- (void) setupCalendarView {
    today = [NSDate date];
    calendarHelper = [[HPSCalendarHelper alloc] init];
    [monthLabel setText:[calendarHelper monthNameForDate:today]];
    daysArray = [calendarHelper daysArrayForCalendarWithDate:today];
    [self setBackgroundColor:[UIColor blackColor]];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setMinimumInteritemSpacing:0];
    [flowLayout setMinimumLineSpacing:0];
    collectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 60, self.frame.size.width, 5 * widthOfCell) collectionViewLayout:flowLayout];
    [collectionview setDelegate:self];
    [collectionview setDataSource:self];
    [collectionview registerClass:[HPSDayCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self addSubview:collectionview];
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:0.0];
    monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    [monthLabel setTextAlignment:NSTextAlignmentCenter];
    [monthLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:monthLabel];
    NSArray *weekDaySymbol = [calendarHelper weekDaySymbol];
    for (int i = 0; i < weekDaySymbol.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i * widthOfCell, 40, widthOfCell, 20)];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTextColor:[UIColor whiteColor]];
        [label setText:[weekDaySymbol[i] substringWithRange:NSMakeRange(0, 3)]];
        [self addSubview:label];
     }
    UIButton *previousMonthButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,40,40)];
    [previousMonthButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [previousMonthButton setTitle:@"<" forState:UIControlStateNormal];
    [previousMonthButton.titleLabel setTextAlignment:NSTextAlignmentLeft];
    [previousMonthButton addTarget:self action:@selector(previousMonthButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:previousMonthButton];
    
    UIButton *nextMonthButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 40, 0, 40, 40)];
    [nextMonthButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextMonthButton setTitle:@">" forState:UIControlStateNormal];
    [nextMonthButton.titleLabel setTextAlignment:NSTextAlignmentRight];
    [nextMonthButton addTarget:self action:@selector(nextMonthButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:nextMonthButton];
}

- (void) nextMonthButtonClicked:(UIButton *)sender {
    today = [calendarHelper dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:today];
    [self reloadData];
}

- (void) previousMonthButtonClicked:(UIButton *)sender {
    today = [calendarHelper dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:today];
    [self reloadData];
}

- (void) reloadData {
    [monthLabel setText:[NSString stringWithFormat:@"%@, %ld", [calendarHelper monthNameForDate:today], (long)[calendarHelper yearForDate:today]]];
    daysArray = [calendarHelper daysArrayForCalendarWithDate:today];
    [collectionview reloadData];
}

#pragma mark collection view delegate
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return daysArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HPSDayCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier"
                                                               forIndexPath:indexPath];
    NSDictionary *dic = [daysArray objectAtIndex:indexPath.row];
    [cell.dayLabel setText:[NSString stringWithFormat:@"%@", [dic valueForKey:@"day"]]];
    if ([[dic valueForKey:@"isEnable"] boolValue]) {
        [cell.dayLabel setTextColor:[UIColor whiteColor]];
        [cell setUserInteractionEnabled:YES];
    }else {
        [cell.dayLabel setTextColor:[UIColor lightGrayColor]];
        [cell setUserInteractionEnabled:NO];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(widthOfCell, widthOfCell);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0.0, 0.0, 0.0);
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [daysArray objectAtIndex:indexPath.row];
    NSString *day = [dic valueForKey:@"day"];
    NSString *month = [dic valueForKey:@"month"];
    NSString *year = [dic valueForKey:@"year"];
    [self.delegate selectedDateDictionaryForCalendarView:@{
                                                          @"day": day,
                                                          @"month": month,
                                                          @"year": year}];
}

@end
