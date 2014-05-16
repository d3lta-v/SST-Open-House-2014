//
//  AboutViewController.h
//  Open House
//
//  Created by Pan Ziyue on 15/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *arrow1;

@property (weak, nonatomic) IBOutlet UIImageView *arrow2;

@property (weak, nonatomic) IBOutlet UIImageView *statix;
@property (weak, nonatomic) IBOutlet UIImageView *inc;
@property (weak, nonatomic) IBOutlet UIImageView *cyber;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *words;

@end
