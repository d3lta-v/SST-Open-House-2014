//
//  UniformViewController.m
//  Open House
//
//  Created by Pan Ziyue on 20/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import "UniformViewController.h"
#import "CCADetailsViewController.h"
#import "CommonMethods.h"

@interface UniformViewController ()
{
    NSUInteger identifier;
}

@end

@implementation UniformViewController

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
        [[segue destinationViewController] setTitle:@"Scouts"];
        [[segue destinationViewController] setImageToUse:[UIImage imageNamed:@"Scouts"]];
        [[segue destinationViewController] setTextViewText:@"The Scouts CCA was started in 2014 by a group of very enthusistic students who wanted to explore the outdoors."];
}


- (IBAction)buttonPressed:(id)sender {
    identifier=[sender tag];
    [self performSegueWithIdentifier:@"gotoUniformDetail" sender:self];
}

@end
