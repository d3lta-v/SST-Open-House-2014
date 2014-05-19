//
//  SportsViewController.m
//  Open House
//
//  Created by Pan Ziyue on 18/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import "SportsViewController.h"
#import "CommonMethods.h"
#import "CCADetailsViewController.h"

static const float_t kAnimationTime = 0.35;

@interface SportsViewController ()
{
    NSUInteger identifier;
}

@end

@implementation SportsViewController

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
    
    // Implement fade in
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Set all alpha to zero
        for (UIButton *button in buttons) {
            button.alpha=0;
        }
        
        // Begin animations
        [self startFadeInAnimation];
    });
}

-(void)startFadeInAnimation
{
    // Do it until object 7
    [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:0] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL i){
        [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:1] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL i){
            [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:2] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL i){
                [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:3] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL i){
                    [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:4] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL i){
                        [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:5] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL i){
                            [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:6] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL i){
                                [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:7] delegate:nil timeTaken:kAnimationTime completionBlock:nil];
                            }];
                        }];
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
    
    if (identifier==0) {
        [[segue destinationViewController] setTextViewText:@"The Football Team was formed in January 2010 with the objective of injecting fun, exposure and awareness of the sport to our students. A group of about 20 enthusiasts signed up for the sport and this soon grew to 30 with the addition of the new members in 2011."];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Soccer"]];
        [[segue destinationViewController] setHeaderTitle:@"Soccer"];
    }
    else if (identifier==1) {
        [[segue destinationViewController] setTextViewText:@"The SST Wushu Team was set up in 2010 and every new member undergoes basic training before being taught to perform international competition routines such as Chang Quan, Dao, Jian and Gun."];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Wushu"]];
        [[segue destinationViewController] setHeaderTitle:@"Wushu"];
    }
    else if (identifier==2) {
        [[segue destinationViewController] setTextViewText:@"In early 2011, the SST Taekwondo (TKD) Club was formed to provide more opportunities for students to pick up useful skills. Being a popular sport, many students have joined this CCA and the number of members has since been increasing from year to year. The team has undergone numerous gradings, and several students have progressed from colour belts to black belts."];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Taekwondo"]];
        [[segue destinationViewController] setHeaderTitle:@"Taekwondo"];
    }
    else if (identifier==3) {
        [[segue destinationViewController] setTextViewText:@"The SST Badminton Team was set up in 2010 and over the past two years, the students have participated in numerous competitions, through which they have been able to hone their skills and learn the importance of teamwork and cooperation."];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Badminton"]];
        [[segue destinationViewController] setHeaderTitle:@"Badminton"];
    }
    else if (identifier==4) {
        [[segue destinationViewController] setTextViewText:@"The SST Fencing Team was set up in February 2011, with the pioneer batch comprising of 26 energetic and committed Secondary 1 and 2 students. To date, the club has 60 students from across Secondary 1 to 4 levels. The art of fencing is a common interest amongst the fencers and is one of the main reasons why they have selected this fast-paced and heart-throbbing sport as their choice CCA."];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Fencing"]];
        [[segue destinationViewController] setHeaderTitle:@"Fencing"];
    }
    else if (identifier==5) {
        [[segue destinationViewController] setTextViewText:@"The SST Cross-Country Team was set up in 2010 and is made up of 25 running enthusiasts. The team is truly committed to the art of running and often encourages and supports each other in the process of working towards their goals and aspirations."];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Cross Country"]];
        [[segue destinationViewController] setHeaderTitle:@"Cross Country"];
    }
    else if (identifier==6) {
        [[segue destinationViewController] setTextViewText:@"In 2010, the Co-Curricular Activities Branch (CCAB) of the Ministry of Education (MOE), Singapore officially recognized Floorball as a regular CCA. With this announcement, SST decided to offer this exciting and vigorous game to our pioneer batch of students. Since its inauguration, it has grown in numbers and there are more than 36 members in the team."];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Floorball"]];
        [[segue destinationViewController] setHeaderTitle:@"Floorball"];
    }
    else if (identifier==7) {
        [[segue destinationViewController] setTextViewText:@"The SST basketball team was set up to bring together a group of basketball enthusiasts with the aim of teaching them the techniques of playing and importance of teamwork."];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Basketball"]];
        [[segue destinationViewController] setHeaderTitle:@"Basketball"];
    }
}


- (IBAction)buttonTapped:(id)sender {
    identifier = [sender tag];
    [self performSegueWithIdentifier:@"gotoSportsDetails" sender:self];
}

@end
