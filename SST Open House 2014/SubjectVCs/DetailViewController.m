//
//  DetailViewController.m
//  Open House
//
//  Created by Pan Ziyue on 17/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImage-Extensions.h"

@interface DetailViewController ()

-(void)setTextAccordingToIdentifier:(NSUInteger)identifier;

@end

@implementation DetailViewController

@synthesize identifier, segmentedCtrlData;

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
    
    [self setTextAccordingToIdentifier:identifier];
}

-(void)setTextAccordingToIdentifier:(NSUInteger)ident
{
    if (ident==0) {
        // English
        _textView.text=@"Language is functional as it is used to make and exchange meanings influenced by social and cultural contexts. \nLocally, the English language is used to facilitate communication and bonding among the different ethnic and cultural groups. \nGlobally, it allows Singaporeans to participate actively and effectively in a knowledge-based economy where it is the lingua franca of the Internet, of science and technology, and of world economy.\n\nLearning Outcomes:\n\nAt the end of four years, a SST graduate who has mastered the English Language will be able to:\n\nCommunicate fluently and effectively using appropriate text types to achieve the purpose, context, culture and audience intended.\nEmploy critical and creative thinking skills in evaluating arguments and opinions and generating ideas.\nAppreciate the nuances in language as used by writers in varying texts.\nUnderstand the relationships between ideas within and across disciplines.\nUse Information and Communication Technology actively and purposefully to facilitate the understanding, learning and use of the English Language.";
        _imageView.image = [self imageByScalingAndCroppingForSize:CGSizeMake(640, 480) withImage:[UIImage imageNamed:@"English"]];
        self.title=@"English";
    }
    else if (ident==1) {
        // Maths
        _textView.text=@"The nature of mathematics serves to conceptualise the world and the relationships contained within, as it searches for patterns to simplify every day life and the issues inherent within - a process made simpler through Multi-Modal Mathematical Representations.\n\nIt presents an excellent platform for nurturing a student’s tenacity, inquisitiveness and curiosity, risk-taking, critical and creative thinking; for enhancing a student’s appreciation, understanding and application of mathematical concepts for effective problem solving in real world context and within the structures of formal Mathematics; and for developing individuals who actively seek real-world significance of their learning.\n\nLearning Outcomes\n\nThe SST Mathematics programme seeks to nurture innovative individuals able to lead in the forefront of science and technology, and who are able to:\n\nAppreciate the beauty and elegance of mathematics\nCommit to continual learning of mathematics\nEffectively communicate and reason mathematically\nMake connections between mathematics and its applications both within the real-world and theoretical context\nUse mathematics to effectively contribute to society\nUse technology to triangulate learning across the 3 main representations of Mathematics – PROCEDURAL, GRAPHICAL and NUMERICAL.";
        _imageView.image = [self imageByScalingAndCroppingForSize:CGSizeMake(640, 480) withImage:[UIImage imageNamed:@"Maths"]];
        self.title=@"Mathematics";
    }
    else if (ident==2) {
        // Science
        
        self.title=@"Applied Science";
    }
    else if (ident==3) {
        // IH
        
        self.title=@"Humanities";
    }
    else if (ident==4) {
        // IRS
        
        self.title=@"Research";
    }
    else if (ident==5) {
        // ICT
        
        self.title=@"Infocomm";
    }
    _textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    _textView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
}

- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize withImage:(UIImage*)imageInput
{
    UIImage *newImage = nil;
    CGSize imageSize = imageInput.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
        {
            scaleFactor = widthFactor; // scale to fit height
        }
        else
        {
            scaleFactor = heightFactor; // scale to fit width
        }
        
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
        {
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
        }
    }
    
    UIGraphicsBeginImageContext(targetSize); // this will crop
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [imageInput drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil)
    {
        NSLog(@"could not scale image");
    }
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentedCtrl:(id)sender // This is for the segmented control to swap between topics
{
    if (segmentedCtrlData.selectedSegmentIndex==0) {
        if (identifier>0) {
            identifier--;
        }
    }
    else if (segmentedCtrlData.selectedSegmentIndex==1) {
        if (identifier<5) {
            identifier++;
        }
    }
    // Resync image and text to respective identifier, and deselect the control
    [segmentedCtrlData setSelectedSegmentIndex:-1];
    [self setTextAccordingToIdentifier:identifier];
}

@end
