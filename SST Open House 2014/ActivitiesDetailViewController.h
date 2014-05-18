//
//  ActivitiesDetailViewController.h
//  Open House
//
//  Created by Pan Ziyue on 18/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivitiesDetailViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *locationLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *timingLabels;

@property (nonatomic) NSUInteger identifier;

@end
