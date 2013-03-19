//
//  KZColorPickerViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/9/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "KZColorPickerViewController.h"
#import <GalarxyUIKitLib/UIColor-Expanded.h>

@interface KZColorPickerViewController ()

@end

@implementation KZColorPickerViewController
@synthesize delegate;
@synthesize selectedColor;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc{
    self.selectedColor=nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.selectedColor = [UIColor whiteColor];
    UIView *container = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 1024, 768-44-20) ];
	container.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	container.backgroundColor = [UIColor clearColor];
	self.view = container;
	
	KZColorPicker *picker = [[KZColorPicker alloc] initWithFrame:container.bounds];
    picker.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	picker.selectedColor = self.selectedColor;
    picker.oldColor = self.selectedColor;
	[picker addTarget:self action:@selector(pickerChanged:) forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:picker];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pickerChanged:(KZColorPicker *)cp
{
    self.selectedColor = cp.selectedColor;
    if (delegate) {
        [delegate defaultColorController:self didChangeColor:cp.selectedColor];
    }
}

@end
