//
//  AMGravityViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "AMGravityViewController.h"

@interface AMGravityViewController (){
    CMMotionManager *motionManager;
}

@end

@implementation AMGravityViewController
@synthesize imageView;
@synthesize scale;

- (CMMotionManager *)motionManager
{
    if(!motionManager)
        motionManager = [[CMMotionManager alloc] init];
    return motionManager;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc{
    self.imageView = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.scale = 1.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)motionOption:(AMGravityViewController *)moitonOption saveWithMotionScale:(double)motionScale
{
    self.scale = motionScale;
    [self.navigationController popViewControllerAnimated:YES];
}



#define MOTION_SCALE 1.0
- (void)startDrifting:(UIImageView *)imgView
{
    [self.motionManager startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        dispatch_sync(dispatch_get_main_queue(), ^(void) {
            CGRect imgFrame = imgView.frame;
            imgFrame.origin.x += accelerometerData.acceleration.x * self.scale;
            if(!CGRectContainsRect(self.view.bounds, imgFrame))
                imgFrame.origin.x = imgView.frame.origin.x;
            imgFrame.origin.y -= accelerometerData.acceleration.y * self.scale;
            if(!CGRectContainsRect(self.view.bounds, imgFrame))
                imgFrame.origin.y = imgView.frame.origin.y;
            imgView.frame = imgFrame;
            
            accelerationX.text = [NSString stringWithFormat:@"accelerationX : %f", accelerometerData.acceleration.x];
            accelerationY.text = [NSString stringWithFormat:@"accelerationY : %f", accelerometerData.acceleration.y];
            accelerationZ.text = [NSString stringWithFormat:@"accelerationZ : %f", accelerometerData.acceleration.z];
        });
        
    }];
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return UIInterfaceOrientationIsPortrait(toInterfaceOrientation);
}
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    [self startDrifting:imageView];
//}
//
//- (void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//    [self.motionManager stopAccelerometerUpdates];
//}

- (IBAction)driftingImage:(UIButton *)sender
{
    if ([self.motionManager isAccelerometerActive]) {
        [self.motionManager stopAccelerometerUpdates];
    } else {
        [self startDrifting:imageView];
    }
}
- (IBAction)showOptions:(UIButton *)sender
{
    AMGravityOptionViewController *movc = [[AMGravityOptionViewController alloc] init];
    movc.delegate = self;
    [self.navigationController pushViewController:movc animated:YES];
}

- (void)moveView:(UIImageView *)imgView toPoint:(CGPoint)destination
{
    UIViewAnimationOptions options = UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:2.0 delay:0.0 options:options animations:^(void) {
        imgView.center = destination;
    } completion:nil];
    [UIView animateWithDuration:1.0 delay:0 options:options animations:^(void) {
        imgView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:0.0 options:options animations:^(void) {
            imgView.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];
}

- (void)tap:(UIGestureRecognizer *)gesture
{
    [self moveView:self.imageView toPoint:[gesture locationInView:self.view]];
}

@end
