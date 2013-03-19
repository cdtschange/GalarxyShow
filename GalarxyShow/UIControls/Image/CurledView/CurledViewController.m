//
//  CurledViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/12/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "CurledViewController.h"
#import <GalarxyUIKitLib/UIButton+Curled.h>
#import <GalarxyUIKitLib/UIImageView+Curled.h>

@interface CurledViewController ()

@end

@implementation CurledViewController
@synthesize photoButton;
@synthesize photoImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc{
    
    [self setPhotoButton:nil];
    [self setPhotoImageView:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // configure images and border for a Custom UIButton
    [photoButton setContentMode:UIViewContentModeScaleToFill];
    [photoButton setImage:[UIImage imageNamed:@"curledview_raptor_face.png"] borderWidth:5.0 shadowDepth:10.0 controlPointXOffset:30.0 controlPointYOffset:70.0 forState:UIControlStateNormal];
    [photoButton setImage:[UIImage imageNamed:@"curledview_stegasaurus_face.png"] borderWidth:5.0 shadowDepth:10.0 controlPointXOffset:30.0 controlPointYOffset:70.0 forState:UIControlStateHighlighted];
    
    
    // configure images and border for a UIImageView
    [photoImageView setContentMode:UIViewContentModeScaleToFill];
    [photoImageView setImage:[UIImage imageNamed:@"curledview_stegasaurus_face.png"] borderWidth:5.0 shadowDepth:10.0 controlPointXOffset:30.0 controlPointYOffset:70.0];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
