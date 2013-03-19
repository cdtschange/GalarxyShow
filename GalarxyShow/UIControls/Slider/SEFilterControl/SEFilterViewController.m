//
//  ViewController.m
//  SEFilterControl_Sample
//
//  Created by Shady A. Elyaski on 6/15/12.
//  Copyright (c) 2012 Shady Elyaski. All rights reserved.
//

#import "SEFilterViewController.h"
#import <GalarxyUIKitLib/SEFilterControl.h>


@interface SEFilterViewController ()

@end

@implementation SEFilterViewController
@synthesize selectedIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    SEFilterControl *filter = [[SEFilterControl alloc]initWithFrame:CGRectMake(10, 20, 300, 70) Titles:[NSArray arrayWithObjects:@"Articles", @"News", @"Updates", @"Featured", @"Newest", @"Oldest", nil]];
    [filter addTarget:self action:@selector(filterValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:filter];
    
    filter = [[SEFilterControl alloc]initWithFrame:CGRectMake(30, 120, 260, 60) Titles:[NSArray arrayWithObjects:@"Articles", @"Latest", @"Featured", @"Oldest", nil]];
    [filter setProgressColor:[UIColor lightGrayColor]];
    [filter setHandlerColor:[UIColor darkGrayColor]];
    [filter setTitlesColor:[UIColor blackColor]];
    [filter setTitlesFont:[UIFont fontWithName:@"Didot" size:14]];
    [filter addTarget:self action:@selector(filterValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:filter];
    
    filter = [[SEFilterControl alloc]initWithFrame:CGRectMake(60, 220, 200, 80) Titles:[NSArray arrayWithObjects:@"Articles", @"Latest", @"Featured", @"Oldest", nil]];
    [filter setProgressColor:[UIColor magentaColor]];
    [filter setHandlerColor:[UIColor yellowColor]];
    [filter setTitlesColor:[UIColor purpleColor]];
    [filter addTarget:self action:@selector(filterValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:filter];
}

-(void)filterValueChanged:(SEFilterControl *) sender{
    [selectedIndex setText:[NSString stringWithFormat:@"%d", sender.SelectedIndex]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
    [self setSelectedIndex:nil];
}
- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
