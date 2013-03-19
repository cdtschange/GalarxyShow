//
//  JMWhenTappedViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/10/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "JMWhenTappedViewController.h"
#import <GalarxyUIKitLib/JMWhenTapped.h>

@interface JMWhenTappedViewController ()

@end

@implementation JMWhenTappedViewController

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
    
    _view1 = [[UIView alloc] initWithFrame:CGRectMake(20.0, 20.0, 100.0, 100.0)];
	_view1.backgroundColor = [UIColor redColor];
    
	[self.view addSubview:_view1];
    
	[_view1 whenTapped:^{
		UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Tapped!" message:@"You tapped view1! Congratulations!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[a show];
	}];
    
    [_view1 whenDoubleTapped:^{
        UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Double tapped!" message:@"You double tapped view1! Congratulations!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[a show];
    }];
    
    [_view1 whenTwoFingerTapped:^{
        UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Two finger tapped!" message:@"You two finger tapped view1! Congratulations!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[a show];
    }];
    
	_view2 = [[UIView alloc] initWithFrame:CGRectMake(140.0, 20.0, 100.0, 100.0)];
	_view2.backgroundColor = [UIColor blueColor];
    
	[self.view addSubview:_view2];
    
	[_view2 whenTouchedDown:^{
		_view2.backgroundColor = [UIColor yellowColor];
	}];
    
	[_view2 whenTouchedUp:^{
		_view2.backgroundColor = [UIColor blueColor];
        
		UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Tapped!" message:@"You tapped view2! Congratulations!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[a show];
	}];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
