//
//  ClubViewController.m
//  Open House
//
//  Created by Pan Ziyue on 19/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import "ClubViewController.h"
#import "CCADetailsViewController.h"
#import "CommonMethods.h"

static const float_t kAnimationTime = 0.35;

@interface ClubViewController ()
{
    NSUInteger identifier;
}

@end

@implementation ClubViewController

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
    
    // Start animation
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        for (UIButton *button in buttons) {
            button.alpha=0;
        }
        [self startFadeInAnimation];
    });
}

-(void)startFadeInAnimation
{
    [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:0] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL i){
        [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:1] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL i){
            [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:2] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL i){
                [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:3] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL i){
                    [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:4] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL i){
                        [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:5] delegate:self timeTaken:kAnimationTime completionBlock:^(BOOL i){
                            [CommonMethods viewAnimateEaseIn:[buttons objectAtIndex:6] delegate:self timeTaken:kAnimationTime completionBlock:nil];
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
        // Robotics
        [[segue destinationViewController] setTitle:@"Robotics"];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Robotics"]];
        [[segue destinationViewController] setTextViewText:@"Robotics @APEX (formerly known as Robotics Club) was set up in 2010 and is a niche in SST. In this CCA, members are given ample opportunities to unleash their potential by applying their skills and knowledge across a vast array of competitions. Through these competitions, the students are able to enhance their learning experiences in SST as they acquire various life skills and technological expertise along the way."];
    }
    else if (identifier==1) {
        // Media Club
        [[segue destinationViewController] setTitle:@"Media Club"];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Media Club"]];
        [[segue destinationViewController] setTextViewText:@"The SST Media Club was set up to equip students with the necessary disposition and skills that are essential in helping them communicate their ideas through different mediums. Students with a greater interest and talent would be able to further harness their skills in the media industry, while others would be equipped with skills that would be useful in their daily lives."];
    }
    else if (identifier==2) {
        // SYFC
        [[segue destinationViewController] setTitle:@"SYFC"];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"SYFC"]];
        [[segue destinationViewController] setTextViewText:@"The Singapore Youth Flying Club (SYFC) was set up at the start of 2011 and aims to promote interest in aviation so as to attract the best students to join the Republic of Singapore Air Force as a military pilot."];
    }
    else if (identifier==3) {
        // Astro club
        [[segue destinationViewController] setTitle:@"Astronomy"];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Astronomy"]];
        [[segue destinationViewController] setTextViewText:@"The SST Astronomy Club was set up at the start of 2013 and aims to promote Curiosity in Astronomical Science and Technology."];
    }
    else if (identifier==4) {
        // Drama Club
        [[segue destinationViewController] setTitle:@"Drama Club"];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Drama Club"]];
        [[segue destinationViewController] setTextViewText:@"In Drama Club, students get to explore and understand the roles of an actor or backstage crew by taking part in plays put up by the club. All students go through weekly training by full time instructors. They learn how to act and think in character, improvise on stage, study monologues, practice voice projection and use actions and facial expressions to their advantage. The CCA would also expose students to theatre arts and help students develop their linguistic skills"];
    }
    else if (identifier==5) {
        // Show choir
        [[segue destinationViewController] setTitle:@"Show Choir"];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Show Choir"]];
        [[segue destinationViewController] setTextViewText:@"SST Show Choir: where members are more than just a group of students interested in singing, dancing and performing. The demands of the training, the needed time management as well as the variety of experiences will transform the shy to be more daring; the interested to be more passionate; the less organized to be more disciplined; the distracted to be more focused, the doubters to believe in themselves, and that any failed attempts or problems will be seen as opportunities to become more tenacious and adaptable."];
    }
    else if (identifier==6) {
        // Show choir
        [[segue destinationViewController] setTitle:@"Guitar Ensemble"];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Guitar"]];
        [[segue destinationViewController] setTextViewText:@"The SST Guitar Ensemble was set up in March 2010 with the aim of introducing classical guitar music to the students. Since its inauguration, it has grown in numbers and there are currently 44 students in the ensemble."];
    }
}


- (IBAction)buttonTapped:(id)sender {
    identifier=[sender tag];
    [self performSegueWithIdentifier:@"gotoClubDetails" sender:self];
}
@end
