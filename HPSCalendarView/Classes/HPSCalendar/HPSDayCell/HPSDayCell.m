//
//  HPSDayCell.m
//  HPSCalendar
//
//  Created by Quinto Technologies Pvt. Ltd. on 06/09/16.
//  Copyright © 2016 Quinto Technologies Pvt. Ltd. All rights reserved.
//

#import "HPSDayCell.h"
#define DEFAULT_CELL_COLOR [UIColor colorWithRed:25.0/255.0 green:50.0/255.0 blue:60.0/255.0 alpha:1.0]
@implementation HPSDayCell

- (id) init {
    if ((self = [super init])) {
        
        [self setupCell];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self setupCell];
    }
    return self;
}

- (void) setupCell {
    [self setCellColor:DEFAULT_CELL_COLOR];
    self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.contentView.layer.borderWidth = 1;
    [self setupViewHierarchy];
    [self setupConstraints];
}

- (void) setupViewHierarchy {
    self.dayLabel = [[UILabel alloc] init];
    [self.dayLabel setTextColor:[UIColor whiteColor]];
    [self.dayLabel setTextAlignment:NSTextAlignmentCenter];
    self.dayLabel.translatesAutoresizingMaskIntoConstraints = FALSE;
    [self.contentView addSubview:self.dayLabel];
}

- (void) setupConstraints {
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:self.dayLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    [self.contentView addConstraint:leadingConstraint];
    
    NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:self.dayLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    [self.contentView addConstraint:trailingConstraint];
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.dayLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    [self.contentView addConstraint:topConstraint];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.dayLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self.contentView addConstraint:bottomConstraint];
}

- (void) setCellColor:(UIColor *)color {
    self.contentView.backgroundColor= color ? color : DEFAULT_CELL_COLOR;
}
@end
