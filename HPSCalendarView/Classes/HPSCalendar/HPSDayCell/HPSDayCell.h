//
//  HPSDayCell.h
//  HPSCalendar
//
//  Created by Quinto Technologies Pvt. Ltd. on 06/09/16.
//  Copyright © 2016 Quinto Technologies Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPSDayCell : UICollectionViewCell
/**
 *  An instance of UILabel to repersents the value of day.
 */
@property (nonatomic, strong) UILabel *dayLabel;
/**
 *  Set the backgroundColor to the color.If color is nil, Default cell color is 
 *  applied.
 */
- (void) setCellColor:(UIColor *)color;
@end
