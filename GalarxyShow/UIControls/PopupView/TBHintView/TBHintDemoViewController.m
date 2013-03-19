//
//  TBHintDemoViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/4/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "TBHintDemoViewController.h"
#import "TBDemoHintView.h"

@interface TBHintDemoViewController ()

-(void) displayHint;
@end

@implementation TBHintDemoViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) displayHint
{
    if( ![TBDemoHintView shouldShowHint:kHintID_Home] )
    {
        return;
    }
    
    __block TBDemoHintView* hintView = [TBDemoHintView  infoHintView];
    
    // Overwrites the pages titles
    //hintView.title = @"Welcome to the Demo!";
    
    hintView.hintID = kHintID_Home;
    
    [hintView addPageWithtitle:@"Page 1" text:@"We'll show you these little helpers throughout the app. However, you can certainly turn them off if you like." buttonText:@"Turn off hints" buttonAction:^{
        
        [TBDemoHintView enableHints:NO];
        
        [hintView dismiss];
    }];
    
    [hintView addPageWithTitle:@"Page 2" text:@"This is some demo text. Swipe this message to see the next hint!"];
    [hintView addPageWithTitle:@"Page 3" image:[UIImage imageNamed:@"tbhint_touchbee_small.png"]];
    [hintView addPageWithTitle:@"Page 4" text:@"Text B"];
    [hintView addPageWithTitle:@"Page 5" text:@"Text C"];
    
    [hintView showInView:self.view orientation:kHintViewOrientationBottom];
}


-(IBAction) hint1
{
    __block TBDemoHintView* hintView = [TBDemoHintView  infoHintView];
    
    // Overwrites the pages titles
    //hintView.title = @"Welcome to the Demo!";
    
    hintView.hintID = kHintID_Home;
    
    [hintView addPageWithtitle:@"Page 1" text:@"We'll show you these little helpers throughout the app. However, you can certainly turn them off if you like." buttonText:@"Turn off hints" buttonAction:^{
        
        [TBDemoHintView enableHints:NO];
        
        [hintView dismiss];
    }];
    
    [hintView addPageWithTitle:@"Page 2" text:@"This is some demo text. Swipe this message to see the next hint!"];
    [hintView addPageWithTitle:@"Page 3" image:[UIImage imageNamed:@"tbhint_touchbee_small.png"]];
    [hintView addPageWithTitle:@"Page 4" text:@"Text B"];
    [hintView addPageWithTitle:@"Page 5" text:@"Text C"];
    
    [hintView showInView:self.view orientation:kHintViewOrientationBottom];
}


-(IBAction) hint2
{
    __block TBDemoHintView* hintView = [TBDemoHintView  infoHintView];
    
    // Overwrites the pages titles
    //hintView.title = @"Welcome to the Demo!";
    
    hintView.hintID = kHintID_Home;
    
    [hintView addPageWithTitle:@"Page 1" image:[UIImage imageNamed:@"tbhint_touchbee_small.png"]];
    
    [hintView showInView:self.view orientation:kHintViewOrientationTop presentation:kHintViewPresentationSlide];
}


-(IBAction) hint3
{
    __block TBDemoHintView* hintView = [TBDemoHintView  warningHintView];
    
    // Overwrites the pages titles
    hintView.title = @"Welcome to the Demo!";
    
    hintView.hintID = kHintID_Home;
    
    [hintView addPageWithtitle:@"Page 1" text:@"We'll show you these little helpers throughout the app. However, you can certainly turn them off if you like." buttonText:@"Turn off hints" buttonAction:^{
        
        [TBDemoHintView enableHints:NO];
        
        [hintView dismiss];
    }];
    
    [hintView addPageWithTitle:@"Page 2" text:@"This is some demo text. Swipe this message to see the next hint!"];
    [hintView addPageWithTitle:@"Page 3" image:[UIImage imageNamed:@"tbhint_touchbee_small.png"]];
    [hintView addPageWithTitle:@"Page 4" text:@"Text B"];
    [hintView addPageWithTitle:@"Page 5" text:@"Text C"];
    
    [hintView showInView:self.view orientation:kHintViewOrientationBottom presentation:kHintViewPresentationBounce];
}


-(IBAction) hint4
{
    __block TBDemoHintView* hintView = [TBDemoHintView  warningHintView];
    
    // Overwrites the pages titles
    hintView.hintID = kHintID_Home;
    
    [hintView addPageWithTitle:@"Single Page" text:@"Some more text..."];
    
    [hintView showInView:self.view orientation:kHintViewOrientationBottom presentation:kHintViewPresentationDrop];
}


-(IBAction) hint5
{
    __block TBDemoHintView* hintView = [TBDemoHintView  otherHintView];
    
    // Overwrites the pages titles
    hintView.hintID = kHintID_Home;
    
    [hintView addPageWithTitle:@"Single Page" text:@"Some more text..."];
    
    [hintView showInView:self.view orientation:kHintViewOrientationTop duration:3.0];
    
}
@end
