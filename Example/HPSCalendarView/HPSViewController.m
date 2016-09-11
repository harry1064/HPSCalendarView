//
//  HPSViewController.m
//  HPSCalendarView
//
//  Created by Harpreet Singh on 09/11/2016.
//  Copyright (c) 2016 Harpreet Singh. All rights reserved.
//

#import "HPSViewController.h"
#import <HPSCalendarView/HPSCalendarView.h>
@interface HPSViewController ()

@end

@implementation HPSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    HPSCalendarView *calendar = [[HPSCalendarView alloc] init];
    calendar.translatesAutoresizingMaskIntoConstraints = FALSE;
    [self.view addSubview:calendar];
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:calendar
                                                                         attribute:NSLayoutAttributeLeading
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeLeading
                                                                        multiplier:1.0
                                                                          constant:10.0];
    NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:calendar
                                                                         attribute:NSLayoutAttributeTrailing
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeTrailing
                                                                        multiplier:1.0
                                                                          constant:-10.0];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:calendar
                                                                         attribute:NSLayoutAttributeTop
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeTop
                                                                        multiplier:1.0
                                                                          constant:40.0];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:calendar
                                                                         attribute:NSLayoutAttributeBottom
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeBottom
                                                                        multiplier:1.0
                                                                          constant:-40.0];
    bottomConstraint.priority = 250;
    [self.view addConstraints:@[leadingConstraint, trailingConstraint, topConstraint]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
