//
//  MarqueeLabelViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "MarqueeLabelViewController.h"
#import <GalarxyUIKitLib/MarqueeLabel.h>

@interface MarqueeLabelViewController ()

@end

@implementation MarqueeLabelViewController
@synthesize demoLabel;

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
    // Do any additional setup after loading the view from its nib.
    
    MarqueeLabel *newLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(310, 100, 300, 20) duration:8.0 andFadeLength:10.0f];
    self.demoLabel = newLabel;
    
    [self.view addSubview:self.demoLabel];
    
    self.demoLabel.numberOfLines = 1;
    self.demoLabel.opaque = NO;
    self.demoLabel.enabled = YES;
    self.demoLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    self.demoLabel.textAlignment = UITextAlignmentLeft;
    self.demoLabel.textColor = [UIColor colorWithRed:0.234 green:0.234 blue:0.234 alpha:1.000];
    self.demoLabel.backgroundColor = [UIColor clearColor];
    self.demoLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.000];
    
    self.demoLabel.text = @"This is a test of the label. Look how long this label is! It's so long it stretches off the view!";
    
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(changeTheLabel) userInfo:nil repeats:NO];
    
    // Rate-speed label example
    MarqueeLabel *rateLabelOne = [[MarqueeLabel alloc] initWithFrame:CGRectMake(310, 200, 300, 20) rate:50.0f andFadeLength:10.0f];
    rateLabelOne.numberOfLines = 1;
    rateLabelOne.opaque = NO;
    rateLabelOne.enabled = YES;
    rateLabelOne.shadowOffset = CGSizeMake(0.0, -1.0);
    rateLabelOne.textAlignment = UITextAlignmentLeft;
    rateLabelOne.textColor = [UIColor colorWithRed:0.234 green:0.234 blue:0.234 alpha:1.000];
    rateLabelOne.backgroundColor = [UIColor clearColor];
    rateLabelOne.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.000];
    rateLabelOne.text = @"This is another long label that scrolls at a specific rate, rather than scrolling its length in a specific time window!";
    
    [self.view addSubview:rateLabelOne];
    
    MarqueeLabel *rateLabelTwo = [[MarqueeLabel alloc] initWithFrame:CGRectMake(310, 230, 300, 20) rate:50.0f andFadeLength:10.0f];
    rateLabelTwo.numberOfLines = 1;
    rateLabelTwo.opaque = NO;
    rateLabelTwo.enabled = YES;
    rateLabelTwo.shadowOffset = CGSizeMake(0.0, -1.0);
    rateLabelTwo.textAlignment = UITextAlignmentLeft;
    rateLabelTwo.textColor = [UIColor colorWithRed:0.234 green:0.234 blue:0.234 alpha:1.000];
    rateLabelTwo.backgroundColor = [UIColor clearColor];
    rateLabelTwo.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.000];
    rateLabelTwo.text = @"This text is not as long, but still long enough to scroll, and scrolls the same speed!";
    
    [self.view addSubview:rateLabelTwo];    
}

- (void)changeTheLabel {
    self.demoLabel.text = @"This label is not as long.";
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    self.demoLabel = nil;
}
@end
