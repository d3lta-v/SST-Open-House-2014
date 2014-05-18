//
//  ActivitiesDetailViewController.m
//  Open House
//
//  Created by Pan Ziyue on 18/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import "ActivitiesDetailViewController.h"

@interface ActivitiesDetailViewController ()

@end

@implementation ActivitiesDetailViewController

@synthesize identifier, locationLabels, timingLabels;

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
    
    [self setLabelToIdentifier];
    
    // Add parallax
}

-(void)setLabelToIdentifier
{
    if (identifier==0) {
        ((UILabel *)[locationLabels objectAtIndex:0]).text=@"Science Block";
        ((UILabel *)[locationLabels objectAtIndex:1]).text=@"Level 1 & 2";
        ((UILabel *)[timingLabels objectAtIndex:0]).text=@"11:00 to 11:45 a.m.";
        ((UILabel *)[timingLabels objectAtIndex:1]).text=@"12:00 to 12:45 p.m.";
        ((UILabel *)[timingLabels objectAtIndex:2]).text=@"1:00 to 1:45 p.m.";
        ((UILabel *)[timingLabels objectAtIndex:3]).text=@"2:00 to 2:45 p.m.";
        ((UILabel *)[timingLabels objectAtIndex:4]).text=@"3:00 to 3:45 p.m.";
        self.title=@"Hands-on Sessions";
    }
    else if (identifier==1) {
        ((UILabel *)[locationLabels objectAtIndex:0]).text=@"Block C";
        ((UILabel *)[locationLabels objectAtIndex:1]).text=@"Level 3";
        ((UILabel *)[timingLabels objectAtIndex:0]).text=@"10:45 to 11:30 a.m.";
        ((UILabel *)[timingLabels objectAtIndex:1]).text=@"12:45 to 1:30 p.m.";
        ((UILabel *)[timingLabels objectAtIndex:2]).text=@"2:45 to 3:30 p.m.";
        ((UILabel *)[timingLabels objectAtIndex:3]).text=@"";
        ((UILabel *)[timingLabels objectAtIndex:4]).text=@"";
        self.title=@"Educamp@SST";
    }
    else if (identifier==2) {
        ((UILabel *)[locationLabels objectAtIndex:0]).text=@"Auditorium";
        ((UILabel *)[locationLabels objectAtIndex:1]).text=@"Level 4";
        ((UILabel *)[timingLabels objectAtIndex:0]).text=@"9:00 to 9:30 a.m.";
        ((UILabel *)[timingLabels objectAtIndex:1]).text=@"11:00 to 11:30 a.m.";
        ((UILabel *)[timingLabels objectAtIndex:2]).text=@"1:00 to 1:30 p.m.";
        ((UILabel *)[timingLabels objectAtIndex:3]).text=@"3:00 to 3:35 p.m.";
        ((UILabel *)[timingLabels objectAtIndex:4]).text=@"";
        self.title=@"Principal Talk";
    }
    else if (identifier==3) {
        ((UILabel *)[locationLabels objectAtIndex:0]).text=@"Info Hub";
        ((UILabel *)[locationLabels objectAtIndex:1]).text=@"Level 4";
        ((UILabel *)[timingLabels objectAtIndex:0]).text=@"10:00 to 10:20 a.m.";
        ((UILabel *)[timingLabels objectAtIndex:1]).text=@"12:00 to 12:20 p.m.";
        ((UILabel *)[timingLabels objectAtIndex:2]).text=@"2:00 to 2:20 p.m.";
        ((UILabel *)[timingLabels objectAtIndex:3]).text=@"";
        ((UILabel *)[timingLabels objectAtIndex:4]).text=@"";
        self.title=@"Student Panel";
    }
    else if (identifier==4) {
        ((UILabel *)[locationLabels objectAtIndex:0]).text=@"Info Hub";
        ((UILabel *)[locationLabels objectAtIndex:1]).text=@"Level 5";
        ((UILabel *)[timingLabels objectAtIndex:0]).text=@"On-Going";
        ((UILabel *)[timingLabels objectAtIndex:1]).text=@"";
        ((UILabel *)[timingLabels objectAtIndex:2]).text=@"";
        ((UILabel *)[timingLabels objectAtIndex:3]).text=@"";
        ((UILabel *)[timingLabels objectAtIndex:4]).text=@"";
        self.title=@"DSA";
    }
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
