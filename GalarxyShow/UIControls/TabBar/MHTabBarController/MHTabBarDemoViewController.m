//
//  MHTabBarDemoViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/22/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "MHTabBarDemoViewController.h"
#import <GalarxyUIKitLib/MHTabBarController.h>

@interface MHTabBarDemoViewController ()<MHTabBarControllerDelegate>

@end

@implementation MHTabBarDemoViewController

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
    UIViewController *listViewController1 = [[UIViewController alloc] init];
	UIViewController *listViewController2 = [[UIViewController alloc] init];
	UIViewController *listViewController3 = [[UIViewController alloc] init];
	
	listViewController1.title = @"Tab 1";
	listViewController2.title = @"Tab 2";
	listViewController3.title = @"Tab 3";
    
	NSArray *viewControllers = [NSArray arrayWithObjects:listViewController1, listViewController2, listViewController3, nil];
	MHTabBarController *tabBarController = [[MHTabBarController alloc] init];
    
    tabBarController.buttonsImageArray = @[[UIImage imageNamed:@"mhtabbar_bg"],[UIImage imageNamed:@"mhtabbar_bg"],[UIImage imageNamed:@"mhtabbar_bg"],[UIImage imageNamed:@"mhtabbar_bg"]];
    tabBarController.buttonsSelectedImageArray = @[[UIImage imageNamed:@"mhtabbar_bg_h"],[UIImage imageNamed:@"mhtabbar_bg_h"],[UIImage imageNamed:@"mhtabbar_bg_h"],[UIImage imageNamed:@"mhtabbar_bg_h"]];
    tabBarController.iconsImageArray = @[[UIImage imageNamed:@"mhtabbar_icon"],[UIImage imageNamed:@"mhtabbar_icon"],[UIImage imageNamed:@"mhtabbar_icon"],[UIImage imageNamed:@"mhtabbar_icon"]];
    tabBarController.iconsSelectedImageArray = @[[UIImage imageNamed:@"mhtabbar_icon_h"],[UIImage imageNamed:@"mhtabbar_icon_h"],[UIImage imageNamed:@"mhtabbar_icon_h"],[UIImage imageNamed:@"mhtabbar_icon_h"]];
    tabBarController.indicateImage = [UIImage imageNamed:@"mhtabbar_indicator"];
  
    
    tabBarController.buttonsImageArray = @[[UIImage imageNamed:@"mhtabbar_bg"],[UIImage imageNamed:@"mhtabbar_bg"],[UIImage imageNamed:@"mhtabbar_bg"]];
    tabBarController.buttonsSelectedImageArray = @[[UIImage imageNamed:@"mhtabbar_bg_h"],[UIImage imageNamed:@"mhtabbar_bg_h"],[UIImage imageNamed:@"mhtabbar_bg_h"]];
    tabBarController.iconsImageArray = @[[UIImage imageNamed:@"mhtabbar_icon"],[UIImage imageNamed:@"mhtabbar_icon"],[UIImage imageNamed:@"mhtabbar_icon"]];
    tabBarController.iconsSelectedImageArray = @[[UIImage imageNamed:@"mhtabbar_icon_h"],[UIImage imageNamed:@"mhtabbar_icon_h"],[UIImage imageNamed:@"mhtabbar_icon_h"]];
    tabBarController.indicateImage = [UIImage imageNamed:@"mhtabbar_indicator"];
    
    
	tabBarController.delegate = self;
	tabBarController.viewControllers = viewControllers;
    [self.navigationController pushViewController:tabBarController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)mh_tabBarController:(MHTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index
{
	NSLog(@"mh_tabBarController %@ shouldSelectViewController %@ at index %u", tabBarController, viewController, index);
    
	// Uncomment this to prevent "Tab 3" from being selected.
	//return (index != 2);
    
	return YES;
}

- (void)mh_tabBarController:(MHTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index
{
	NSLog(@"mh_tabBarController %@ didSelectViewController %@ at index %u", tabBarController, viewController, index);
}
@end
