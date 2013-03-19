//
//  WKVerticalScrollBarViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/10/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "WKVerticalScrollBarViewController.h"
#import "WKTextDemoView.h"

@interface WKVerticalScrollBarViewController (){
    WKTextDemoView *demoView;
}

@end

@implementation WKVerticalScrollBarViewController

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
    demoView = [[WKTextDemoView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:demoView];
    // Do any additional setup after loading the view from its nib.
    
    NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"wkscroll_fillerati" ofType:@"txt"];
    NSString *text = [NSString stringWithContentsOfFile:fullPath
                                               encoding:NSUTF8StringEncoding
                                                  error:nil];
    
    [[demoView textLabel] setText:text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
