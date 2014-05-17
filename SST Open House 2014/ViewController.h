//
//  ViewController.h
//  SST Open House 2014
//
//  Created by Pan Ziyue on 15/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *SSTLogo;
@property (weak, nonatomic) IBOutlet UIButton *gettingStarted;
@property (weak, nonatomic) IBOutlet UIButton *curriculum;
@property (weak, nonatomic) IBOutlet UIButton *activities;
@property (weak, nonatomic) IBOutlet UIButton *maps;
@property (weak, nonatomic) IBOutlet UIButton *facebook;
@property (weak, nonatomic) IBOutlet UIButton *twitter;
@property (weak, nonatomic) IBOutlet UIButton *info;
@property (weak, nonatomic) IBOutlet UIButton *exhibition;
@property (weak, nonatomic) IBOutlet UIButton *website;
@property (weak, nonatomic) IBOutlet UIImageView *arrow1;
@property (weak, nonatomic) IBOutlet UIImageView *arrow2;
@property (weak, nonatomic) IBOutlet UILabel *swipeUp;

- (IBAction)launchFb:(id)sender;
- (IBAction)launchTwitter:(id)sender;
- (IBAction)launchInfo:(id)sender;
- (IBAction)launchExhibition:(id)sender;
- (IBAction)launchWebsite:(id)sender;

@end
