//
//  HPSCalendarView.h
//  HPSCalendar
//
//  Created by Quinto Technologies Pvt. Ltd. on 08/09/16.
//  Copyright © 2016 Quinto Technologies Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  This protocol HPSCalendarViewDelegate should be implemented to get the 
 selected date values from the calendar
 */
@protocol HPSCalendarViewDelegate <NSObject>

- (void) selectedDateDictionaryForCalendarView:(NSDictionary *)dateDic;

@end

@interface HPSCalendarView : UIView<UICollectionViewDelegate,
UICollectionViewDataSource>
@property (nonatomic, strong) id<HPSCalendarViewDelegate> delegate;
@end
