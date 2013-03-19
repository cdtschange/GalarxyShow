//
//  MKEntryPanelViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/7/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "MKEntryPanelViewController.h"
#import <GalarxyUIKitLib/MKEntryPanel.h>

@interface MKEntryPanelViewController ()

@end

@implementation MKEntryPanelViewController

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

- (IBAction)show:(id)sender {
    [MKEntryPanel showPanelWithTitle:NSLocalizedString(@"Enter a text name", @"")
                              inView:self.view
                       onTextEntered:^(NSString* enteredString)
     {
         NSLog(@"Entered: %@", enteredString);
     }];
}
@end
