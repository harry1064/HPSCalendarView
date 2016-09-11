//
//  HPSCalendarHelper.h
//  Calendar
//
//  Created by Quinto Technologies Pvt. Ltd. on 03/09/16.
//  Copyright © 2016 Quinto Technologies Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPSCalendarHelper : NSObject

// this method return the toatal number of days in months of date instance
- (NSInteger) numberOfDaysInMonthForDate:(NSDate *)date;

- (NSArray *) weekdayNameForDaysInMonthForDate:(NSDate *)date;

- (NSString *) monthNameForDate:(NSDate *)date;

- (NSInteger) yearForDate:(NSDate *)date;

- (NSDate *) dateByAddingUnit:(NSCalendarUnit)unit
                       value:(NSInteger)value
                      toDate:(NSDate *)date;

- (NSArray *) daysArrayForCalendarWithDate:(NSDate *)date;

- (NSArray *) weekDaySymbol;
@end
