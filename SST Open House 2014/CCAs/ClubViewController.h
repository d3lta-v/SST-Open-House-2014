//
//  ClubViewController.h
//  Open House
//
//  Created by Pan Ziyue on 19/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClubViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

- (IBAction)buttonTapped:(id)sender;

@end
