//
//  DifferentFontsLabelViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/20/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "DifferentFontsLabelViewController.h"
#import <GalarxyUIKitLib/DifferentFontsTextView.h>

@interface DifferentFontsLabelViewController ()

@end

@implementation DifferentFontsLabelViewController

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
    
	// Do any additional setup after loading the view, typically from a nib.
    DifferentFontsTextView *label = [[DifferentFontsTextView alloc]initWithFrame:self.view.frame];
    [label setText:@"abcdefghijklmnopqrstuvwxyz" WithFont:[UIFont systemFontOfSize:17] AndColor:[UIColor blackColor]];
    [label setKeyWordTextArray:[NSArray arrayWithObjects:@"a",@"d",@"f",@"c",@"w", nil] WithFont:[UIFont fontWithName:@"AcademyEngravedLetPlain" size:25] AndColor:[UIColor blueColor]];
    [label setKeyWordTextArray:[NSArray arrayWithObjects:@"b",@"e",@"g",@"q",@"z", nil] WithFont:[UIFont fontWithName:@"SnellRoundhand" size:35] AndColor:[UIColor redColor]];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
