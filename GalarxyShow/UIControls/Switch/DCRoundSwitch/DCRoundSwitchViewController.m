//
//  DCRoundSwitchViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/14/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "DCRoundSwitchViewController.h"
#import <GalarxyUIKitLib/DCRoundSwitch.h>

@interface DCRoundSwitchViewController ()

@end

@implementation DCRoundSwitchViewController
@synthesize fatSwitch;
@synthesize switch1;
@synthesize switch2;
@synthesize switch3;
@synthesize longSwitch;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc{
    
	[self setLongSwitch:nil];
	[self setFatSwitch:nil];
	[self setSwitch1:nil];
	[self setSwitch2:nil];
	[self setSwitch3:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
	self.switch1.on = YES;
	[self.switch1 addTarget:self action:@selector(switch1Toggled:) forControlEvents:UIControlEventValueChanged];
    
	self.switch2.onTintColor = [UIColor redColor];
	self.switch2.on = YES;
    
	self.switch3.onTintColor = [UIColor blackColor];
	self.switch3.on = YES;
	[self.switch3 addTarget:self action:@selector(switch3Toggled:) forControlEvents:UIControlEventValueChanged];
    
	self.fatSwitch.onText = @"1";
	self.fatSwitch.offText = @"0";
    
	self.longSwitch.onText = NSLocalizedString(@"CUSTOM TEXT ON", @"");
	self.longSwitch.offText = NSLocalizedString(@"CUSTOM TEXT OFF", @"");
	self.longSwitch.on = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)switch1Toggled:(id)sender
{
	[switch2 setOn:!switch2.isOn animated:YES];
}

- (void)switch3Toggled:(id)sender
{
	[fatSwitch setOn:!fatSwitch.isOn animated:YES];
}

@end
