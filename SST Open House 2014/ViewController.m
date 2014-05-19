//
//  ViewController.m
//  SST Open House 2014
//
//  Created by Pan Ziyue on 15/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"
#import "CommonMethods.h"

static const float_t kAnimationTime = 0.7;
static const float_t kShortAnimationTime = 0.5;

@interface ViewController ()
{
    NSString *url;
}

@end

@implementation ViewController

@synthesize SSTLogo, gettingStarted, curriculum, activities, maps, facebook, twitter, info, exhibition, website, arrow1, arrow2, swipeUp;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    // Add parallax effect to all elements
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[[CommonMethods getInterpolatingMotionEffect:@"center.x" minMaxValues:-10], [CommonMethods getInterpolatingMotionEffect:@"center.y" minMaxValues:-10]];
    [SSTLogo addMotionEffect:group];
    [gettingStarted addMotionEffect:group];
    [curriculum addMotionEffect:group];
    [activities addMotionEffect:group];
    [maps addMotionEffect:group];
    [facebook addMotionEffect:group];
    [twitter addMotionEffect:group];
    [info addMotionEffect:group];
    [exhibition addMotionEffect:group];
    [website addMotionEffect:group];
    [arrow1 addMotionEffect:group];
    [arrow2 addMotionEffect:group];
    [swipeUp addMotionEffect:group];
    
    // Gesture to go to about screen
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(gotoAbout)];
    [swipe setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:swipe];
    
    // Set all of the elements to alpha=0 to prep for fade in and fade in
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SSTLogo.alpha=0;
        gettingStarted.alpha=0;
        curriculum.alpha=0;
        activities.alpha=0;
        maps.alpha=0;
        facebook.alpha=0;
        twitter.alpha=0;
        info.alpha=0;
        exhibition.alpha=0;
        website.alpha=0;
        arrow1.alpha=0;
        arrow2.alpha=0;
        swipeUp.alpha=0;
        
        [self startFadeIn];
    });
}

-(void)gotoAbout
{
    [self performSegueWithIdentifier:@"gotoAbout" sender:self];
}

-(void)startFadeIn
{
    [CommonMethods viewAnimateEaseIn:SSTLogo delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL finished){
        [CommonMethods viewAnimateEaseIn:gettingStarted delegate:self timeTaken:kShortAnimationTime completionBlock:^(BOOL finished){
            [CommonMethods viewAnimateEaseIn:curriculum delegate:self timeTaken:kShortAnimationTime completionBlock:^(BOOL finished){
                [CommonMethods viewAnimateEaseIn:activities delegate:self timeTaken:kShortAnimationTime completionBlock:^(BOOL finished){
                    [CommonMethods viewAnimateEaseIn:maps delegate:self timeTaken:kShortAnimationTime completionBlock:^(BOOL finished){
                        // start animating the series of buttons
                        [CommonMethods viewAnimateEaseIn:facebook delegate:nil timeTaken:kShortAnimationTime completionBlock:nil];
                        [CommonMethods viewAnimateEaseIn:twitter delegate:nil timeTaken:kShortAnimationTime completionBlock:nil];
                        [CommonMethods viewAnimateEaseIn:info delegate:nil timeTaken:kShortAnimationTime completionBlock:nil];
                        [CommonMethods viewAnimateEaseIn:exhibition delegate:nil timeTaken:kShortAnimationTime completionBlock:nil];
                        [CommonMethods viewAnimateEaseIn:website delegate:self timeTaken:kShortAnimationTime completionBlock:^(BOOL finished){
                            // start animating the swipe up for more info portion
                            [CommonMethods viewAnimateEaseIn:swipeUp delegate:nil timeTaken:kShortAnimationTime completionBlock:nil];
                            [CommonMethods viewAnimateEaseIn:arrow1 delegate:nil timeTaken:kShortAnimationTime completionBlock:nil];
                            [CommonMethods viewAnimateEaseIn:arrow2 delegate:nil timeTaken:kShortAnimationTime completionBlock:nil];
                        }];
                    }];
                }];
            }];
        }];
    }];
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

#pragma mark - IBActions

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

#pragma mark - Prepare for Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"gotoWeb"]) {
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        WebViewController *newVC = (WebViewController *)navController.topViewController;
        newVC.urlString = url;
    }
}

@end
