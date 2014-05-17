//
//  CurriculumViewController.h
//  Open House
//
//  Created by Pan Ziyue on 17/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurriculumViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *academic;
@property (weak, nonatomic) IBOutlet UIButton *applied;
@property (weak, nonatomic) IBOutlet UIButton *ccas;

- (IBAction)gotoAcademic:(id)sender;
- (IBAction)gotoApplied:(id)sender;
- (IBAction)gotoCCAs:(id)sender;
- (IBAction)goBack:(id)sender;


@end
