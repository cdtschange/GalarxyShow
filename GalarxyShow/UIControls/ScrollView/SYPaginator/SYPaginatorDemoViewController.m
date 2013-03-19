//
//  SYPaginatorViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/10/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "SYPaginatorDemoViewController.h"
#import "UIManager.h"
#import "PEPageView.h"

@interface SYPaginatorDemoViewController ()

@end

@implementation SYPaginatorDemoViewController

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
    self.navigationItem.leftBarButtonItem = [UIManager createCloseBarButtonItem:self];
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
	
	self.view.backgroundColor = [UIColor blackColor];
	self.paginatorView.pageGapWidth = 30.0f;
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (void)goBack:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - SYPaginatorViewDataSource

- (NSInteger)numberOfPagesForPaginatorView:(SYPaginatorView *)paginatorView {
	return 99999;
}

- (SYPageView *)paginatorView:(SYPaginatorView *)paginatorView viewForPageAtIndex:(NSInteger)pageIndex {
	static NSString *identifier = @"identifier";
	
	PEPageView *view = (PEPageView *)[paginatorView dequeueReusablePageWithIdentifier:identifier];
	if (!view) {
		view = [[PEPageView alloc] initWithReuseIdentifier:identifier];
	}
	
	view.textLabel.text = [NSString stringWithFormat:@"Page %i of %i", pageIndex + 1, paginatorView.numberOfPages];
	
	return view;
}

@end
