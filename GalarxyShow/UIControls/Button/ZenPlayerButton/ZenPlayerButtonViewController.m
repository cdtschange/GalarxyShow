//
//  ZenPlayerButtonViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/4/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "ZenPlayerButtonViewController.h"
#import <GalarxyUIKitLib/debug.h>
#import <GalarxyUIKitLib/ZenPlayerButton.h>

@interface ZenPlayerButtonViewController ()

@end

@implementation ZenPlayerButtonViewController

@synthesize zenPlayerButton=_zenPlayerButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // create new zen player button
    self.zenPlayerButton = [[ZenPlayerButton alloc] initWithFrame:CGRectMake(458, 178, 104, 104)];
    // listening to tap event on the button
    [self.zenPlayerButton addTarget:self
                             action:@selector(zenPlayerButtonDidTouchUpInside:)
                   forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.zenPlayerButton];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (IBAction) rewind:(id)sender;
{
    self.zenPlayerButton.progress = 0.0f;
}

- (IBAction) forward:(id)sender;
{
    self.zenPlayerButton.progress += 0.1f;
}

- (IBAction) changeState:(id)sender;
{
    self.zenPlayerButton.state = ZenPlayerButtonStatePlaying;
}

- (void) zenPlayerButtonDidTouchUpInside:(id)sender;
{
    LOG_CURRENT_METHOD;
}


@end
