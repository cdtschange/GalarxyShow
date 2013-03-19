//
//  ISColumnsViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/11/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "ISColumnsViewController.h"
#import "UIManager.h"
#import "ISViewController.h"
#import <GalarxyUIKitLib/ISColumnsController.h>

@interface ISColumnsViewController (){
    ISColumnsController *columnsController;
}

@end

@implementation ISColumnsViewController

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
    columnsController = [[ISColumnsController alloc] init];
    
    columnsController.navigationItem.leftBarButtonItem = [UIManager createCloseBarButtonItem:self];
    
    columnsController.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Reload"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(reloadViewControllers)];
    [self.navigationController pushViewController:columnsController animated:YES];
    [self performSelector:@selector(reloadViewControllers) withObject:nil afterDelay:0.1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadViewControllers
{
    ISViewController *viewController1 = [[ISViewController alloc] initWithNibName:@"ISViewController" bundle:nil];
    viewController1.title = @"ViewController 1";
    
    ISViewController *viewController2 = [[ISViewController alloc] initWithNibName:@"ISViewController" bundle:nil];

    viewController2.title = @"ViewController 2";
    
    ISViewController *viewController3 = [[ISViewController alloc] initWithNibName:@"ISViewController" bundle:nil];

    viewController3.title = @"ViewController 3";
    
    columnsController.viewControllers = [NSArray arrayWithObjects:
                            viewController1,
                            viewController2,
                            viewController3, nil];
}

@end
