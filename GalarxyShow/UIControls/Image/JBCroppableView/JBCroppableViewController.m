//
//  JBCroppableViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "JBCroppableViewController.h"
#import <GalarxyUIKitLib/JBCroppableView.h>

@interface JBCroppableViewController (){
    
    UIImageView *b;
}

@property (nonatomic, strong) JBCroppableView *pointsView;

@end

@implementation JBCroppableViewController

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
    
    self.image.frame = [JBCroppableView scaleRespectAspectFromRect1:CGRectMake(0, 0, self.image.image.size.width, self.image.image.size.height) toRect2:self.image.frame];
    self.pointsView = [[JBCroppableView alloc] initWithImageView:self.image];
    
    //    [self.pointsView addPointsAt:@[[NSValue valueWithCGPoint:CGPointMake(10, 10)],
    //                                    [NSValue valueWithCGPoint:CGPointMake(50, 10)],
    //                                    [NSValue valueWithCGPoint:CGPointMake(50, 50)],
    //                                    [NSValue valueWithCGPoint:CGPointMake(10, 50)]]];
    
    [self.pointsView addPoints:9];
    
    [self.view addSubview:self.pointsView];
    [self.view bringSubviewToFront:self.cropButton];
    [self.view bringSubviewToFront:self.undoButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cropTapped:(id)sender
{
    self.image.image = [self.pointsView deleteBackgroundOfImage:self.image];
    
}

- (IBAction)undoTapped:(id)sender
{
    self.image.image = [UIImage imageNamed:@"jbcrop_IMG_0152.JPG"];
}
@end
