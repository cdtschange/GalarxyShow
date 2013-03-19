//
//  CustomMKAnnotationViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/23/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "CustomMKAnnotationViewController.h"

@interface CustomMKAnnotationViewController ()
{
    CustomMKMapViewController *_mapViewController;
}

@end

@implementation CustomMKAnnotationViewController

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
    NSDictionary *dic1=[NSDictionary dictionaryWithObjectsAndKeys:@"30.281843",@"latitude",@"120.102193",@"longitude",nil];
    
    NSDictionary *dic2=[NSDictionary dictionaryWithObjectsAndKeys:@"30.290144",@"latitude",@"120.146696‎",@"longitude",nil];
    
    NSDictionary *dic3=[NSDictionary dictionaryWithObjectsAndKeys:@"30.248076",@"latitude",@"120.164162‎",@"longitude",nil];
    
    NSDictionary *dic4=[NSDictionary dictionaryWithObjectsAndKeys:@"30.425622",@"latitude",@"120.299605",@"longitude",nil];
    
    NSArray *array = [NSArray arrayWithObjects:dic1,dic2,dic3,dic4, nil];
    
	_mapViewController = [[CustomMKMapViewController alloc] initWithNibName:@"CustomMKMapViewController" bundle:nil];
    _mapViewController.delegate = self;
    [self.view addSubview:_mapViewController.view];
    [_mapViewController.view setFrame:self.view.bounds];
    [_mapViewController resetAnnitations:array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)customMKMapViewDidSelectedWithInfo:(id)info
{
    NSLog(@"%@",info);
}
@end
