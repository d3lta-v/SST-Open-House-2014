//
//  AcademicViewController.m
//  Open House
//
//  Created by Pan Ziyue on 17/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import "AcademicViewController.h"
#import "DetailViewController.h"
#import "CommonMethods.h"

static const float_t kAnimationTime = 0.35;

@interface AcademicViewController ()
{
    NSUInteger identifier;
}

@end

@implementation AcademicViewController

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
    [CommonMethods viewAnimateEaseIn:(UIView *)[buttons objectAtIndex:0] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL finished){
        [CommonMethods viewAnimateEaseIn:(UIView *)[buttons objectAtIndex:1] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL finished){
            [CommonMethods viewAnimateEaseIn:(UIView *)[buttons objectAtIndex:2] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL finished){
                [CommonMethods viewAnimateEaseIn:(UIView *)[buttons objectAtIndex:3] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL finished){
                    [CommonMethods viewAnimateEaseIn:(UIView *)[buttons objectAtIndex:4] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL finished){
                        [CommonMethods viewAnimateEaseIn:(UIView *)[buttons objectAtIndex:5] delegate:nil timeTaken:kAnimationTime completionBlock:nil];
                    }];
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
    if ([[segue identifier] isEqualToString:@"gotoDetail"]) {
        [[segue destinationViewController] setIdentifier:identifier];
    }
}


- (IBAction)buttonPressed:(id)sender
{
    identifier = [sender tag];
    [self performSegueWithIdentifier:@"gotoDetail" sender:self];
}

@end
