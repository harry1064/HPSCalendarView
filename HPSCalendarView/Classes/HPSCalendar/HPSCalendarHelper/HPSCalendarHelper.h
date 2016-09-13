//
//  HPSCalendarHelper.h
//  Calendar
//
//  Created by Quinto Technologies Pvt. Ltd. on 03/09/16.
//  Copyright © 2016 Quinto Technologies Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPSCalendarHelper : NSObject

/**
 *  This method return the total number of days in month of date.
 *
 *  @param date An instance of NSDate whose number of days in month to calculate.
 *
 *  @return An NSInteger repersent the total number of days in date passed as 
 *  paramter
 */
- (NSInteger) numberOfDaysInMonthForDate:(NSDate *)date;
/**
 *  This method return the array of weekdays for days in the month.
 *
 *  @param date An instance of NSDate whose weekdays for days need to calculate.
 *
 *  @return An instance of NSArray repersenting weekdays for particular day in the month of date
 */
- (NSArray *) weekdayNameForDaysInMonthForDate:(NSDate *)date;
/**
 *  This method return the name of the month of date instance.
 *
 *  @param date An instance of NSDate whose month name to calculate.
 *
 *  @return An instance of NSString repersents the name of month for the date.
 */
- (NSString *) monthNameForDate:(NSDate *)date;
/**
 *  This method returns the year of date instance.
 *
 *  @param date And instance of NSDate Whose year we need.
 *
 *  @return An NSInteger repersenting the year of date.
 */
- (NSInteger) yearForDate:(NSDate *)date;
/**
 *  This method returns the newly calculated date returned by adding value for particular NSCalendarUnit to the input date.
 *
 *  @param unit  An NSCalendarUnit whose value we want to add
 *  @param value An NSInteger value to be added for the NSCalendarUnit
 *  @param date  An instance of NSDate for calculating new date from it
 *
 *  @return An instance of NSDate calculated by this method
 */
- (NSDate *) dateByAddingUnit:(NSCalendarUnit)unit
                       value:(NSInteger)value
                      toDate:(NSDate *)date;
/**
 *  This method return array of dictionary containing two keys 'day' and 'isEnable'
    day repersents the day number and 'isEnable' repersents whether that day can be selected as this array can contains previous month days and next month days too.
 *
 *  @param date An instance of NSDate for which we need to calculate days to repersent on 
    calendar.
 *
 *  @return An instance of NSArray of dictionary object with two keys 'day' and 'isEnable'
 */
- (NSArray *) daysArrayForCalendarWithDate:(NSDate *)date;
/**
 *  This method returns the weekdaySymbols of current calendar.
 *
 *  @return An instance of NSArray of calendar symbols.
 */
- (NSArray *) weekDaySymbol;
@end
