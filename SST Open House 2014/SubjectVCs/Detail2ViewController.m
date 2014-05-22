//
//  Detail2ViewController.m
//  Open House
//
//  Created by Pan Ziyue on 21/5/14.
//  Copyright (c) 2014 Cyber Inc & StatiX Industries. All rights reserved.
//

#import "Detail2ViewController.h"

@interface Detail2ViewController ()
{
    BOOL iPad;
}

@end

@implementation Detail2ViewController

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
    
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
        iPad=YES;
    else
        iPad=NO;
    
    [self setTextAccordingToIdentifier:identifier];
}

-(void)setTextAccordingToIdentifier:(NSUInteger)ident
{
    if (ident==0) {
        // Introduction
        _textView.text=@"Ngee Ann Polytechnic will be offering applied subjects to upper secondary students at SST from 2012. The subjects which are designed, conducted and assessed by Ngee Ann Polytechnic are equivalent in rigour and scope to existing ‘O’ level subjects. The applied subject results will be reflected in the GCE ‘O’ level Examination Certificate and recognised for admission into Junior Colleges and Polytechnics.\n\nThe 4 applied subjects offered in 2013 are Biotechnology, Media Studies (EL), Fundamentals of Electronics and Design Studies. The school will continue to explore with MOE and the tertiary partners to offer other applied subjects in years to come. ";
        if (iPad)
            _imageView.image = [UIImage imageNamed:@"Introduction"];
        else
            _imageView.image = [self imageByScalingAndCroppingForSize:CGSizeMake(640, 480) withImage:[UIImage imageNamed:@"Introduction"]];
        self.title=@"Introduction";
    }
    else if (ident==1) {
        // Biotechnology
        _textView.text=@"The Biotechnology course introduces students to the study of the use of living organisms or their products, and cellular biomolecular processes, to solve problems or make useful products for the benefit of mankind. The subject uses knowledge from a variety of disciplines including, biology, chemistry, physics, bioinformatics, genetic engineering and manufacturing processes. The subject of biotechnology is, however, distinct from biology as while biology studies basic processes of living organisms, biotechnology is the application of biology to solve problems and improve lives.\n\nStudents will have an opportunity to learn about principles and applications of various areas of biotechnology such as cell culture technology, microbial biotechnology and recombinant DNA technology. This subject helps the students develop good laboratory skills and a research mindset. It also provides students with a foundation for further studies in biotechnology, biomedical science and other related fields.";
        if (iPad)
            _imageView.image = [self imageByScalingAndCroppingForSize:CGSizeMake(768, 576) withImage:[UIImage imageNamed:@"Biotechnology"]];
        else
            _imageView.image = [self imageByScalingAndCroppingForSize:CGSizeMake(640, 480) withImage:[UIImage imageNamed:@"Biotechnology"]];
        self.title=@"Biotechnology";
    }
    else if (ident==2) {
        // FOE
        _textView.text=@"The Fundamentals of Electronics course aims to equip students with a sound understanding of basic electronics theory and at the same time provide ample opportunities for students to hone their creative and problem solving skills through practical application of electronics to the design of authentic gadgets and products.\n\nThe topics taught include fundamentals of physics and electricity, types of resistors, voltage and current sources, Network Theorem and analysis, the capacitor, light emitting semiconductors, sensors, and output devices, The Bipolar Junction Transistor, and project management.\n\nStudents will experience motivating learning through real world applications such as building of a transistor organ, rain detector, sound activated ballet dancer, universal electronic timer, heat sensor, line-follower robot, and a two-way electronic intercom system.\n\nStudents will hone their creative and problem-solving skills through effective training in basic electronics theory and practical electronics.";
        if (iPad)
            _imageView.image = [self imageByScalingAndCroppingForSize:CGSizeMake(768, 576) withImage:[UIImage imageNamed:@"FOE"]];
        else
            _imageView.image = [self imageByScalingAndCroppingForSize:CGSizeMake(640, 480) withImage:[UIImage imageNamed:@"FOE"]];
        self.title=@"F.O.E.";
    }
    else if (ident==3) {
        // Design Studies
        
        _textView.text=@"The Design Studies course equips students with the knowledge of the characteristics of the design field via exposure to design thinking, the design process, and the fundamentals of three design disciplines: that of visual communication design, interior and exhibition space design, and architectural design.\n\nThe subject aims to nurture an awareness and appreciation of the positive relationships spanning design, humanity, art, technology, business, culture and economic development; and the role of design in shaping one’s experience of visual communication, space, objects and the environment.\n\nStudents will develop creative and innovative mindsets, critical thinking and analytical skills through design activities; and acquire the ability to critique design works and to generate creative design solutions. Students will also acquire competencies for presenting design concepts and effective oral communication through innovative technology use.";
        if (iPad)
            _imageView.image = [self imageByScalingAndCroppingForSize:CGSizeMake(768, 576) withImage:[UIImage imageNamed:@"DS"]];
        else
            _imageView.image = [self imageByScalingAndCroppingForSize:CGSizeMake(640, 480) withImage:[UIImage imageNamed:@"DS"]];
        self.title=@"Design Studies";
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


#pragma mark - Navigation

/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
