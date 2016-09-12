//
//  HPSCalendarHelper.m
//  Calendar
//
//  Created by Quinto Technologies Pvt. Ltd. on 03/09/16.
//  Copyright © 2016 Quinto Technologies Pvt. Ltd. All rights reserved.
//

#import "HPSCalendarHelper.h"

@interface HPSCalendarHelper ()
@property (nonatomic, strong) NSCalendar *calendar;
@end
@implementation HPSCalendarHelper

- (id) init {
    if ((self = [super init])) {
        self.calendar = [NSCalendar currentCalendar];
    }
    return self;
}
- (NSInteger) numberOfDaysInMonthForDate:(NSDate *)date {
    
    NSRange days = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return days.length;
}

- (NSArray *) weekdayNameForDaysInMonthForDate:(NSDate *)date {
    NSMutableArray *weekDaysArray = [NSMutableArray array];
    NSArray *weekdaysSymbol = [self.calendar weekdaySymbols];
    NSInteger daysInMonth = [self numberOfDaysInMonthForDate:date];
    NSDateComponents *componentsOfDate = [self.calendar components:(NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:date];
    NSInteger monthOfDate = componentsOfDate.month;
    NSInteger yearOfDate = componentsOfDate.year;
    for (int i = 1; i <= daysInMonth; i++) {
        NSDateComponents *newDateComponents = [[NSDateComponents alloc] init];
        [newDateComponents setMonth:monthOfDate];
        [newDateComponents setYear:yearOfDate];
        [newDateComponents setDay:i];
        NSDate *newDate = [self.calendar dateFromComponents:newDateComponents];
        NSDateComponents *derivedComponents = [self.calendar components:NSCalendarUnitWeekday fromDate:newDate];
        NSInteger weekDay = derivedComponents.weekday;
        [weekDaysArray addObject:[weekdaysSymbol objectAtIndex:weekDay-1]];
    }
    return weekDaysArray;
}

-(NSArray *) daysArrayForCalendarWithDate:(NSDate *)date {
    NSInteger totalItemsInArray = 35;
    NSMutableArray *daysArray = [[NSMutableArray alloc] init];
    NSArray *weekDaysArray = [self weekdayNameForDaysInMonthForDate:date];
    NSDate *previousDate = [self dateByAddingUnit:NSCalendarUnitMonth
                                            value:-1
                                           toDate:date];
    NSDate *nextDate = [self dateByAddingUnit:NSCalendarUnitMonth
                                        value:1
                                       toDate:date];
    NSInteger daysInCurrentDate = [self numberOfDaysInMonthForDate:date];
    NSInteger daysInPreviousDate = [self numberOfDaysInMonthForDate:previousDate];
    NSInteger daysInNextDate = [self numberOfDaysInMonthForDate:nextDate];
    NSInteger firstWeekDayIndex = [self weekdayIndexForWeekDayName:[weekDaysArray firstObject]];
    NSString *monthName = [self monthNameForDate:date];
    NSString *year = [NSString stringWithFormat:@"%ld", (long)[self yearForDate:date]];
    NSInteger count = 0;
    for (NSInteger i = daysInPreviousDate - firstWeekDayIndex; i <= daysInPreviousDate; i++) {
        NSString *day = [NSString stringWithFormat:@"%ld", (long)i];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:day, @"day", @"isEnable", @(NO), nil];
        [daysArray addObject:dic];
        count = count + 1;
    }
    for (int i = 0; i < daysInCurrentDate; i++) {
        NSString *day = [NSString stringWithFormat:@"%ld", (long)i+1];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:day, @"day", @(YES), @"isEnable", monthName, @"month", year, @"year", nil];
        [daysArray addObject:dic];
        count = count + 1;
    }
    for (int i = 0; i < daysInNextDate; i++) {
        if (count < totalItemsInArray) {
            NSString *day = [NSString stringWithFormat:@"%ld", (long)i+1];
            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:day, @"day", @"isEnable", @(NO), nil];
            [daysArray addObject:dic];
            count = count + 1;
        }else{
            break;
        }
    }
    return daysArray;
}

- (NSInteger) weekdayIndexForWeekDayName:(NSString *)weekDayName {
    NSInteger weekDayIndex = -1;
    NSArray *weekDaysSymbol = [self.calendar weekdaySymbols];
    for (int i = 0; i < weekDaysSymbol.count; i++) {
        if ([weekDaysSymbol[i] isEqualToString:weekDayName]) {
            weekDayIndex = i;
            break;
        }
    }
    return weekDayIndex -1;
}

- (NSString *) monthNameForDate:(NSDate *)date {
    NSDateComponents *dateComponents = [self.calendar components:NSCalendarUnitMonth fromDate:date];
    NSString *monthName = [[self.calendar monthSymbols] objectAtIndex:dateComponents.month-1];
    return monthName;
}

- (NSInteger) yearForDate:(NSDate *)date {
     NSDateComponents *dateComponents = [self.calendar components:NSCalendarUnitYear fromDate:date];
    return dateComponents.year;
}

- (NSDate *)dateByAddingUnit:(NSCalendarUnit)unit
                       value:(NSInteger)value
                      toDate:(NSDate *)date;
 {
    return [self.calendar dateByAddingUnit:NSCalendarUnitMonth value:value toDate:date options:0];
}

- (NSArray *) weekDaySymbol {
    return [self.calendar weekdaySymbols];
}
@end
