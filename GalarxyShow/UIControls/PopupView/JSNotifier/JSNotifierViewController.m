//
//  JSNotifierViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/7/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "JSNotifierViewController.h"
#import <GalarxyUIKitLib/JSNotifier.h>

@interface JSNotifierViewController ()

@end

@implementation JSNotifierViewController

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

- (IBAction)succsess:(id)sender{
    
    JSNotifier *notify = [[JSNotifier alloc]initWithTitle:@"Upload Succeeded" parentView:self.view];
    notify.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jsnotifier_NotifyCheck.png"]];
    [notify showFor:2.0];
    
}
- (IBAction)error:(id)sender{
    
    JSNotifier *notify = [[JSNotifier alloc]initWithTitle:@"Upload Failed" parentView:self.view];
    notify.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jsnotifier_NotifyX.png"]];
    [notify showFor:2.0];
    
    
}
- (IBAction)activity:(id)sender{
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activityIndicator startAnimating];
    
    JSNotifier *notify = [[JSNotifier alloc]initWithTitle:@"Uploading..." parentView:self.view];
    notify.accessoryView = activityIndicator;
    [notify showFor:6.0];
}
- (IBAction)loop:(id)sender{
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activityIndicator startAnimating];
    
    JSNotifier *notify = [[JSNotifier alloc]initWithTitle:@"Uploading..." parentView:self.view];
    notify.accessoryView = activityIndicator;
    [notify show];
    
    //A sample six second delay.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 6.0 * NSEC_PER_SEC), dispatch_get_current_queue(), ^{
        
        [notify setAccessoryView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jsnotifier_NotifyCheck.png"]] animated:YES];
        [notify setTitle:@"Upload Succeeded" animated:YES];
        
        [notify hideIn:4.0];
    });
}
@end
