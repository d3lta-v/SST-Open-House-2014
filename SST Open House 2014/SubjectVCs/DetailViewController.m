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
        _textView.text=@"Science furthers the understanding of our natural and physical worlds as well as the wider universe through the process of scientific inquiry; which involves generating ideas, testing hypotheses, gathering evidence through observations, and conducting investigations and modelling. Through the study of Science, our students will become confident citizens in a technological world, able to take or develop an informed interest in matters of scientific importance.\n\nLearning Outcomes\n\nBy the end of four years, a SST graduate will be able to:\n\nUnderstand and apply major concepts in biology, chemistry and physics\nDevelop an understanding of the natural and physical worlds, built on current scientific theories and apply what they have learnt to authentic solutions\nEngage in the process of scientific inquiry\nApply critical and creative thinking to solve problems and create new knowledge\nBecome more aware of ethical and moral issues related to scientific advances.";
        _imageView.image = [self imageByScalingAndCroppingForSize:CGSizeMake(640, 480) withImage:[UIImage imageNamed:@"Science"]];
        self.title=@"Applied Science";
    }
    else if (ident==3) {
        // IH
        
        _textView.text=@"The study of the Humanities is the exploration of the human condition and experience, as they are impacted on by the geographical, environmental, political, economic, and social systems of the time and place.  The understanding and application of the knowledge, skills and values across History, Geography and Social Studies will provide our students a better appreciation and understanding of their inter-connectedness to progress or hinder human development and growth over cultures, time and space.\n\nLearning Outcomes\n\nStudents will acquire knowledge about:\n\nFundamental Humanities concepts, e.g. cause and consequence, change and continuity, space and place, relationships, systems and interconnections, and scarcity and choice\nSocieties and their cultures and how these impact human behaviors and actions\nKey personalities and their contributions and their impact on the world and the evolution of the Singapore narrative\nHow major events are related to one another in time.\n\nStudents will be able to:\n\nDevelop the skills of historical and geographical investigations/inquiry by asking meaningful questions, planning their own process for learning and searching for answers\nInterpret a variety of primary and secondary sources, e.g. maps, statistics, documents, media and audio clips, photographs\nCritically analyse and evaluate sources and data from different perspectives so as to arrive at an informed conclusion to an issue or problem\nPresent points of view or solutions confidently using appropriate platforms; and demonstrate the ability to work independently and collaboratively.";

        _imageView.image = [self imageByScalingAndCroppingForSize:CGSizeMake(640, 480) withImage:[UIImage imageNamed:@"IH"]];
        self.title=@"Humanities";
    }
    else if (ident==4) {
        // IRS
        
        _textView.text=@"Being able to effectively seek and create knowledge through applying the research process is essential for preparing students for life-long learning and a life of contribution to the knowledge community.  SST believes that students should be equipped with relevant skills and knowledge necessary for research projects from a young age.\n\nBy having our students conduct authentic research in and out of the classroom, they will be able to continue their search for knowledge in a systematic manner underpinned by ethical and social responsibility in the use, interpretation and generation of new knowledge.\n\nThe interdisciplinary nature of research done in authentic settings will aid students in transferring knowledge across disciplines and into the real world.\n\nLearning Outcomes\n\nStudents will be able to:\nAcquire project skills as a precursor to research and problem solving skills\nApply knowledge and skills across disciplines in conducting their research tasks\nApply the processes and tools of research to deepen their understanding of or solve a real world issue/problem\nFormulate clear and precise research questions, select appropriate research methodology, gather and analyse data, reach conclusions based on evidence, write research reports, and present their findings.\nDevelop skills and dispositions that foster life-long learning.";
        _imageView.image = [self imageByScalingAndCroppingForSize:CGSizeMake(640, 480) withImage:[UIImage imageNamed:@"IRS"]];
        self.title=@"Research Studies";
    }
    else if (ident==5) {
        // ICT
        
        _textView.text=@"The emergence of modern technology has forever changed the way we live, learn, work and play. Information and Communication Technology (ICT) is a leveller of the playing field for many in education, businesses, entertainment and politics, and as such, its effective and efficient use is of great importance for all students, especially SST students with their 1:1 learning devices.  Explicit instruction in ICT knowledge and skills must therefore be a part of the school curriculum for our students.\n\nLearning Outcomes\n\nStudents will be able to:\n\nUse their learning devices and multimedia software effectively to enhance and extend their learning in all subject areas.\nUtilise online tools for communication, learning and programming\nProgram in languages such as C++ and Objective-C";
        _imageView.image = [self imageByScalingAndCroppingForSize:CGSizeMake(640, 480) withImage:[UIImage imageNamed:@"ICT"]];
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
