//
//  PFSphereLabelViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/20/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "PFSphereLabelViewController.h"
#import <GalarxyUIKitLib/PFSphereView.h>

@interface PFSphereLabelViewController ()

@end

@implementation PFSphereLabelViewController

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
    
	self.view.backgroundColor = [UIColor blackColor];
    
	PFSphereView *sphereView = [[PFSphereView alloc] initWithFrame:CGRectMake(512-300, 60, 600, 600)];
    
	NSMutableArray *labels = [[NSMutableArray alloc] init];
	for (int i = 0; i < 50; i++) {
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
		label.backgroundColor = [UIColor clearColor];
		label.textColor = [UIColor whiteColor];
		label.font = [UIFont systemFontOfSize:13];
		label.text = [NSString stringWithFormat:@"Label %i", i];
		[labels addObject:label];
	}
    
	[sphereView setItems:labels];
    
    
	[self.view addSubview:sphereView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
