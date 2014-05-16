//
//  WebViewController.h
//  Open House
//
//  Created by Pan Ziyue on 16/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Externals/NJKWebViewProgress/NJKWebViewProgress.h"

@interface WebViewController : UIViewController <NJKWebViewProgressDelegate, UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *mainWebView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshOrStopButton;
@property (copy, nonatomic) NSString *urlString;

-(IBAction)exitNavigationVC:(id)sender;

@end
