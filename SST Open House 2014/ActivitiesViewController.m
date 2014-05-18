//
//  ActivitiesViewController.m
//  Open House
//
//  Created by Pan Ziyue on 18/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import "ActivitiesViewController.h"
#import "ActivitiesDetailViewController.h"
#import "CommonMethods.h"

static const float_t kAnimationTime = 0.4;

@interface ActivitiesViewController ()
{
    NSUInteger identifier;
}

@end

@implementation ActivitiesViewController

@synthesize buttons;

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
    
    // Implement parallax
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[[CommonMethods getInterpolatingMotionEffect:@"center.x" minMaxValues:-10], [CommonMethods getInterpolatingMotionEffect:@"center.y" minMaxValues:-10]];
    for (UIButton *button in buttons) {
        [button addMotionEffect:group];
    }
    
    // Initiate animation
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // set all alpha to zero
        for (UIButton *button in buttons) {
            button.alpha=0;
        }
        [self startFadeInAnimation];
    });
}

-(void)startFadeInAnimation
{
    [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:0] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL finished){
        [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:1] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL finished){
            [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:2] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL finished){
                [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:3] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL finished){
                    [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:4] delegate:nil timeTaken:kAnimationTime completionBlock:nil];
                }];
            }];
        }];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"gotoActivitiesDetail"]) {
        [[segue destinationViewController] setIdentifier:identifier];
    }
}

- (IBAction)buttonTapped:(id)sender
{
    identifier=[sender tag];
    [self performSegueWithIdentifier:@"gotoActivitiesDetail" sender:self];
}

- (IBAction)goBack:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
