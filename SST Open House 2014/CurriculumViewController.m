//
//  CurriculumViewController.m
//  Open House
//
//  Created by Pan Ziyue on 17/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import "CurriculumViewController.h"
#import "CommonMethods.h"

static const float_t kAnimationTime = 0.45;

@interface CurriculumViewController ()

@end

@implementation CurriculumViewController

@synthesize academic, applied, ccas;

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
    [academic addMotionEffect:group];
    [applied addMotionEffect:group];
    [ccas addMotionEffect:group];
    
    // Initiate fade in animation
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Set all alpha to zero
        academic.alpha=0;
        applied.alpha=0;
        ccas.alpha=0;
        
        [self startFadeInAnimation];
    });
}

-(void)startFadeInAnimation
{
    [CommonMethods viewAnimateEaseIn:academic delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL finished){
        [CommonMethods viewAnimateEaseIn:applied delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL finished){
            [CommonMethods viewAnimateEaseIn:ccas delegate:nil timeTaken:kAnimationTime completionBlock:nil];
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
}


- (IBAction)gotoAcademic:(id)sender {
    
}

- (IBAction)gotoApplied:(id)sender {
    
}
- (IBAction)gotoCCAs:(id)sender {
}

- (IBAction)goBack:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
