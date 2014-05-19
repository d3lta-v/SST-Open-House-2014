//
//  SportsDetailsViewController.h
//  Open House
//
//  Created by Pan Ziyue on 19/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCADetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (copy, nonatomic) NSString *textViewText;
@property (copy, nonatomic) NSString *headerTitle;
@property (copy, nonatomic) UIImage *imageToUse;

@end
