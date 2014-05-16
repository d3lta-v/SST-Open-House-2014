//
//  ViewController.m
//  SST Open House 2014
//
//  Created by Pan Ziyue on 15/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController ()
{
    NSString *url;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Gesture to go to about screen
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(gotoAbout)];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:swipeUp];
}

-(void)gotoAbout
{
    [self performSegueWithIdentifier:@"gotoAbout" sender:self];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)launchFb:(id)sender {
    url = @"https://www.facebook.com/ssts.1technologydrive";
    [self performSegueWithIdentifier:@"gotoWeb" sender:self];
}

- (IBAction)launchTwitter:(id)sender {
    url = @"https://twitter.com/SSTSingapore";
    [self performSegueWithIdentifier:@"gotoWeb" sender:self];
}

- (IBAction)launchInfo:(id)sender {
    url = @"http://www.sst.edu.sg/contact-us/faqs/";
    [self performSegueWithIdentifier:@"gotoWeb" sender:self];
}

- (IBAction)launchExhibition:(id)sender {
    url = @"http://www.sst.edu.sg/exhibition";
    [self performSegueWithIdentifier:@"gotoWeb" sender:self];
}

- (IBAction)launchWebsite:(id)sender {
    url = @"http://www.sst.edu.sg";
    [self performSegueWithIdentifier:@"gotoWeb" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"gotoWeb"]) {
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        WebViewController *newVC = (WebViewController *)navController.topViewController;
        newVC.urlString = url;
    }
}

@end
