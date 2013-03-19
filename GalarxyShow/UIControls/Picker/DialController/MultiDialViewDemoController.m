//
//  MultiDialViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/2/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "MultiDialViewDemoController.h"
#import <GalarxyUIKitLib/MultiDialViewController.h>

@interface MultiDialViewDemoController ()<MultiDialViewControllerDelegate> {
    MultiDialViewController *multiDialController;
}

@end

@implementation MultiDialViewDemoController
@synthesize selectedStringLabel, presetStringsView;

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
    multiDialController = [[MultiDialViewController alloc] init];
    multiDialController.delegate = self;
    multiDialController.view.frame = CGRectOffset(multiDialController.view.frame, 25.0, 360.0);
    [self.view addSubview:multiDialController.view];
    
    //init
    [self switchPresetStrings:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark IBActions

- (void)switchPresetStrings:(id)sender {
    if ([(UISwitch *)sender isOn]) {
        multiDialController.presetStrings = [[NSArray alloc] initWithObjects:@"000A", @"111A", @"222B", @"333C", @"360D", nil];
    }
    else {
        multiDialController.presetStrings = nil;
    }
    self.presetStringsView.text = [NSString stringWithFormat:@"%@", multiDialController.presetStrings];
}

- (void)spinToRandom:(id)sender {
    [multiDialController spinToRandomString:YES];
}

#pragma mark MultiDialViewControllerDelegate methods

- (void)multiDialViewController:(MultiDialViewController *)controller didSelectString:(NSString *)string {
    self.selectedStringLabel.text = string;
}

@end
