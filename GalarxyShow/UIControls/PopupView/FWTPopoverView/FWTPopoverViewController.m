//
//  FWTPopoverViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "FWTPopoverViewController.h"
#import <GalarxyUIKitLib/FWTPopoverView.h>

@interface FWTPopoverViewController ()

@property (nonatomic, strong) FWTPopoverView *popoverView;
@property (nonatomic, strong) UIView *touchPointView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, assign) FWTPopoverArrowDirection popoverArrowDirection;
@property (nonatomic, assign) BOOL manyPopoversEnabled;
@end

@implementation FWTPopoverViewController
@synthesize segmentedControl = _segmentedControl;
@synthesize popoverArrowDirection = _popoverArrowDirection;
@synthesize touchPointView = _touchPointView;

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
    self.manyPopoversEnabled=YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                                                            target:self
                                                                                            action:@selector(_didPressRightBarButton:)];
   
    
    self.view.backgroundColor = [UIColor colorWithWhite:.91f alpha:.35f];
    self.navigationItem.titleView = self.segmentedControl;
    self.popoverArrowDirection = pow(2, 0);
    self.segmentedControl.selectedSegmentIndex = log2(self.popoverArrowDirection);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.touchPointView = nil;
    self.segmentedControl = nil;
    self.popoverView=nil;
}

#pragma mark - Getters
- (UISegmentedControl *)segmentedControl
{
    if (!self->_segmentedControl)
    {
        self->_segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"N", @"U", @"D", @"L", @"R"]];
        self->_segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
        self->_segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self->_segmentedControl addTarget:self action:@selector(_valueChangedForSegmentedControl:) forControlEvents:UIControlEventValueChanged];
        [self->_segmentedControl sizeToFit];
    }
    
    return self->_segmentedControl;
}

- (UIView *)touchPointView
{
    if (!self->_touchPointView)
    {
        self->_touchPointView = [[UIView alloc] initWithFrame:CGRectMake(.0f, .0f, 4.0f, 4.0f)];
        self->_touchPointView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:.5f];
        self->_touchPointView.layer.borderWidth = 1.0f;
        self->_touchPointView.layer.cornerRadius = 2.0f;
    }
    
    return self->_touchPointView;
}

#pragma mark - Actions
- (void)_valueChangedForSegmentedControl:(UISegmentedControl *)segmentedControl
{
    self.popoverArrowDirection = pow(2, segmentedControl.selectedSegmentIndex);
}

- (void)_didPressRightBarButton:(UIBarButtonItem *)barButton
{
    CALayer *niceLayer = [self _pleaseGiveMeANiceLayer];
    [self.view.layer addSublayer:niceLayer];
    
    int64_t delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        NSArray *arrayCopy = [NSArray arrayWithArray:self.view.subviews];
        [arrayCopy enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
            if ([subview isKindOfClass:[FWTPopoverView class]])
                [(FWTPopoverView *)subview dismissPopoverAnimated:YES];
        }];
    });
    
    delayInSeconds = 3.0;
    popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [CATransaction begin];
        [CATransaction setValue:[NSNumber numberWithFloat:1.0f] forKey:kCATransactionAnimationDuration];
        niceLayer.opacity = 0.0;
        [CATransaction setCompletionBlock:^{ [niceLayer removeFromSuperlayer]; }];
        [CATransaction commit];
    });
}

- (void)_manyPopoverSwitchValueChanged:(UISwitch *)theSwitch
{
    self.manyPopoversEnabled = theSwitch.on;
}

#pragma mark - UIResponder
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    //
    if (!self.popoverView || self.manyPopoversEnabled)
    {
        self.popoverView = [[FWTPopoverView alloc] init];
        __block typeof(self) myself = self;
        self.popoverView.didDismissBlock = ^(FWTPopoverView *av){ myself.popoverView = nil; };
        CGColorRef fillColor = self.manyPopoversEnabled ? [self _pleaseGiveMeARandomColor].CGColor : self.popoverView.backgroundHelper.fillColor;
        self.popoverView.backgroundHelper.fillColor = fillColor;
        [self.popoverView presentFromRect:CGRectMake(point.x, point.y, 1.0f, 1.0f)
                                   inView:self.view
                  permittedArrowDirection:self.popoverArrowDirection
                                 animated:YES];
    }
//    else if (!self.manyPopoversEnabled)
//        [self.popoverView dismissPopoverAnimated:YES];
    
    
    //
    if (!self.touchPointView.superview) [self.view addSubview:self.touchPointView];
    self.touchPointView.center = point;
    [self.view bringSubviewToFront:self.touchPointView];
}

#pragma mark - Private
- (UIColor *)_pleaseGiveMeARandomColor
{
    NSInteger countOfItems = 200;
    NSInteger random = arc4random()%countOfItems;
    UIColor *color = [UIColor colorWithHue:(CGFloat)random/countOfItems saturation:.6f brightness:.7f alpha:.5f];
    return color;
}

- (CALayer *)_pleaseGiveMeANiceLayer
{
    CGRect frame = self.view.bounds;
    CAEmitterLayer *smokeEmitter = [CAEmitterLayer layer];
    smokeEmitter.emitterPosition = CGPointMake(frame.origin.x + frame.size.width / 2, frame.origin.y + frame.size.height / 2);
    smokeEmitter.emitterSize = frame.size;
    smokeEmitter.emitterShape = kCAEmitterLayerRectangle;
    
    CAEmitterCell *smokeCell = [CAEmitterCell emitterCell];
    NSString *imageName = @"fwtpopover_SmokeParticle.png";
    smokeCell.contents = (id)[[UIImage imageNamed:imageName] CGImage];
    [smokeCell setName:@"smokeCell"];
    smokeCell.birthRate = 150;
    smokeCell.lifetime = 1.0;
    smokeCell.lifetimeRange = 0.35;
    smokeCell.color = [[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0] CGColor];
    smokeCell.redRange = 1.0;
    smokeCell.redSpeed = 0.5;
    smokeCell.blueRange = 1.0;
    smokeCell.blueSpeed = 0.5;
    smokeCell.greenRange = 1.0;
    smokeCell.greenSpeed = 0.5;
    smokeCell.alphaSpeed = -0.2;
    smokeCell.velocity = 50;
    smokeCell.velocityRange = 20;
    smokeCell.yAcceleration = -100;
    smokeCell.emissionLongitude = -M_PI / 2;
    smokeCell.emissionRange = M_PI / 4;
    smokeCell.scale = 1.0;
    smokeCell.scaleSpeed = 1.0;
    smokeCell.scaleRange = 1.0;
    smokeEmitter.emitterCells = [NSArray arrayWithObject:smokeCell];
    
    return smokeEmitter;
}
@end
