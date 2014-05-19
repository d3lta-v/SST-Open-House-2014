//
//  SportsDetailsViewController.m
//  Open House
//
//  Created by Pan Ziyue on 19/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import "CCADetailsViewController.h"
#import "CRMotionView.h"

#ifdef __APPLE__
#include "TargetConditionals.h"
#endif

@interface CCADetailsViewController ()

@end

@implementation CCADetailsViewController

@synthesize textViewText, imageToUse, headerTitle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CRMotionView *motionView = [[CRMotionView alloc] initWithFrame:self.view.bounds];
    [motionView setImage:imageToUse];
#if (TARGET_IPHONE_SIMULATOR)
    [motionView setMotionEnabled:YES];
#endif
    [self.view addSubview:motionView];
    [_textView setText:textViewText];
    [_textView setTextColor:[UIColor whiteColor]];
    [_textView setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.1]];
    [_textView setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
    [self.view bringSubviewToFront:_textView];
    self.title = headerTitle;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
