//
//  JHTickerViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "JHTickerViewController.h"
#import <GalarxyUIKitLib/JHTickerView.h>

@interface JHTickerViewController ()

@end

@implementation JHTickerViewController

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
    
	NSArray *tickerStrings = [NSArray arrayWithObjects:@"JHTickerView - A custom ticker view by Jeff Hodnett", @"We're no strangers to love, You know the rules and so do I, A full commitment's what I'm thinking of, You wouldn't get this from any other guy.....", @"I just wanna tell you how I'm feeling, Gotta make you understand.....", @"Never gonna give you up, Never gonna let you down, Never gonna run around and desert you.....", @"Never gonna make you cry, Never gonna say goodbye, Never gonna tell a lie and hurt you.....", nil];
	
	ticker = [[JHTickerView alloc] initWithFrame:CGRectMake(362, 177, 300, 50)];
    [ticker setDirection:JHTickerDirectionLTR];
	[ticker setTickerStrings:tickerStrings];
	[ticker setTickerSpeed:60.0f];
	[ticker start];
	
	[self.view addSubview:ticker];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)pauseButtonSelected:(id)sender {
	
	[ticker pause];
}

-(IBAction)resumeButtonSelected:(id)sender {
    
	[ticker resume];
}

@end
